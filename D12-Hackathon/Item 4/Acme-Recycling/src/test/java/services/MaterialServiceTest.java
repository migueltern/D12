
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
import domain.Material;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	"classpath:spring/junit.xml"
})
@Transactional
public class MaterialServiceTest extends AbstractTest {

	//Supporting services ----------------------------------------------------
	@Autowired
	LabelMaterialService	labelMaterialService;

	@Autowired
	ActorService			actorService;

	@Autowired
	AdminService			adminService;

	@PersistenceContext
	EntityManager			entityManager;

	@Autowired
	MaterialService			materialService;


	//8.g) Crear un material
	@Test
	public void driverCreateAndSave() {
		final Object testingData[][] = {
			{
				//El admin va a crear un material con todos los valores correctos.Esto debe ser positivo.
				"admin", "title test material", "description test material", 2.0, 2.9, "labelMaterial1", null

			}, {
				//Un manager no puede crear un material por tanto debe de dar error.
				"manager1", "title test material", "description test material", 2.0, 2.9, "labelMaterial1", IllegalArgumentException.class
			}, {
				//El admin va a crear un material con el titulo en blanco, esto debe dar un error de validacion.
				"admin", "", "description test material", 2.0, 2.9, "labelMaterial1", ConstraintViolationException.class
			}
		};
		for (int i = 0; i < testingData.length; i++)
			this.templateCreateAndSave((String) testingData[i][0], (String) testingData[i][1], (String) testingData[i][2], (Double) testingData[i][3], (Double) testingData[i][4], super.getEntityId((String) testingData[i][5]), (Class<?>) testingData[i][6]);
	}
	private void templateCreateAndSave(final String username, final String title, final String description, final Double unitPrice, final Double quantity, final int labelMaterialId, final Class<?> expected) {
		Class<?> caught;
		Material material;
		Material result;
		caught = null;

		try {
			super.authenticate(username);
			material = this.materialService.create();

			material.setTitle(title);
			material.setDescription(description);
			material.setUnitPrice(unitPrice);
			material.setQuantity(quantity);
			material.setLabelMaterial(this.labelMaterialService.findOne(labelMaterialId));
			result = this.materialService.save(material);
			Assert.notNull(result);
			this.materialService.flush();

		} catch (final Throwable oops) {
			caught = oops.getClass();
			//Se borra la cache para que no salte siempre el error del primer objeto que ha fallado en el test
			this.entityManager.clear();
		}

		this.checkExceptions(expected, caught);

		super.unauthenticate();
	}

	//8.g) Listar los materiales
	@Test
	public void driverList() {
		final Object testingData[][] = {
			{
				//Existen un total de 6 materiales en el sistema, por tanto debe ser positivo.
				"admin", 6, null
			}, {
				//No existen solamente 4 materiales en el sistema, por tanto debe ser negativo.
				"admin", 4, IllegalArgumentException.class
			}
		};
		for (int i = 0; i < testingData.length; i++)
			this.templateList(super.getEntityId((String) testingData[i][0]), (int) testingData[i][1], (Class<?>) testingData[i][2]);
	}

	private void templateList(final int usernameId, final int size, final Class<?> expected) {
		Class<?> caught;
		Actor actorConnected;
		actorConnected = this.actorService.findOne(usernameId);
		Collection<Material> materials;

		caught = null;
		try {
			super.authenticate(actorConnected.getUserAccount().getUsername());
			this.adminService.checkPrincipal();
			materials = this.materialService.findAll();
			Assert.isTrue(materials.size() == size);
			this.unauthenticate();
		} catch (final Throwable oops) {
			caught = oops.getClass();
		}
		this.checkExceptions(expected, caught);
	}

	//8.g) Editar un material
	@Test
	public void driverEdit() {
		final Object testingData[][] = {
			{
				//Se edita un material correctamente
				"admin", "material3", "title test positive", null
			}, {
				//Se edita un material incorrectamente
				"manager1", "material4", "title test negative", IllegalArgumentException.class
			}
		};
		for (int i = 0; i < testingData.length; i++)
			this.templateEdit((String) testingData[i][0], super.getEntityId((String) testingData[i][1]), (String) testingData[i][2], (Class<?>) testingData[i][3]);
	}

	private void templateEdit(final String username, final int materialId, final String title, final Class<?> expected) {
		Class<?> caught;
		Material material;
		Material result;

		caught = null;
		try {
			super.authenticate(username);
			material = this.materialService.findOne(materialId);
			material.setTitle(title);

			result = this.materialService.save(material);
			Assert.notNull(result);

			this.entityManager.flush();

		} catch (final Throwable oops) {
			caught = oops.getClass();
			//Se borra la cache para que no salte siempre el error del primer objeto que ha fallado en el test
			this.entityManager.clear();
		}

		this.checkExceptions(expected, caught);

		super.unauthenticate();
	}
	
		//1.b) Listar los materiales por parte de los no autenticados.
		@Test
		public void driverListNotAuthenticated() {
			final Object testingData[][] = {
				{
					//Existen un total de 6 materiales en el sistema, por tanto debe ser positivo.
					 6, null
				}, {
					//No existen solamente 4 materiales en el sistema, por tanto debe ser negativo.
					 4, IllegalArgumentException.class
				}
			};
			for (int i = 0; i < testingData.length; i++)
				this.templateListNotAuthenticated((int) testingData[i][0], (Class<?>) testingData[i][1]);
		}

		private void templateListNotAuthenticated(final int size, final Class<?> expected) {
			Class<?> caught;
			Collection<Material> materials;

			caught = null;
			try {
				materials = this.materialService.findAll();
				Assert.isTrue(materials.size() == size);
				this.unauthenticate();
			} catch (final Throwable oops) {
				caught = oops.getClass();
			}
			this.checkExceptions(expected, caught);
		}

}
