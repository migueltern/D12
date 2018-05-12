
package services;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;

import repositories.AdminRepository;
import security.Authority;
import security.LoginService;
import security.UserAccount;
import domain.Admin;
import forms.AdminForm;

@Service
@Transactional
public class AdminService {

	// Managed repository -----------------------------------------------------
	@Autowired
	private AdminRepository	adminRepository;
	@Autowired
	private Validator		validator;


	// Supporting services ----------------------------------------------------

	// Constructors -----------------------------------------------------------
	public AdminService() {
		super();
	}

	// Simple CRUD methods ----------------------------------------------------
	public Admin create() {
		Admin result;
		UserAccount userAccount;
		Authority authority;

		result = new Admin();
		userAccount = new UserAccount();
		authority = new Authority();

		authority.setAuthority(Authority.ADMIN);
		userAccount.addAuthority(authority);
		result.setUserAccount(userAccount);

		return result;
	}

	public Collection<Admin> findAll() {
		Collection<Admin> result;
		result = this.adminRepository.findAll();
		Assert.notNull(result);
		return result;
	}

	public Admin findOne(final int adminId) {
		Assert.isTrue(adminId != 0);
		Admin result;
		result = this.adminRepository.findOne(adminId);
		return result;
	}

	public Admin save(final Admin admin) {
		Assert.notNull(admin);
		Admin result;
		Md5PasswordEncoder encoder;
		String passwordHash;

		if (admin.getId() == 0) {
			final String password = admin.getUserAccount().getPassword();
			encoder = new Md5PasswordEncoder();
			passwordHash = encoder.encodePassword(password, null);
			admin.getUserAccount().setPassword(passwordHash);
		}
		result = this.adminRepository.save(admin);
		Assert.notNull(result);

		//TODO: METODO DE CREAR CARPETAS POR DEFECTO
		//if (admin.getId() == 0)
		//this.messageFolderService.createDefaultMessageFolder(result);

		return result;
	}

	// Other business methods -------------------------------------------------
	public Admin findByPrincipal() {
		Admin result;
		UserAccount userAccount;
		userAccount = LoginService.getPrincipal();
		Assert.notNull(userAccount);
		result = this.adminRepository.findByUserAccountId(userAccount.getId());
		return result;
	}

	public void checkPrincipal() {

		final UserAccount userAccount = LoginService.getPrincipal();
		Assert.notNull(userAccount);

		final Collection<Authority> authorities = userAccount.getAuthorities();
		Assert.notNull(authorities);

		final Authority auth = new Authority();
		auth.setAuthority(Authority.ADMIN);

		Assert.isTrue(authorities.contains(auth));
	}

	public boolean checkPrincipalBoolean() {
		final UserAccount userAccount = LoginService.getPrincipal();
		Assert.notNull(userAccount);

		final Collection<Authority> authorities = userAccount.getAuthorities();
		Assert.notNull(authorities);

		final Authority auth = new Authority();
		auth.setAuthority(Authority.ADMIN);

		return (authorities.contains(auth));
	}

	public AdminForm reconstruct(final AdminForm adminForm, final BindingResult bindingResult) {
		final AdminForm result;
		final Admin adminBD;

		if (adminForm.getAdministrator().getId() == 0) {
			UserAccount userAccount;
			Authority authority;

			userAccount = adminForm.getAdministrator().getUserAccount();
			authority = new Authority();
			authority.setAuthority(Authority.ADMIN);
			userAccount.addAuthority(authority);
			adminForm.getAdministrator().setUserAccount(userAccount);
			result = adminForm;
		} else {
			adminBD = this.adminRepository.findOne(adminForm.getAdministrator().getId());
			adminForm.getAdministrator().setId(adminBD.getId());
			adminForm.getAdministrator().setVersion(adminBD.getVersion());
			adminForm.getAdministrator().setUserAccount(adminBD.getUserAccount());
			result = adminForm;
		}
		this.validator.validate(result, bindingResult);
		return result;
	}

	public void flush() {
		this.adminRepository.flush();
	}

}
