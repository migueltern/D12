
package services;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
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
	private NewRepository	newRepository;

	// Supporting services ----------------------------------------------------

	@Autowired
	private EditorService	editorService;

	//Importar la que pertenece a Spring
	@Autowired
	private Validator		validator;


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

	public void delete(final New new_) {
		Assert.notNull(new_);
		Editor editor;

		editor = this.editorService.findByPrincipal();

		editor.getNews().remove(new_);

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

}
