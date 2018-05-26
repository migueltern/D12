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
import domain.Incidence;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	"classpath:spring/junit.xml"
})
@Transactional
public class IncidenceServiceTest extends AbstractTest{
	
	//Supporting services ----------------------------------------------------
	@Autowired
	private IncidenceService incidenceService;
	
	
	@PersistenceContext
	EntityManager		entityManager;
	
	// Create and save an incidence 
	@Test
	public void driverCreateAndSave() {
		final Object testingData[][] = {
			// A recycler create incidence, positive case 
			{

				"recycler1", "incidence prueba", "reason why prueba", "comment prueba", null

			}, 
			// A recycler create a incidence with blank title, negative case 
			{

				"recycler1", "", "reason why prueba", "comment prueba", javax.validation.ConstraintViolationException.class

			},
			//A recycler reate a incidence with blank reason why, negative case 
			{

				"recycler1", "incidence prueba", "", "comment prueba", javax.validation.ConstraintViolationException.class

			},
			//A recycler create incidence with null reason why, negative case 
			{

				"recycler1", "incidence prueba", null, "comment prueba", javax.validation.ConstraintViolationException.class

			},
			// A recycler create incidence with blank comment, positive case 
			{

				"recycler1", "incidence prueba", "reason why prueba", "", null

			},
			// A buyer try create an incidence, negative case 
			{

				"buyer1", "incidence prueba", "reason why prueba", "", java.lang.IllegalArgumentException.class

			},
			// A carrier try create an incidence, negative case
			{

				"carrier1", "incidence prueba", "reason why prueba", "", java.lang.IllegalArgumentException.class

			},
			// An editor try create an incidence, negative case
			{

				"editor1", "incidence prueba", "reason why prueba", "", java.lang.IllegalArgumentException.class

			},
			//An admin try create an incidence, negative case
			{

				"admin", "incidence prueba", "reason why prueba", "", java.lang.IllegalArgumentException.class

			}
			
			
			
		};
		for (int i = 0; i < testingData.length; i++)
			this.templateCreateAndSave((String) testingData[i][0], (String) testingData[i][1], (String) testingData[i][2], (String) testingData[i][3],(Class<?>) testingData[i][4]);
	}
	
	
	private void templateCreateAndSave(String username, String title, String reasonWhy, String comment, Class<?> expected) {
		Class<?> caught;
		Incidence incidence;
		caught = null;

		try {
			super.authenticate(username);
			incidence = this.incidenceService.create();

			incidence.setTitle(title);
			incidence.setReasonWhy(reasonWhy);
			incidence.setComment(comment);
			incidence = this.incidenceService.save(incidence);
			this.incidenceService.flush();

		} catch (final Throwable oops) {
			caught = oops.getClass();
			//Se borra la cache para que no salte siempre el error del primer objeto que ha fallado en el test
			this.entityManager.clear();
		}

		this.checkExceptions(expected, caught);

		super.unauthenticate();
	}
	
	
	//Edit an incidence
	@Test
	public void driverEdit() {
		final Object testingData[][] = {
			
			//Recycler change title, positive case
			{

				"recycler1", "incidence1", "title changed", null

			}, 
			//Recycler change blank title, negative case
			{

				"recycler1", "incidence1", "", javax.validation.ConstraintViolationException.class

			},
			//Recycler change  null title, negative case
			{

				"recycler1", "incidence1", null, javax.validation.ConstraintViolationException.class

			},
			//Recycler try edit an incidence that is not yours, negative case
			{

				"recycler2", "incidence1", "title changed", java.lang.IllegalArgumentException.class

			}
			
		};
		for (int i = 0; i < testingData.length; i++)
			this.templateEdit((String) testingData[i][0], (String) testingData[i][1], (String) testingData[i][2], (Class<?>) testingData[i][3]);
	}
	
	
	private void templateEdit(String username, String incidenceId, String title,  Class<?> expected) {
		Class<?> caught;
		Incidence incidence;
		caught = null;

		try {
			super.authenticate(username);
			incidence = this.incidenceService.findOne(super.getEntityId(incidenceId));

			incidence.setTitle(title);
			incidence = this.incidenceService.save(incidence);
			this.incidenceService.flush();

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
			
			//Recycler delete his incidence, positive case
			{

				"recycler1", "incidence1", null

			}, 
			//Recycler try delete his finished incidence, negative case
			{

				"recycler2", "incidence2", java.lang.IllegalArgumentException.class

			},
			// Recycler try delete other incidence that is not yours, negative case
			{

				"recycler2", "incidence1", java.lang.IllegalArgumentException.class

			}
			
		};
		for (int i = 0; i < testingData.length; i++)
			this.templateDelete((String) testingData[i][0], (String) testingData[i][1], (Class<?>) testingData[i][2]);
	}
	
	
	private void templateDelete(String username, String incidenceId, Class<?> expected) {
		Class<?> caught;
		Incidence incidence;
		caught = null;

		try {
			super.authenticate(username);
			incidence = this.incidenceService.findOne(super.getEntityId(incidenceId));

			this.incidenceService.delete(incidence);
			this.incidenceService.flush();

		} catch (final Throwable oops) {
			caught = oops.getClass();
			//Se borra la cache para que no salte siempre el error del primer objeto que ha fallado en el test
			this.entityManager.clear();
		}

		this.checkExceptions(expected, caught);

		super.unauthenticate();
	}
}
