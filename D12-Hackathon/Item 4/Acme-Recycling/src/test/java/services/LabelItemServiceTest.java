
package services;

import java.util.Collection;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.Assert;

import utilities.AbstractTest;
import domain.Actor;
import domain.LabelProduct;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	"classpath:spring/junit.xml"
})
@Transactional
public class LabelItemServiceTest extends AbstractTest {

	//Supporting services ----------------------------------------------------
	@Autowired
	LabelProductService	labelProductService;

	@Autowired
	ActorService		actorService;
	//
	//	@Autowired
	//	CategoryProductService	categoryProductService;
	//
	@PersistenceContext
	EntityManager		entityManager;


	@Test
	public void driverCreateAndSave() {
		final Object testingData[][] = {
			{
				//Se crea un chirp correctamenre estando logeado como user1
				"manager1", "prueba labelProduct", false, null

			}, {
				//Se crea un chirp incorrectamente ya que estamos logeados como admin
				"admin", "prueba labelProduct", false, IllegalArgumentException.class
			}
		};
		for (int i = 0; i < testingData.length; i++)
			this.templateCreateAndSave((String) testingData[i][0], (String) testingData[i][1], (Boolean) testingData[i][2], (Class<?>) testingData[i][3]);
	}
	private void templateCreateAndSave(final String username, final String name, final Boolean byDefault, final Class<?> expected) {
		Class<?> caught;
		LabelProduct labelProduct;
		caught = null;

		try {
			super.authenticate(username);
			labelProduct = this.labelProductService.create();

			labelProduct.setName(name);
			labelProduct.setByDefault(byDefault);
			labelProduct = this.labelProductService.save(labelProduct);
			this.labelProductService.flush();

		} catch (final Throwable oops) {
			caught = oops.getClass();
			//Se borra la cache para que no salte siempre el error del primer objeto que ha fallado en el test
			this.entityManager.clear();
		}

		this.checkExceptions(expected, caught);

		super.unauthenticate();
	}

	@Test
	public void driverDelete() {
		final Object testingData[][] = {
			{

				"manager1", "labelProduct11", null
			}, {

				"manager1", "labelProduct10", IllegalArgumentException.class
			}
		};
		for (int i = 0; i < testingData.length; i++)
			this.templateDelete((String) testingData[i][0], super.getEntityId((String) testingData[i][1]), (Class<?>) testingData[i][2]);
	}
	private void templateDelete(final String username, final int labelProductId, final Class<?> expected) {
		LabelProduct labelProduct;
		Class<?> caught;

		caught = null;
		try {
			super.authenticate(username);
			labelProduct = this.labelProductService.findOne(labelProductId);
			this.labelProductService.delete(labelProduct);

			this.labelProductService.flush();

		} catch (final Throwable oops) {
			caught = oops.getClass();
			//Se borra la cache para que no salte siempre el error del primer objeto que ha fallado en el test
			this.entityManager.clear();
		}

		this.checkExceptions(expected, caught);

		super.unauthenticate();
	}

	@Test
	public void driverList() {
		final Object testingData[][] = {
			{
				//El user 1 tiene 5 chirps en sus seguidores
				"manager1", 11, null
			}, {
				//El user 2 no tiene un total de 4 chirps asociadas a sus seguidores.
				"admin", 12, IllegalArgumentException.class
			}
		};
		for (int i = 0; i < testingData.length; i++)
			this.templateList(super.getEntityId((String) testingData[i][0]), (int) testingData[i][1], (Class<?>) testingData[i][2]);
	}

	private void templateList(final int usernameId, final int size, final Class<?> expected) {
		Class<?> caught;
		Actor actorConnected;
		actorConnected = this.actorService.findOne(usernameId);
		Collection<LabelProduct> labelItems;

		caught = null;
		try {
			super.authenticate(actorConnected.getUserAccount().getUsername());
			labelItems = this.labelProductService.findAll();
			Assert.isTrue(labelItems.size() == size);
			this.unauthenticate();
		} catch (final Throwable oops) {
			caught = oops.getClass();
		}
		this.checkExceptions(expected, caught);
	}

}
