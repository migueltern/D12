
package services;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import utilities.AbstractTest;
import domain.Comment;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	"classpath:spring/junit.xml"
})
@Transactional
public class CommentServiceTest extends AbstractTest {

	// Supporting services ----------------------------------------------------

	@Autowired
	CommentService	commentService;

	@Autowired
	NewscastService	newscastService;

	@PersistenceContext
	EntityManager	entityManager;


	//Caso de uso 3.g)Crear y salvar un comentario
	@Test
	public void driverCreateAndSaveComment() {

		final Object testingData[][] = {
			{
				//Crear comentario correctamente
				"body", "new1", "recycler1", null
			}, {
				//Crear incorrectamente un comentario dejando el cuerpo vac�o
				"", "new1", "recycler2", javax.validation.ConstraintViolationException.class
			}

		};
		for (int i = 0; i < testingData.length; i++)
			this.templateCreateAndSave((String) testingData[i][0], super.getEntityId((String) testingData[i][1]), (String) testingData[i][2], (Class<?>) testingData[i][3]);
	}
	private void templateCreateAndSave(final String body, final int newscastId, final String username, final Class<?> expected) {
		Comment comment;
		Class<?> caught;

		caught = null;
		try {
			super.authenticate(username);
			comment = this.commentService.create();
			comment.setBody(body);
			comment = this.commentService.save(comment);
			this.unauthenticate();
			this.commentService.flush();
		} catch (final Throwable oops) {
			caught = oops.getClass();
		}

		this.checkExceptions(expected, caught);

	}

	//Caso de uso 3.g)Delete comment
	@Test
	public void driveDeleteComment() {

		final Object testingData[][] = {
			//Borrar comentario correctamente
			{
				"comment1", "recycler1", null
			}, {
				//borrar comentario incorrectamente
				"comment1", "recycler2", IllegalArgumentException.class
			}

		};

		for (int i = 0; i < testingData.length; i++)
			this.templateDeleteComment((String) testingData[i][0], (String) testingData[i][1], (Class<?>) testingData[i][2]);

	}
	public void templateDeleteComment(final String entity, final String username, final Class<?> expected) {

		Class<?> caught;
		Comment comment;

		caught = null;

		try {
			super.authenticate(username);
			comment = this.commentService.findOne(super.getEntityId(entity));

			this.commentService.delete(comment);
			this.commentService.flush();
		} catch (final Throwable oops) {
			caught = oops.getClass();
			this.entityManager.clear();
		}

		this.checkExceptions(expected, caught);

	}
}
