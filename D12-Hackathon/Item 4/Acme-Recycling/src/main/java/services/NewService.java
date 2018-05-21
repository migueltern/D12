
package services;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;

import repositories.NewRepository;
import domain.Comment;
import domain.Editor;
import domain.New;

@Service
@Transactional
public class NewService {

	// Managed repository -----------------------------------------------------
	@Autowired
	private NewRepository		newRepository;

	// Supporting services ----------------------------------------------------

	@Autowired
	private EditorService		editorService;

	@Autowired
	private CommentService		commentService;

	@Autowired
	private TabooWordService	tabooWordService;

	@Autowired
	private AdminService		adminService;

	//Importar la que pertenece a Spring
	@Autowired
	private Validator			validator;


	// Constructors -----------------------------------------------------------
	public NewService() {
		super();
	}

	// Simple CRUD methods ----------------------------------------------------

	public New create() {
		New result;
		Collection<Comment> comments;
		Date creationDate;

		comments = new ArrayList<Comment>();
		result = new New();
		creationDate = new Date();

		result.setComments(comments);
		result.setCreationDate(creationDate);

		return result;
	}

	public New save(final New new_) {
		New result;
		Assert.notNull(new_);
		Date createdMoment;
		Editor principal;

		principal = this.editorService.findByPrincipal();

		createdMoment = new Date(System.currentTimeMillis() - 1000);
		new_.setCreationDate(createdMoment);

		result = this.newRepository.save(new_);

		if (new_.getId() == 0)
			principal.getNews().add(result);

		return result;
	}

	public New saveA(final New new_) {
		New result;
		Assert.notNull(new_);
		Date createdMoment;

		createdMoment = new Date(System.currentTimeMillis() - 1000);
		new_.setCreationDate(createdMoment);

		result = this.newRepository.save(new_);

		return result;
	}

	public Collection<New> findAll() {
		Collection<New> result;

		result = this.newRepository.findAll();
		return result;
	}

	public New findOne(final int newId) {
		Assert.isTrue(newId != 0);

		New result;

		result = this.newRepository.findOne(newId);
		return result;
	}

	public void delete(New new_) {
		Assert.notNull(new_);
		Editor editor;

		editor = this.editorService.findByPrincipal();

		if (new_.getComments().size() != 0)
			for (final Comment c : new_.getComments())
				if (c.getCommentTo() == null)
					try {
						this.commentService.delete(c);
						this.newRepository.flush();
					} catch (final Throwable oops1) {
						System.out.println("oops1");
					}

		try {
			editor.getNews().remove(new_);
			this.newRepository.flush();
		} catch (final Throwable oops2) {
			System.out.println("oops2");
		}

		try {
			new_ = this.findOne(new_.getId());
			this.newRepository.delete(new_);
			this.newRepository.flush();
		} catch (final Throwable oops3) {
			System.out.println("oops3");
		}

		//editor.getNews().remove(new_);
		Collection<Comment> aux;
		aux = new ArrayList<Comment>();
		new_.setComments(aux);

		//this.newRepository.delete(new_);
	}
	public void deleteAdmin(final New new_) {
		Assert.notNull(new_);
		this.adminService.checkPrincipal();

		Editor editor;

		editor = this.editorService.findEditorByNew(new_.getId());

		editor.getNews().remove(new_);

		Collection<Comment> comments;

		comments = this.newRepository.findCommentsByNew(new_.getId());

		for (final Comment c : comments)
			this.commentService.delete(c);
		this.newRepository.delete(new_);
	}
	//Other business methods---------------------------------------------------

	//	RECONSTRUCTOR

	public New reconstruct(final New new_, final BindingResult bindingResult) {
		New result;
		New newBD;
		if (new_.getId() == 0) {

			Collection<Comment> comments;
			comments = new ArrayList<Comment>();
			new_.setComments(comments);
			result = new_;
		} else {
			newBD = this.newRepository.findOne(new_.getId());
			new_.setId(newBD.getId());
			new_.setVersion(newBD.getVersion());
			new_.setCreationDate(newBD.getCreationDate());

			if (new_.getComments() == null)
				new_.setComments(new ArrayList<Comment>());
			else
				new_.setComments(newBD.getComments());

			result = new_;
		}
		this.validator.validate(result, bindingResult);
		return result;
	}

	public Collection<Comment> findCommentsByNew(final int newId) {
		Collection<Comment> result;

		result = this.newRepository.findCommentsByNew(newId);

		return result;
	}

	//Para que los no autenticados solo vieran las 5 últimas noticias siempre.
	public Collection<New> findAllNewsInDescOrder() {
		Collection<New> result;
		final Page<New> resPage;
		final Pageable pageable;

		pageable = new PageRequest(0, 5);
		resPage = this.newRepository.findAllNewsInDescOrder(pageable);
		result = resPage.getContent();
		return result;
	}

	//Para las palabrá tabú
	public Collection<New> findNewsWithTabooWord(final String tabooWord) {
		Collection<New> result;

		result = this.newRepository.findNewsWithTabooWord(tabooWord);

		return result;
	}

	//	//Para listar todas las noticias con palabras tabú
	public Set<New> newWithTabooWord() {

		Set<New> result;
		Collection<String> tabooWords;
		Iterator<String> it;

		result = new HashSet<>();
		tabooWords = this.tabooWordService.findTabooWordByName();
		it = tabooWords.iterator();
		while (it.hasNext())
			result.addAll(this.findNewsWithTabooWord(it.next()));

		return result;

	}

	public New findNewByComment(final int commentId) {
		New result;

		result = this.newRepository.findNewByComment(commentId);

		return result;
	}

}
