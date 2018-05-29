
package services;

import java.util.Collection;
import java.util.List;

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
import domain.Carrier;
import domain.CleanPoint;
import domain.Item;
import domain.Message;
import domain.MessageFolder;
import domain.Recycler;
import forms.RequestForm;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	"classpath:spring/junit.xml"
})
@Transactional
public class RequestServiceTest extends AbstractTest {

	@Autowired
	RequestService			requestService;

	@Autowired
	ItemService				itemService;

	@Autowired
	CarrierService			carrierService;

	@Autowired
	RecyclerService			recyclerService;

	@Autowired
	MessageFolderService	messageFolderService;

	@Autowired
	MessageService			messageService;

	@PersistenceContext
	EntityManager			entityManager;


	//Caso de uso 3.a: El reciclador recibirá un mensaje cuando un transportista vaya a recoger su pedido.
	@SuppressWarnings("unchecked")
	@Test
	public void driverCreateAndSave() {
		final Object testingData[][] = {
			{

				//Se crea una request correctamente y se comprueba exitosamente que le llega el mensaje al recycler
				"manager1", "item2", "DG180231BB", "title test", "observation test", "IN COLLECTION", null, "carrier1", "recycler2", null
			}, {

				//Se intenta crear una request en un item que ya tiene request
				"manager1", "item1", "DG180231BC", "title test", "observation test", "IN COLLECTION", null, "carrier1", "recycler1", IllegalArgumentException.class
			}
		};
		for (int i = 0; i < testingData.length; i++)
			this.templateCreateAndSave((String) testingData[i][0], super.getEntityId((String) testingData[i][1]), (String) testingData[i][2], (String) testingData[i][3], (String) testingData[i][4], (String) testingData[i][5],
				(List<CleanPoint>) testingData[i][6], super.getEntityId((String) testingData[i][7]), super.getEntityId((String) testingData[i][8]), (Class<?>) testingData[i][9]);
	}

	private void templateCreateAndSave(final String username, final int itemId, final String code, final String title, final String observation, final String status, final List<CleanPoint> cleanPoints, final int carrierId, final int recyclerId,
		final Class<?> expected) {
		Class<?> caught;
		RequestForm requestForm;
		final Carrier carrier;
		final Recycler recycler;

		caught = null;
		try {
			super.authenticate(username);

			carrier = this.carrierService.findOne(carrierId);
			recycler = this.recyclerService.findOne(recyclerId);

			requestForm = this.requestService.create(itemId);
			requestForm.getRequest().setCode(code);
			requestForm.getRequest().setTitle(title);
			requestForm.getRequest().setObservation(observation);
			requestForm.getRequest().setStatus(status);
			requestForm.getRequest().setCarrier(carrier);
			this.requestService.save(requestForm);
			this.entityManager.flush();

			//Comprobamos que el recycler de ese item recibe un mensaje de que se ha cambiado el status de su request
			final MessageFolder notificationBox = this.messageFolderService.findMessageFolderByNameAndActor("Notification Box", recycler.getId());
			boolean existsMessage = false;
			final Collection<Message> messages = this.messageService.findMessagesByMessageFolder(notificationBox.getId());
			for (final Message m : messages)
				if (m.getSubject().equals(requestForm.getRequest().getCode() + ": " + requestForm.getRequest().getTitle()))
					existsMessage = true;
			Assert.isTrue(existsMessage);

		} catch (final Throwable oops) {
			caught = oops.getClass();
			//Se borra la cache para que no salte siempre el error del primer objeto que ha fallado en el test
			this.entityManager.clear();
		}

		this.checkExceptions(expected, caught);

		super.unauthenticate();
	}

	//Caso de uso 4.c: El manager tendrá un listado de todos los productos del sistema(items) que aún no estén solicitadas, para así añadir la solicitud de recogida o de entrega a un punto limpio.
	@Test
	public void driverListToRequest() {
		final Object testingData[][] = {
			{

				//Listar los items sin request y comprobar que NO aparece el item1 ya que tiene request
				"item1", IllegalArgumentException.class
			}, {
				//Listar los items sin request y comprobar que aparece el item2 ya que NO tiene request
				"item2", null
			}
		};
		for (int i = 0; i < testingData.length; i++)
			this.templateListToRequest(super.getEntityId((String) testingData[i][0]), (Class<?>) testingData[i][1]);
	}

	private void templateListToRequest(final int itemId, final Class<?> expected) {
		Class<?> caught;
		Collection<Item> items;
		Item item;

		caught = null;
		try {
			items = this.requestService.findItemsNonRequest();
			item = this.itemService.findOne(itemId);

			Assert.isTrue(items.contains(item));
		} catch (final Throwable oops) {
			caught = oops.getClass();
		}
		this.checkExceptions(expected, caught);
	}

}
