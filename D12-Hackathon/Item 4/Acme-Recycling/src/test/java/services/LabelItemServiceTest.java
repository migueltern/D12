
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

	@PersistenceContext
	EntityManager		entityManager;

	@Autowired
	ManagerService		managerService;

	//4.a) Crear label product.
	@Test
	public void driverCreateAndSave() {
		final Object testingData[][] = {
			{
				//Se va a proceder a crear y guardar una etiqueta para producto con el manager1, esto debe ser posible
				"manager1", "prueba labelProduct", false, null

			}, {
				//Se va a proceder a crear una etiqueta para producto con el admin, este rol no debe poder crear etiquetas.
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

	//4.a) Borrar etiqueta de producto.
	@Test
	public void driverDelete() {
		final Object testingData[][] = {
			{
				//Se va a borrar la etiqueta de producto existente labelProduct11 con el manager1, esto deberia de dar positivo.
				"manager1", "labelProduct11", null
			}, {
				//Se va a borrar la etiqueta de producto existente labelProduct10 con el manager1, esto debe fallar puesto que esa etiqueta es por defecto
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

	//4.a) Listar las etiquetas de producto.
	@Test
	public void driverList() {
		final Object testingData[][] = {
			{
				//El manager1 tiene un total de 12 etiquetas para los productos por tanto debe ser positivo.
				"manager1", 12, null
			}, {
				//El manager1 no tiene 13 etiquetas para los productos, por tanto debe ser negativo.
				"manager1", 13, IllegalArgumentException.class
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
			this.managerService.checkPrincipal();
			labelItems = this.labelProductService.findAll();
			Assert.isTrue(labelItems.size() == size);
			this.unauthenticate();
		} catch (final Throwable oops) {
			caught = oops.getClass();
		}
		this.checkExceptions(expected, caught);
	}

	//4.a) Editar una etiqueta para producto.
	@Test
	public void driverEdit() {
		final Object testingData[][] = {
			{
				//Se edita una etiqueta para producto correctamente
				"manager1", "labelProduct11", "Label edited positive", null
			}, {
				//Se edita una etiqueta para producto incorrectamente.
				"manager1", "labelProduct3", "Label edited negative", IllegalArgumentException.class
			}
		};
		for (int i = 0; i < testingData.length; i++)
			this.templateEdit((String) testingData[i][0], super.getEntityId((String) testingData[i][1]), (String) testingData[i][2], (Class<?>) testingData[i][3]);
	}

	private void templateEdit(final String username, final int labelProductId, final String name, final Class<?> expected) {
		Class<?> caught;
		LabelProduct labelProduct;

		caught = null;
		try {
			super.authenticate(username);
			labelProduct = this.labelProductService.findOne(labelProductId);
			labelProduct.setName(name);

			this.labelProductService.save(labelProduct);

			this.entityManager.flush();

		} catch (final Throwable oops) {
			caught = oops.getClass();
			//Se borra la cache para que no salte siempre el error del primer objeto que ha fallado en el test
			this.entityManager.clear();
		}

		this.checkExceptions(expected, caught);

		super.unauthenticate();
	}

}
