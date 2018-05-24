
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
import domain.Buyer;
import domain.Course;
import domain.Lesson;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	"classpath:spring/junit.xml"
})
@Transactional
public class LessonServiceTest extends AbstractTest {

	// Supporting services ----------------------------------------------------
	@Autowired
	LessonService	lessonService;

	@Autowired
	BuyerService	buyerService;
	@Autowired
	CourseService	courseService;

	@PersistenceContext
	EntityManager	entityManager;


	//Test caso de uso 6.e-I: Listar las lecciones para un curso.
	@Test
	public void driverList() {

		final Object testingData[][] = {
			{
				//Mostrar listado de las lecciones para el curso 2 como buyer 2 estando la lección 2
				"buyer2", "course2", "lesson2", null
			}, {
				//Mostrar listado de las lecciones para el curso 2 como buyer 2 NO estando la lección 3 en este curso
				"buyer2", "course2", "lesson3", IllegalArgumentException.class
			}, {
				//Mostrar listado de las lecciones para el curso 4 como buyer 4 estando la lección 4
				"buyer4", "course4", "lesson4", null
			}
		};
		for (int i = 0; i < testingData.length; i++)
			this.templateList(super.getEntityId((String) testingData[i][0]), super.getEntityId((String) testingData[i][1]), super.getEntityId((String) testingData[i][2]), (Class<?>) testingData[i][3]);
	}

	private void templateList(final int buyerId, final int courseId, final int lessonId, final Class<?> expected) {
		Class<?> caught;
		Buyer buyer;
		Lesson lesson;
		Collection<Lesson> lessons;

		caught = null;

		try {
			buyer = this.buyerService.findOne(buyerId);
			super.authenticate(buyer.getUserAccount().getUsername());
			lessons = this.lessonService.findLessonsByCourseId(courseId);
			lesson = this.lessonService.findOne(lessonId);
			Assert.isTrue(lessons.contains(lesson));

			this.entityManager.flush();

		} catch (final Throwable oops) {
			caught = oops.getClass();
			//Se borra la cache para que no salte siempre el error del primer objeto que ha fallado en el test
			this.entityManager.clear();
		}

		this.checkExceptions(expected, caught);

		super.unauthenticate();
	}
	//Test caso de uso 6.e-II: Crear lecciones para un curso.
	@Test
	public void driverCreateAndSave() {
		final Object testingData[][] = {
			{
				//Buyer2 crea una leccion correctamente para el curso 3
				"buyer2", "course3", "title test", "summary test of lesson", null
			}, {
				//Buyer2 crea una leccion para el curso 3 con el titulo en blanco
				"buyer2", "course3", "", "summary test of lesson", javax.validation.ConstraintViolationException.class
			}, {
				//Buyer2 crea una leccion para el curso 3 con el tamaño de summary demasiado corto
				"buyer2", "course3", "title test", "summary", IllegalArgumentException.class
			}, {
				//Buyer2 intenta crear una leccion para el curso 2 que está en modo final
				"buyer2", "course2", "title test", "summary test of lesson", IllegalArgumentException.class
			}, {
				//Buyer2 intenta crear una leccion para el curso 1 que que NO pertenece a él.
				"buyer2", "course1", "title test", "summary test of lesson", IllegalArgumentException.class
			}
		};
		for (int i = 0; i < testingData.length; i++)
			this.templateCreateAndSave(super.getEntityId((String) testingData[i][0]), super.getEntityId((String) testingData[i][1]), (String) testingData[i][2], (String) testingData[i][3], (Class<?>) testingData[i][4]);
	}

	private void templateCreateAndSave(final int buyerId, final int courseId, final String title, final String summary, final Class<?> expected) {
		Class<?> caught;
		caught = null;
		Buyer buyer;
		Lesson lesson;
		Course course;

		buyer = this.buyerService.findOne(buyerId);
		course = this.courseService.findOne(courseId);
		try {
			super.authenticate(buyer.getUserAccount().getUsername());
			lesson = this.lessonService.create(course);
			lesson.setTitle(title);
			lesson.setSummary(summary);

			lesson = this.lessonService.save(lesson);
			this.lessonService.flush();

		} catch (final Throwable oops) {
			caught = oops.getClass();
			//Se borra la cache para que no salte siempre el error del primer objeto que ha fallado en el test
			this.entityManager.clear();
		}

		this.checkExceptions(expected, caught);

		super.unauthenticate();

	}
}
