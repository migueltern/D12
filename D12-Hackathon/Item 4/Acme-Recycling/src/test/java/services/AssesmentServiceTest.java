
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
import domain.Assesment;
import domain.Carrier;
import forms.AssessmentForm;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	"classpath:spring/junit.xml"
})
@Transactional
public class AssesmentServiceTest extends AbstractTest {

	// Supporting services ----------------------------------------------------
	@Autowired
	AssesmentService	assesmentService;

	@PersistenceContext
	EntityManager		entityManager;

	@Autowired
	ItemService			itemService;

	@Autowired
	CarrierService		carrierService;


	@Test
	public void driverCreateAndSave() {
		final Object testingData[][] = {
			{
				//Se edita un product correctamente
				"carrier3", "request3", "description test", 2, null
			}, {
				//Se edita un product correctamente
				"carrier1", "request1", "description test", 5, IllegalArgumentException.class
			}
		};
		for (int i = 0; i < testingData.length; i++)
			this.templateCreateAndSave((String) testingData[i][0], super.getEntityId((String) testingData[i][1]), (String) testingData[i][2], (Integer) testingData[i][3], (Class<?>) testingData[i][4]);
	}

	private void templateCreateAndSave(final String username, final int requestId, final String description, final Integer valuation, final Class<?> expected) {
		Class<?> caught;
		AssessmentForm assesmentForm;

		caught = null;
		try {
			super.authenticate(username);
			assesmentForm = this.assesmentService.create(requestId);
			assesmentForm.getAssessment().setDescription(description);
			assesmentForm.getAssessment().setValuation(valuation);
			this.assesmentService.save(assesmentForm);

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
	public void driverEdit() {
		final Object testingData[][] = {
			{
				//Se edita un product correctamente
				"carrier3", "assesment3", "request3", "description test", null
			}, {
				//Se edita un product correctamente
				"carrier1", "assesment3", "request1", "description test", IllegalArgumentException.class
			}
		};
		for (int i = 0; i < testingData.length; i++)
			this.templateEdit((String) testingData[i][0], super.getEntityId((String) testingData[i][1]), super.getEntityId((String) testingData[i][2]), (String) testingData[i][3], (Class<?>) testingData[i][4]);
	}

	private void templateEdit(final String username, final int assesmentId, final int requestId, final String description, final Class<?> expected) {
		Class<?> caught;
		Assesment assessment;
		AssessmentForm assesmentForm;

		caught = null;
		try {
			super.authenticate(username);
			assessment = this.assesmentService.findOne(assesmentId);
			assesmentForm = new AssessmentForm();
			assesmentForm.setAssessment(assessment);
			assesmentForm.setRequestId(requestId);
			assesmentForm.getAssessment().setDescription(description);

			this.assesmentService.save(assesmentForm);

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
	public void driverList() {
		final Object testingData[][] = {
			{
				//Se edita un product correctamente
				"carrier1", "request1", 1, null
			}, {
				//Se edita un product correctamente
				"carrier2", "request3", 2, IllegalArgumentException.class
			}
		};
		for (int i = 0; i < testingData.length; i++)
			this.templateList((String) testingData[i][0], super.getEntityId((String) testingData[i][1]), (Integer) testingData[i][2], (Class<?>) testingData[i][3]);
	}

	private void templateList(final String username, final int requestId, final Integer size, final Class<?> expected) {
		Class<?> caught;
		final Assesment assessment;
		final AssessmentForm assesmentForm;
		Collection<Assesment> assesments;
		Carrier carrierConnected;

		caught = null;
		try {
			super.authenticate(username);
			carrierConnected = this.carrierService.findByPrincipal();
			assesments = this.assesmentService.findByCarrierId(carrierConnected.getId());
			Assert.isTrue(assesments.size() == size);

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
