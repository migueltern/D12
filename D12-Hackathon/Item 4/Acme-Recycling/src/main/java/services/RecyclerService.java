
package services;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;

import repositories.RecyclerRepository;
import security.Authority;
import security.LoginService;
import security.UserAccount;
import domain.Comment;
import domain.Course;
import domain.Item;
import domain.Opinion;
import domain.Recycler;
import forms.RecyclerForm;

@Service
@Transactional
public class RecyclerService {

	// Managed repository -----------------------------------------------------
	@Autowired
	private RecyclerRepository	recyclerRepository;
	@Autowired
	private Validator			validator;


	// Supporting services ----------------------------------------------------

	// Constructors -----------------------------------------------------------
	public RecyclerService() {
		super();
	}

	// Simple CRUD methods ----------------------------------------------------
	public Recycler create() {
		Recycler result;
		UserAccount userAccount;
		Authority authority;
		final Collection<Item> items;
		final Collection<Comment> comments;
		final Collection<Course> courses;

		result = new Recycler();
		userAccount = new UserAccount();
		authority = new Authority();
		items = new ArrayList<>();
		comments = new ArrayList<>();
		courses = new ArrayList<>();

		authority.setAuthority(Authority.RECYCLER);
		userAccount.addAuthority(authority);
		result.setUserAccount(userAccount);
		result.setItems(items);
		result.setComments(comments);
		result.setCourses(courses);
		return result;
	}

	public Collection<Recycler> findAll() {
		Collection<Recycler> result;
		result = this.recyclerRepository.findAll();
		Assert.notNull(result);
		return result;
	}

	public Recycler findOne(final int recyclerId) {
		Assert.isTrue(recyclerId != 0);
		Recycler result;
		result = this.recyclerRepository.findOne(recyclerId);
		return result;
	}

	public Recycler save(final Recycler recycler) {
		Assert.notNull(recycler);
		Recycler result;
		Md5PasswordEncoder encoder;
		String passwordHash;

		if (recycler.getId() == 0) {
			encoder = new Md5PasswordEncoder();
			passwordHash = encoder.encodePassword(recycler.getUserAccount().getPassword(), null);
			recycler.getUserAccount().setPassword(passwordHash);
		}
		result = this.recyclerRepository.save(recycler);
		Assert.notNull(result);

		//TODO: Falta método creacion de carpetas por defecto
		//if (recycler.getId() == 0)
		//this.messageFolderService.createDefaultMessageFolder(result);

		return result;
	}

	//Delete	------------------------------------------------------------
	public void delete(final Recycler recycler) {
		Assert.notNull(recycler);
		Assert.isTrue(recycler.getId() != 0);
		this.recyclerRepository.delete(recycler);
	}

	// Other business methods -------------------------------------------------
	public Recycler findByPrincipal() {
		Recycler result;
		UserAccount userAccount;
		userAccount = LoginService.getPrincipal();
		Assert.notNull(userAccount);
		result = this.recyclerRepository.findByUserAccountId(userAccount.getId());
		return result;
	}

	public void checkPrincipal() {

		final UserAccount userAccount = LoginService.getPrincipal();
		Assert.notNull(userAccount);

		final Collection<Authority> authorities = userAccount.getAuthorities();
		Assert.notNull(authorities);

		final Authority auth = new Authority();
		auth.setAuthority(Authority.RECYCLER);

		Assert.isTrue(authorities.contains(auth));
	}

	public boolean checkPrincipalBoolean() {
		final UserAccount userAccount = LoginService.getPrincipal();
		Assert.notNull(userAccount);

		final Collection<Authority> authorities = userAccount.getAuthorities();
		Assert.notNull(authorities);

		final Authority auth = new Authority();
		auth.setAuthority(Authority.RECYCLER);

		return (authorities.contains(auth));
	}

	public RecyclerForm reconstruct(final RecyclerForm recyclerForm, final BindingResult binding) {

		RecyclerForm result = null;
		Recycler recycler;
		recycler = recyclerForm.getRecycler();

		if (recycler.getId() == 0) {
			UserAccount userAccount;
			Authority authority;
			final Collection<Item> items;
			final Collection<Comment> comments;
			final Collection<Course> courses;
			final Collection<Opinion> opinions;

			userAccount = recyclerForm.getRecycler().getUserAccount();
			authority = new Authority();
			authority.setAuthority(Authority.RECYCLER);
			userAccount.addAuthority(authority);
			recyclerForm.getRecycler().setUserAccount(userAccount);
			items = new ArrayList<>();
			comments = new ArrayList<>();
			courses = new ArrayList<>();
			opinions = new ArrayList<>();
			recyclerForm.getRecycler().setItems(items);
			recyclerForm.getRecycler().setComments(comments);
			recyclerForm.getRecycler().setCourses(courses);
			recyclerForm.getRecycler().setOpinions(opinions);
			result = recyclerForm;

		} else {

			recycler = this.recyclerRepository.findOne(recyclerForm.getRecycler().getId());
			recyclerForm.getRecycler().setId(recycler.getId());
			recyclerForm.getRecycler().setVersion(recycler.getVersion());
			recyclerForm.getRecycler().setUserAccount(recycler.getUserAccount());
			recyclerForm.getRecycler().setItems(recycler.getItems());
			recyclerForm.getRecycler().setComments(recycler.getComments());
			recyclerForm.getRecycler().setCourses(recycler.getCourses());
			recyclerForm.getRecycler().setOpinions(recycler.getOpinions());

			result = recyclerForm;

		}

		this.validator.validate(result, binding);

		return result;

	}

	public void flush() {
		this.recyclerRepository.flush();
	}

	//Encontrar todos los comentarios del reciclador que est· logueado
	public Collection<Comment> findAllCommentsByRecycler() {
		Collection<Comment> result;
		Recycler recycler;

		recycler = this.findByPrincipal();

		result = this.recyclerRepository.findAllCommentsByRecycler(recycler.getId());

		return result;
	}

	public Recycler findRecyclerByComment(final int commentId) {
		final Recycler recycler;

		recycler = this.recyclerRepository.findRecyclerByComment(commentId);

		return recycler;
	}

}
