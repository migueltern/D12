
package services;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import utilities.AbstractTest;
import domain.Assesment;
import domain.Carrier;
import domain.CleanPoint;
import domain.Request;
import forms.RequestForm;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	"classpath:spring/junit.xml"
})
@Transactional
public class RequestServiceTest extends AbstractTest {

	@Autowired
	RequestService	requestService;

	@Autowired
	ItemService		itemService;

	@Autowired
	CarrierService	carrierService;

	@PersistenceContext
	EntityManager	entityManager;


	@Test
	public void driverCreateAndSave() {
		final Object testingData[][] = {
			{

				"manager1", "item2", "DG180231BB", "title test", "observation test", "FINISHED", null, null, null, null
			}, {

				"manager1", "item1", "DG180231BB", "title test", "observation test", "FINISHED", null, null, null, IllegalArgumentException.class
			}
		};
		for (int i = 0; i < testingData.length; i++)
			this.templateCreateAndSave((String) testingData[i][0], super.getEntityId((String) testingData[i][1]), (String) testingData[i][2], (String) testingData[i][3], (String) testingData[i][4], (String) testingData[i][5],
				(List<CleanPoint>) testingData[i][6], (Assesment) testingData[i][7], (Carrier) testingData[i][8], (Class<?>) testingData[i][9]);
	}

	private void templateCreateAndSave(final String username, final int itemId, final String code, final String title, final String observation, final String status, final List<CleanPoint> cleanPoints, final Assesment assesment, final Carrier carrier,
		final Class<?> expected) {
		final Request request;
		Class<?> caught;
		RequestForm requestForm;

		caught = null;
		try {
			super.authenticate(username);
			requestForm = this.requestService.create(itemId);
			requestForm.getRequest().setCode(code);
			requestForm.getRequest().setTitle(title);
			requestForm.getRequest().setObservation(observation);
			requestForm.getRequest().setStatus(status);
			this.requestService.save(requestForm);
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
	public void driverDelete() {
		final Object testingData[][] = {
			{

				"manager1", "request1", null
			}, {

				"manager1", "request3", IllegalArgumentException.class
			}
		};
		for (int i = 0; i < testingData.length; i++)
			this.templateDelete((String) testingData[i][0], super.getEntityId((String) testingData[i][1]), (Class<?>) testingData[i][2]);
	}

	private void templateDelete(final String username, final int requestId, final Class<?> expected) {
		final Request request;
		Class<?> caught;

		caught = null;
		try {
			super.authenticate(username);
			request = this.requestService.findOne(requestId);
			this.requestService.delete(request);
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
