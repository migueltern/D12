
package services;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import utilities.AbstractTest;
import domain.Opinion;
import domain.Product;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	"classpath:spring/junit.xml"
})
@Transactional
public class OpinionServiceTest extends AbstractTest {

	// Supporting services ----------------------------------------------------
	@Autowired
	OpinionService	opinionService;

	@Autowired
	ProductService	productService;

	@PersistenceContext
	EntityManager	entityManager;


	@Test
	public void driverCreate() {
		final Object testingData[][] = {
			{
				//Se crea una opinion sobre un producto correctamente
				"manager1", "product1", "title test", "comment test", null
			}
		};
		for (int i = 0; i < testingData.length; i++)
			this.templateCreate((String) testingData[i][0], super.getEntityId((String) testingData[i][1]), (String) testingData[i][2], (String) testingData[i][3], (Class<?>) testingData[i][4]);
	}

	private void templateCreate(final String username, final int productId, final String title, final String comment, final Class<?> expected) {
		Opinion opinion;
		Product product;
		Class<?> caught;

		caught = null;
		try {
			super.authenticate(username);
			opinion = this.opinionService.create();

			product = this.productService.findOne(productId);

			opinion.setOpinable(product);
			opinion.setTitle(title);
			opinion.setComment(comment);

			opinion = this.opinionService.save(opinion);
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
