
package services;

import java.util.Collection;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import javax.validation.ConstraintViolationException;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.Assert;

import utilities.AbstractTest;
import domain.Actor;
import domain.Item;
import domain.LabelProduct;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	"classpath:spring/junit.xml"
})
@Transactional
public class ItemServiceTest extends AbstractTest {

	// Supporting services ----------------------------------------------------
	@Autowired
	ItemService			itemService;

	@Autowired
	LabelProductService	categoryProductService;

	@Autowired
	ManagerService		managerService;

	@PersistenceContext
	EntityManager		entityManager;

	@Autowired
	ActorService		actorService;

	@Autowired
	LabelProductService	labelItemService;


	@Test
	public void driverCreateAndSave() {
		final Object testingData[][] = {
			{
				//Se edita un product correctamente
				"recycler1", "labelProduct1", "title test", "description test", 20.0, "http://www.photoTest.com", null
			}, {
				//Se edita un product correctamente
				"recycler1", "labelProduct1", null, "description test", 20.0, "http://www.photoTest.com", ConstraintViolationException.class
			}
		};
		for (int i = 0; i < testingData.length; i++)
			this.templateCreateAndSave((String) testingData[i][0], super.getEntityId((String) testingData[i][1]), (String) testingData[i][2], (String) testingData[i][3], (double) testingData[i][4], (String) testingData[i][5], (Class<?>) testingData[i][6]);
	}

	private void templateCreateAndSave(final String username, final int labelItemId, final String title, final String description, final double quantity, final String photo, final Class<?> expected) {
		Item item;
		Class<?> caught;
		LabelProduct labelItem;

		caught = null;
		try {
			super.authenticate(username);
			item = this.itemService.create();
			labelItem = this.labelItemService.findOne(labelItemId);

			item.setTitle(title);
			item.setDescription(description);
			item.setQuantity(quantity);
			item.setPhoto(photo);
			item.setLabelProduct(labelItem);
			item = this.itemService.save(item);
			this.entityManager.flush();

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
				//Se edita un product correctamente
				"recycler1", "item1", null
			}, {
				//Se edita un product correctamente
				"recycler1", "item3", IllegalArgumentException.class
			}
		};
		for (int i = 0; i < testingData.length; i++)
			this.templateDelete((String) testingData[i][0], super.getEntityId((String) testingData[i][1]), (Class<?>) testingData[i][2]);
	}

	private void templateDelete(final String username, final int itemId, final Class<?> expected) {
		Item item;
		Class<?> caught;

		caught = null;
		try {
			super.authenticate(username);
			item = this.itemService.findOne(itemId);
			this.itemService.delete(item);

			this.entityManager.flush();

		} catch (final Throwable oops) {
			caught = oops.getClass();
			//Se borra la cache para que no salte siempre el error del primer objeto que ha fallado en el test
			this.entityManager.clear();
		}

		this.checkExceptions(expected, caught);

		super.unauthenticate();
	}

	@Test
	public void driverFindItemsByRecycler() {
		final Object testingData[][] = {
			{

				"manager1", "recycler1", 1, null
			}, {

				"manager1", "recycler5", 3, IllegalArgumentException.class
			}
		};
		for (int i = 0; i < testingData.length; i++)
			this.templateFindItemsByRecycler(super.getEntityId((String) testingData[i][0]), super.getEntityId((String) testingData[i][1]), (int) testingData[i][2], (Class<?>) testingData[i][3]);
	}

	private void templateFindItemsByRecycler(final int usernameId, final int recyclerId, final int size, final Class<?> expected) {
		Class<?> caught;
		Actor actorConnected;
		actorConnected = this.actorService.findOne(usernameId);
		Collection<Item> items;

		caught = null;
		try {
			super.authenticate(actorConnected.getUserAccount().getUsername());
			items = this.itemService.findItemsByRecycler(recyclerId);
			Assert.isTrue(items.size() == size);
			this.unauthenticate();
		} catch (final Throwable oops) {
			caught = oops.getClass();
		}
		this.checkExceptions(expected, caught);
	}
}