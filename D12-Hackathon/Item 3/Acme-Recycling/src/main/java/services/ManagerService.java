
package services;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.ManagerRepository;
import security.Authority;
import security.LoginService;
import security.UserAccount;
import domain.Incidence;
import domain.Manager;
import domain.Request;

@Service
@Transactional
public class ManagerService {

	// Managed repository -----------------------------------------------------
	@Autowired
	private ManagerRepository	managerRepository;


	// Supporting services ----------------------------------------------------

	// Constructors -----------------------------------------------------------
	public ManagerService() {
		super();
	}

	// Simple CRUD methods ----------------------------------------------------
	public Manager create() {
		Manager result;
		UserAccount userAccount;
		Authority authority;
		Collection<Incidence> incidences;
		Collection<Request> requests;

		result = new Manager();
		userAccount = new UserAccount();
		authority = new Authority();
		incidences = new ArrayList<>();
		requests = new ArrayList<>();

		authority.setAuthority(Authority.MANAGER);
		userAccount.addAuthority(authority);
		result.setUserAccount(userAccount);
		result.setIncidences(incidences);
		result.setRequests(requests);
		return result;
	}

	public Collection<Manager> findAll() {
		Collection<Manager> result;
		result = this.managerRepository.findAll();
		Assert.notNull(result);
		return result;
	}

	public Manager findOne(final int managerId) {
		Assert.isTrue(managerId != 0);
		Manager result;
		result = this.managerRepository.findOne(managerId);
		return result;
	}

	public Manager save(final Manager manager) {
		Assert.notNull(manager);
		Manager result;
		Md5PasswordEncoder encoder;
		String passwordHash;

		if (manager.getId() == 0) {
			encoder = new Md5PasswordEncoder();
			passwordHash = encoder.encodePassword(manager.getUserAccount().getPassword(), null);
			manager.getUserAccount().setPassword(passwordHash);
		}
		result = this.managerRepository.save(manager);
		Assert.notNull(result);

		//TODO: Falta método creacion de carpetas por defecto
		//if (manager.getId() == 0)
		//this.messageFolderService.createDefaultMessageFolder(result);

		return result;
	}

	//Delete	------------------------------------------------------------
	public void delete(final Manager manager) {
		Assert.notNull(manager);
		Assert.isTrue(manager.getId() != 0);
		this.managerRepository.delete(manager);
	}

	// Other business methods -------------------------------------------------
	public Manager findByPrincipal() {
		Manager result;
		UserAccount userAccount;
		userAccount = LoginService.getPrincipal();
		Assert.notNull(userAccount);
		result = this.managerRepository.findByUserAccountId(userAccount.getId());
		return result;
	}

	public void checkPrincipal() {

		final UserAccount userAccount = LoginService.getPrincipal();
		Assert.notNull(userAccount);

		final Collection<Authority> authorities = userAccount.getAuthorities();
		Assert.notNull(authorities);

		final Authority auth = new Authority();
		auth.setAuthority(Authority.MANAGER);

		Assert.isTrue(authorities.contains(auth));
	}

	public boolean checkPrincipalBoolean() {
		final UserAccount userAccount = LoginService.getPrincipal();
		Assert.notNull(userAccount);

		final Collection<Authority> authorities = userAccount.getAuthorities();
		Assert.notNull(authorities);

		final Authority auth = new Authority();
		auth.setAuthority(Authority.MANAGER);

		return (authorities.contains(auth));
	}
}
