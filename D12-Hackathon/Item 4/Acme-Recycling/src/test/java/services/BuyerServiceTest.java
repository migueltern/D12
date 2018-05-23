
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
import domain.Buyer;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	"classpath:spring/junit.xml"
})
@Transactional
public class BuyerServiceTest extends AbstractTest {

	// Supporting services ---------------------------------------------------
	@Autowired
	private BuyerService	buyerService;

	@PersistenceContext
	EntityManager			entityManager;


	//Login 
	@Test
	public void driveLoginBuyer() {

		final Object testingData[][] = {
			//Admin is registered
			{
				"buyer1", null
			},
			//Admin isn't registered
			{
				"buyerNoRegistrado", IllegalArgumentException.class
			}
		};

		for (int i = 0; i < testingData.length; i++)
			this.templateLoginBuyer((String) testingData[i][0], (Class<?>) testingData[i][1]);

	}

	public void templateLoginBuyer(final String username, final Class<?> expected) {

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

	//Test caso de uso 1.a:Register to the system as a buyer
	@Test
	public void driverCreateAndSave() {

		final Object testingData[][] = {
			{
				//Registrar buyer correctamente(poniendo tel�fono!=null)
				"buyertest1", "passwordtest1", "miguel", "ternero", "calle Huertas n� 3", "662657322", "Email@email.com", "SEVILLA", null
			}, {
				//Registrar buyer incorrectamente con name en blanco
				"buyertest2", "passwordtest2", "", "ternero", "calle Huertas n� 3", "662657322", "Email@email.com", "SEVILLA", javax.validation.ConstraintViolationException.class
			}, {
				//Registrar buyer con surname en blanco
				"buyertest3", "passwordtest3", "miguel", "", "calle Huertas n� 3", "662657322", "Email@email.com", "SEVILLA", javax.validation.ConstraintViolationException.class
			}, {
				//Registrar buyer incorrectamente con un email no v�lido
				"buyertest4", "passwordtest4", "miguel", "ternero", "calle Huertas n� 3", "662657322", "Email", "SEVILLA", javax.validation.ConstraintViolationException.class
			}, {
				//Registrar buyer incorrectamente ya que est� registrado
				"buyertest4", "passwordtest4", "miguel", "ternero", "calle Huertas n� 3", "662657322", "Email@gmail.com", "SEVILLA", org.springframework.dao.DataIntegrityViolationException.class
			}, {
				//Registrar buyer correctamente con n�mero de tel�fono vac�o
				"buyertest9", "passwordtest9", "name1", "surname1", "calle Huertas n� 3", "662657322", "maria@gmail.com", "SEVILLA", null

			}
		};
		for (int i = 0; i < testingData.length; i++)
			this.templateCreateAndSave((String) testingData[i][0], (String) testingData[i][1], (String) testingData[i][2], (String) testingData[i][3], (String) testingData[i][4], (String) testingData[i][5], (String) testingData[i][6],
				(String) testingData[i][7], (Class<?>) testingData[i][8]);
	}
	private void templateCreateAndSave(final String username, final String password, final String name, final String surname, final String postalAdress, final String phone, final String email, final String province, final Class<?> expected) {
		Class<?> caught;
		Buyer buyer;
		UserAccount userAccount;

		caught = null;
		try {
			buyer = this.buyerService.create();
			buyer.setName(name);
			buyer.setSurname(surname);
			buyer.setAddress(postalAdress);
			buyer.setPhone(phone);
			buyer.setEmail(email);
			buyer.setProvince(province);
			userAccount = buyer.getUserAccount();
			userAccount.setUsername(username);
			userAccount.setPassword(password);
			buyer.setUserAccount(userAccount);
			buyer = this.buyerService.save(buyer);
			this.buyerService.flush();
		} catch (final Throwable oops) {
			caught = oops.getClass();
			//Se borra la cache para que no salte siempre el error del primer objeto que ha fallado en el test
			this.entityManager.clear();

		}

		this.checkExceptions(expected, caught);

	}

}
