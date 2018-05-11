
package services;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.CarrierRepository;
import security.Authority;
import security.LoginService;
import security.UserAccount;
import domain.Carrier;

@Service
@Transactional
public class CarrierService {

	// Managed repository -----------------------------------------------------
	@Autowired
	private CarrierRepository	carrierRepository;


	// Supporting services ----------------------------------------------------

	// Constructors -----------------------------------------------------------
	public CarrierService() {
		super();
	}

	// Simple CRUD methods ----------------------------------------------------
	public Carrier create() {
		Carrier result;
		UserAccount userAccount;
		Authority authority;

		result = new Carrier();
		userAccount = new UserAccount();
		authority = new Authority();

		authority.setAuthority(Authority.CARRIER);
		userAccount.addAuthority(authority);
		result.setUserAccount(userAccount);

		return result;
	}

	public Collection<Carrier> findAll() {
		Collection<Carrier> result;
		result = this.carrierRepository.findAll();
		Assert.notNull(result);
		return result;
	}

	public Carrier findOne(final int carrierId) {
		Assert.isTrue(carrierId != 0);
		Carrier result;
		result = this.carrierRepository.findOne(carrierId);
		return result;
	}

	public Carrier save(final Carrier carrier) {
		Assert.notNull(carrier);
		Carrier result;
		Md5PasswordEncoder encoder;
		String passwordHash;

		if (carrier.getId() == 0) {
			final String password = carrier.getUserAccount().getPassword();
			encoder = new Md5PasswordEncoder();
			passwordHash = encoder.encodePassword(password, null);
			carrier.getUserAccount().setPassword(passwordHash);
		}
		result = this.carrierRepository.save(carrier);
		Assert.notNull(result);

		//TODO: METODO DE CREAR CARPETAS POR DEFECTO
		//if (carrier.getId() == 0)
		//this.messageFolderService.createDefaultMessageFolder(result);

		return result;
	}

	//Delete	------------------------------------------------------------
	public void delete(final Carrier carrier) {
		Assert.notNull(carrier);
		Assert.isTrue(carrier.getId() != 0);
		this.carrierRepository.delete(carrier);
	}

	// Other business methods -------------------------------------------------
	public Carrier findByPrincipal() {
		Carrier result;
		UserAccount userAccount;
		userAccount = LoginService.getPrincipal();
		Assert.notNull(userAccount);
		result = this.carrierRepository.findByUserAccountId(userAccount.getId());
		return result;
	}

	public void checkPrincipal() {

		final UserAccount userAccount = LoginService.getPrincipal();
		Assert.notNull(userAccount);

		final Collection<Authority> authorities = userAccount.getAuthorities();
		Assert.notNull(authorities);

		final Authority auth = new Authority();
		auth.setAuthority(Authority.CARRIER);

		Assert.isTrue(authorities.contains(auth));
	}

	public boolean checkPrincipalBoolean() {
		final UserAccount userAccount = LoginService.getPrincipal();
		Assert.notNull(userAccount);

		final Collection<Authority> authorities = userAccount.getAuthorities();
		Assert.notNull(authorities);

		final Authority auth = new Authority();
		auth.setAuthority(Authority.CARRIER);

		return (authorities.contains(auth));
	}
}
