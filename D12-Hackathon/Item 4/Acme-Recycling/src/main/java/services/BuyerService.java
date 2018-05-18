
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

import repositories.BuyerRepository;
import security.Authority;
import security.LoginService;
import security.UserAccount;
import domain.Buy;
import domain.Buyer;
import domain.Course;
import domain.Opinion;
import forms.BuyerForm;

@Service
@Transactional
public class BuyerService {

	// Managed repository -----------------------------------------------------
	@Autowired
	private BuyerRepository	buyerRepository;
	@Autowired
	private Validator		validator;

	@Autowired
	FinderService			finderService;


	// Supporting services ----------------------------------------------------

	// Constructors -----------------------------------------------------------
	public BuyerService() {
		super();
	}

	// Simple CRUD methods ----------------------------------------------------
	public Buyer create() {
		Buyer result;
		UserAccount userAccount;
		Authority authority;
		final Collection<Buy> buys;
		final Collection<Course> courses;

		result = new Buyer();
		userAccount = new UserAccount();
		authority = new Authority();
		buys = new ArrayList<>();
		courses = new ArrayList<>();

		authority.setAuthority(Authority.BUYER);
		userAccount.addAuthority(authority);
		result.setUserAccount(userAccount);
		result.setBuys(buys);
		result.setCourses(courses);
		return result;
	}

	public Collection<Buyer> findAll() {
		Collection<Buyer> result;
		result = this.buyerRepository.findAll();
		Assert.notNull(result);
		return result;
	}

	public Buyer findOne(final int buyerId) {
		Assert.isTrue(buyerId != 0);
		Buyer result;
		result = this.buyerRepository.findOne(buyerId);
		return result;
	}

	public Buyer save(final Buyer buyer) {
		Assert.notNull(buyer);
		Buyer result;
		Md5PasswordEncoder encoder;
		String passwordHash;

		if (buyer.getId() == 0) {
			encoder = new Md5PasswordEncoder();
			passwordHash = encoder.encodePassword(buyer.getUserAccount().getPassword(), null);
			buyer.getUserAccount().setPassword(passwordHash);
		}

		//		if (buyer.getFinder() == null) {
		//			Finder finder;
		//
		//			finder = this.finderService.create();
		//			finder = this.finderService.save(finder);
		//			buyer.setFinder(finder);
		//			result = this.buyerRepository.save(buyer);
		//		} else
		result = this.buyerRepository.save(buyer);

		Assert.notNull(result);

		//TODO: Falta método creacion de carpetas por defecto
		//if (buyer.getId() == 0)
		//this.messageFolderService.createDefaultMessageFolder(result);

		return result;
	}

	//Delete	------------------------------------------------------------
	public void delete(final Buyer buyer) {
		Assert.notNull(buyer);
		Assert.isTrue(buyer.getId() != 0);
		this.buyerRepository.delete(buyer);
	}

	// Other business methods -------------------------------------------------
	public Buyer findByPrincipal() {
		Buyer result;
		UserAccount userAccount;
		userAccount = LoginService.getPrincipal();
		Assert.notNull(userAccount);
		result = this.buyerRepository.findByBuyerAccountId(userAccount.getId());
		return result;
	}

	public Buyer findBuyerByCourse(final Course course) {
		Buyer result;

		result = this.buyerRepository.findBuyerByCourse(course.getId());

		return result;
	}

	public void checkPrincipal() {

		final UserAccount userAccount = LoginService.getPrincipal();
		Assert.notNull(userAccount);

		final Collection<Authority> authorities = userAccount.getAuthorities();
		Assert.notNull(authorities);

		final Authority auth = new Authority();
		auth.setAuthority(Authority.BUYER);

		Assert.isTrue(authorities.contains(auth));
	}

	public boolean checkPrincipalBoolean() {
		final UserAccount userAccount = LoginService.getPrincipal();
		Assert.notNull(userAccount);

		final Collection<Authority> authorities = userAccount.getAuthorities();
		Assert.notNull(authorities);

		final Authority auth = new Authority();
		auth.setAuthority(Authority.BUYER);

		return (authorities.contains(auth));
	}

	public BuyerForm reconstruct(final BuyerForm buyerForm, final BindingResult binding) {

		BuyerForm result = null;
		Buyer buyer;
		buyer = buyerForm.getBuyer();

		if (buyer.getId() == 0) {
			UserAccount userAccount;
			Authority authority;
			final Collection<Buy> buys;
			final Collection<Course> courses;
			final Collection<Opinion> opinions;

			userAccount = buyerForm.getBuyer().getUserAccount();
			authority = new Authority();
			authority.setAuthority(Authority.BUYER);
			userAccount.addAuthority(authority);
			buyerForm.getBuyer().setUserAccount(userAccount);
			buys = new ArrayList<>();
			courses = new ArrayList<>();
			opinions = new ArrayList<>();
			buyerForm.getBuyer().setBuys(buys);
			buyerForm.getBuyer().setCourses(courses);
			buyerForm.getBuyer().setOpinions(opinions);
			result = buyerForm;

		} else {

			buyer = this.buyerRepository.findOne(buyerForm.getBuyer().getId());
			buyerForm.getBuyer().setId(buyer.getId());
			buyerForm.getBuyer().setVersion(buyer.getVersion());
			buyerForm.getBuyer().setUserAccount(buyer.getUserAccount());
			buyerForm.getBuyer().setBuys(buyer.getBuys());
			buyerForm.getBuyer().setCourses(buyer.getCourses());
			buyerForm.getBuyer().setOpinions(buyer.getOpinions());

			result = buyerForm;

		}

		this.validator.validate(result, binding);

		return result;

	}

	public void flush() {
		this.buyerRepository.flush();
	}
}
