
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
import domain.Product;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	"classpath:spring/junit.xml"
})
@Transactional
public class ProductServiceTest extends AbstractTest {

	// Supporting services ----------------------------------------------------
	@Autowired
	ProductService			productService;

	@Autowired
	CategoryProductService	categoryProductService;

	@PersistenceContext
	EntityManager			entityManager;


	@Test
	public void driverCreate() {
		final Object testingData[][] = {
			{
				//Se edita un product correctamente
				"recycler1", "categoryProduct1", "title test", "description test", 20.0, "http://www.photoTest.com", null
			}
		};
		for (int i = 0; i < testingData.length; i++)
			this.templateCreate((String) testingData[i][0], super.getEntityId((String) testingData[i][1]), (String) testingData[i][2], (String) testingData[i][3], (double) testingData[i][4], (String) testingData[i][5], (Class<?>) testingData[i][6]);
	}

	private void templateCreate(final String username, final int categoryProductId, final String title, final String description, final double quantity, final String photo, final Class<?> expected) {
		Product product;
		Class<?> caught;

		caught = null;
		try {
			super.authenticate(username);
			product = this.productService.create();

			product.setTitle(title);
			product.setDescription(description);
			product.setQuantity(quantity);
			product.setPhoto(photo);
			product.setCategoryProducts(this.categoryProductService.findAll());
			product = this.productService.save(product);
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
