
package services;

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
import domain.Recycler;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	"classpath:spring/junit.xml"
})
@Transactional
public class CourseServiceTest extends AbstractTest {

	//Supporting services ----------------------------------------------------
	@Autowired
	LabelProductService	labelProductService;

	@Autowired
	ActorService		actorService;

	@Autowired
	CourseService		courseService;

	@Autowired
	RecyclerService		recyclerService;

	@PersistenceContext
	EntityManager		entityManager;

	@Autowired
	ManagerService		managerService;


	@Test
	public void driverAssist() {
		final Object testingData[][] = {
			{

				"recycler1", "course1", null

			}, {

				"recycler1", "course2", IllegalArgumentException.class
			}
		};
		for (int i = 0; i < testingData.length; i++)
			this.templateAssist((String) testingData[i][0], super.getEntityId((String) testingData[i][1]), (Class<?>) testingData[i][2]);
	}
	private void templateAssist(final String username, final int courseId, final Class<?> expected) {
		Class<?> caught;
		Course course;
		caught = null;
		Recycler recyclerConnected;

		try {
			super.authenticate(username);
			course = this.courseService.findOne(courseId);
			this.courseService.assist(course);
			recyclerConnected = this.recyclerService.findByPrincipal();
			Assert.isTrue(recyclerConnected.getCourses().contains(course));

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
	public void driverNotAssist() {
		final Object testingData[][] = {
			{

				"recycler1", "course5", null

			}, {

				"recycler1", "course2", IllegalArgumentException.class
			}
		};
		for (int i = 0; i < testingData.length; i++)
			this.templateNotAssist((String) testingData[i][0], super.getEntityId((String) testingData[i][1]), (Class<?>) testingData[i][2]);
	}
	private void templateNotAssist(final String username, final int courseId, final Class<?> expected) {
		Class<?> caught;
		Course course;
		caught = null;
		Recycler recyclerConnected;

		try {
			super.authenticate(username);
			course = this.courseService.findOne(courseId);
			this.courseService.notAssist(course);
			recyclerConnected = this.recyclerService.findByPrincipal();
			Assert.isTrue(!recyclerConnected.getCourses().contains(course));

			this.labelProductService.flush();

		} catch (final Throwable oops) {
			caught = oops.getClass();
			//Se borra la cache para que no salte siempre el error del primer objeto que ha fallado en el test
			this.entityManager.clear();
		}

		this.checkExceptions(expected, caught);

		super.unauthenticate();
	}

}
