
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
import domain.Course;
import domain.Item;
import domain.Opinion;

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
	ItemService		itemService;

	@Autowired
	CourseService	courseService;

	@Autowired
	RecyclerService	recyclerService;

	@PersistenceContext
	EntityManager	entityManager;


	//Caso de uso 2.d : Listar las opiniones de un ítem, pero los no autenticados no podrán crearlas.
	@Test
	public void driverListItemNonAuthenticated() {
		final Object testingData[][] = {
			{

				//Listar las opiniones del item1 y comprobar que la opinion1 pertenece al item1
				"item1", "opinion1", null
			}, {
				//Listar las opiniones del item1 y comprobar que la opinion1 NO pertenece al item2
				"item2", "opinion1", IllegalArgumentException.class
			}
		};
		for (int i = 0; i < testingData.length; i++)
			this.templateListItemNonAuthenticated(super.getEntityId((String) testingData[i][0]), super.getEntityId((String) testingData[i][1]), (Class<?>) testingData[i][2]);
	}

	private void templateListItemNonAuthenticated(final int itemId, final int opinionId, final Class<?> expected) {
		Class<?> caught;
		final Item item;
		Opinion opinion;
		final Collection<Opinion> opinions;

		caught = null;
		try {
			item = this.itemService.findOne(itemId);
			opinion = this.opinionService.findOne(opinionId);
			opinions = item.getOpinions();
			Assert.isTrue(opinions.contains(opinion));
		} catch (final Throwable oops) {
			caught = oops.getClass();
		}
		this.checkExceptions(expected, caught);
	}

	//Caso de uso 2.e : Listar los cursos y ver las opiniones de éstos. Solo los recicladores podrán escribir las opiniones de los cursos a los que accede.
	@Test
	public void driverListCourseNonAuthenticated() {
		final Object testingData[][] = {
			{

				//Listar las opiniones del course3 y comprobar que la opinion8 pertenece al course3
				"course3", "opinion8", null
			}, {
				//Listar las opiniones del course1 y comprobar que la opinion8 NO pertenece al course3
				"course1", "opinion8", IllegalArgumentException.class
			}
		};
		for (int i = 0; i < testingData.length; i++)
			this.templateListCourseNonAuthenticated(super.getEntityId((String) testingData[i][0]), super.getEntityId((String) testingData[i][1]), (Class<?>) testingData[i][2]);
	}

	private void templateListCourseNonAuthenticated(final int courseId, final int opinionId, final Class<?> expected) {
		Class<?> caught;
		final Course course;
		Opinion opinion;
		final Collection<Opinion> opinions;

		caught = null;
		try {
			course = this.courseService.findOne(courseId);
			opinion = this.opinionService.findOne(opinionId);
			opinions = course.getOpinions();
			Assert.isTrue(opinions.contains(opinion));
		} catch (final Throwable oops) {
			caught = oops.getClass();
		}
		this.checkExceptions(expected, caught);
	}

	//	@Test
	//	public void driverCreate() {
	//		final Object testingData[][] = {
	//			{
	//				//Se crea una opinion sobre un item correctamente
	//				"manager1", "item1", "title test", "comment test", null
	//			}
	//		};
	//		for (int i = 0; i < testingData.length; i++)
	//			this.templateCreate((String) testingData[i][0], super.getEntityId((String) testingData[i][1]), (String) testingData[i][2], (String) testingData[i][3], (Class<?>) testingData[i][4]);
	//	}
	//
	//	private void templateCreate(final String username, final int itemId, final String title, final String comment, final Class<?> expected) {
	//		Opinion opinion;
	//		Item item;
	//		Class<?> caught;
	//
	//		caught = null;
	//		try {
	//			super.authenticate(username);
	//			opinion = this.opinionService.create();
	//
	//			item = this.itemService.findOne(itemId);
	//
	//			opinion.setOpinable(item);
	//			opinion.setTitle(title);
	//			opinion.setComment(comment);
	//			opinion.setPhoto("http://www.photo.com");
	//			opinion.setCaption("caption");
	//
	//			opinion = this.opinionService.save(opinion);
	//			this.entityManager.flush();
	//
	//		} catch (final Throwable oops) {
	//			caught = oops.getClass();
	//			//Se borra la cache para que no salte siempre el error del primer objeto que ha fallado en el test
	//			this.entityManager.clear();
	//		}
	//
	//		this.checkExceptions(expected, caught);
	//
	//		super.unauthenticate();
	//	}

}
