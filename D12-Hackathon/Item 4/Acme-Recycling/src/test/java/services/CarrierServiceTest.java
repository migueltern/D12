
package services;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import security.UserAccount;
import utilities.AbstractTest;
import domain.Admin;
import domain.Carrier;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	"classpath:spring/junit.xml"
})
@Transactional
public class CarrierServiceTest extends AbstractTest {

	// Supporting services ---------------------------------------------------
	@Autowired
	private CarrierService	carrierService;

	@Autowired
	private AdminService	adminService;

	@PersistenceContext
	EntityManager			entityManager;


	//Login 
	@Test
	public void driveLoginCarrier() {

		final Object testingData[][] = {
			//Admin is registered
			{
				"carrier1", null
			},
			//Admin isn't registered
			{
				"carrierNoRegistrado", IllegalArgumentException.class
			}
		};

		for (int i = 0; i < testingData.length; i++)
			this.templateLoginCarrier((String) testingData[i][0], (Class<?>) testingData[i][1]);
	}

	public void templateLoginCarrier(final String username, final Class<?> expected) {

		Class<?> caught;

		caught = null;

		try {
			this.authenticate(username);
			this.unauthenticate();
		} catch (final Throwable oops) {
			caught = oops.getClass();
			this.entityManager.clear();
		}

		this.checkExceptions(expected, caught);
		super.unauthenticate();
	}

	//Test caso de uso 8.a: Crear cuentas para nuevos carrier
	@Test
	public void driverCreateAndSave() {
		final Object testingData[][] = {
			{
				//Registrar carrier correctamente(poniendo teléfono!=null)
				"carriertest1", "passwordtest1", "miguel", "ternero", "calle Huertas nº 3", "662657322", "Email@email.com", "SEVILLA", null
			}, {
				//Registrar carrier incorrectamente con name en blanco
				"carriertest2", "passwordtest2", "", "ternero", "calle Huertas nº 3", "662657322", "Email@email.com", "SEVILLA", javax.validation.ConstraintViolationException.class
			}, {
				//Registrar carrier con surname en blanco
				"carriertest3", "passwordtest3", "miguel", "", "calle Huertas nº 3", "662657322", "Email@email.com", "SEVILLA", javax.validation.ConstraintViolationException.class
			}, {
				//Registrar carrier incorrectamente con un email no válido
				"carriertest4", "passwordtest4", "miguel", "ternero", "calle Huertas nº 3", "662657322", "Email", "SEVILLA", javax.validation.ConstraintViolationException.class
			}, {
				//Registrar carrier incorrectamente ya que está registrado
				"carriertest4", "passwordtest4", "miguel", "ternero", "calle Huertas nº 3", "662657322", "Email@gmail.com", "SEVILLA", org.springframework.dao.DataIntegrityViolationException.class
			}, {
				//Registrar carrier correctamente con número de teléfono vacío
				"carriertest9", "passwordtest9", "name1", "surname1", "calle Huertas nº 3", "662657322", "maria@gmail.com", "SEVILLA", null

			}
		};
		for (int i = 0; i < testingData.length; i++)
			this.templateCreateAndSave((String) testingData[i][0], (String) testingData[i][1], (String) testingData[i][2], (String) testingData[i][3], (String) testingData[i][4], (String) testingData[i][5], (String) testingData[i][6],
				(String) testingData[i][7], (Class<?>) testingData[i][8]);
	}

	private void templateCreateAndSave(final String username, final String password, final String name, final String surname, final String postalAdress, final String phone, final String email, final String province, final Class<?> expected) {
		Class<?> caught;
		Carrier carrier;
		Admin adminConnected;
		Integer adminId;
		adminId = super.getEntityId("admin");

		UserAccount userAccount;
		adminConnected = this.adminService.findOne(adminId);
		caught = null;
		try {
			super.authenticate(adminConnected.getUserAccount().getUsername());
			carrier = this.carrierService.create();
			carrier.setName(name);
			carrier.setSurname(surname);
			carrier.setAddress(postalAdress);
			carrier.setPhone(phone);
			carrier.setEmail(email);
			carrier.setProvince(province);
			userAccount = carrier.getUserAccount();
			userAccount.setUsername(username);
			userAccount.setPassword(password);
			carrier.setUserAccount(userAccount);
			carrier = this.carrierService.save(carrier);
			this.carrierService.flush();
		} catch (final Throwable oops) {
			caught = oops.getClass();
			//Se borra la cache para que no salte siempre el error del primer objeto que ha fallado en el test
			this.entityManager.clear();
		}

		this.checkExceptions(expected, caught);
	}

}
