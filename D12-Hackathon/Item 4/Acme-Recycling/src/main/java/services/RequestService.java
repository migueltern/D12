
package services;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;

import repositories.RequestRepository;
import domain.CleanPoint;
import domain.Item;
import domain.Request;
import forms.RequestForm;

@Service
@Transactional
public class RequestService {

	// Managed repository -----------------------------------------------------
	@Autowired
	private RequestRepository	requestRepository;

	@Autowired
	private ItemService			itemService;

	@Autowired
	private Validator			validator;

	@Autowired
	private ManagerService		managerService;

	@Autowired
	private CarrierService		carrierService;

	@Autowired
	private ActorService		actorService;


	// Supporting services ----------------------------------------------------

	// Constructors -----------------------------------------------------------
	public RequestService() {
		super();
	}

	// Simple CRUD methods ----------------------------------------------------

	public RequestForm create(final int itemId) {
		RequestForm result;
		List<CleanPoint> cleanPoints;
		Item item;
		final Request request;

		cleanPoints = new ArrayList<CleanPoint>();

		//No copiar la siguiente linea en el reconstruct
		request = new Request();
		item = this.itemService.findOne(itemId);
		Assert.notNull(item, "item is null");

		request.setCode(this.generatedTicker());
		request.setStatus("PENDING");
		request.setCleanPoints(cleanPoints);

		result = new RequestForm();
		result.setRequest(request);
		result.setItemId(itemId);

		return result;
	}

	public Request findOne(final int requestId) {
		Request result;

		result = this.requestRepository.findOne(requestId);

		return result;
	}

	public Collection<Request> findAll() {
		Collection<Request> result;

		result = this.requestRepository.findAll();

		return result;
	}

	public Request save(final RequestForm requestForm) {
		final Request result;

		Assert.notNull(requestForm);

		if (this.actorService.findPrincipal().getUserAccount().getAuthorities().contains("CARRIER"))
			Assert.isTrue(this.carrierService.findByPrincipal().getRequests().contains(requestForm.getRequest()), "Can not commit this operation because its illegal");

		result = this.requestRepository.save(requestForm.getRequest());
		if (requestForm.getRequest().getId() == 0) {
			//Añadimos el request al item`
			final Item item = this.itemService.findOne(requestForm.getItemId());
			item.setRequest(result);
			this.itemService.save(item);
			//Añadimos el request al manager cuando lo creamos

			this.managerService.findByPrincipal().getRequests().add(result);
		}

		return result;
	}
	public void delete(final Request request) {
		Assert.notNull(request);

		this.requestRepository.delete(request);
	}

	public Collection<Item> findItemsNonRequest() {
		Collection<Item> result;

		result = this.requestRepository.findItemsNonRequest();

		return result;
	}

	public Collection<Request> findByActorId(final int id) {
		Collection<Request> result;

		result = this.requestRepository.findByActorId(id);

		return result;
	}

	public Collection<Request> findByCarrierId(final int id) {
		Collection<Request> result;

		result = this.requestRepository.findByCarrierId(id);

		return result;
	}

	public String generatedTicker() {

		Calendar calendar;

		calendar = Calendar.getInstance();
		String ticker;
		String dias;
		String mes;
		ticker = "";

		//ticker = String.valueOf(calendar.get(Calendar.YEAR)).substring(2) + String.valueOf(calendar.get(Calendar.MONTH) + 1);
		dias = String.valueOf(calendar.get(Calendar.DAY_OF_MONTH));
		mes = String.valueOf(calendar.get(Calendar.MONTH) + 1);
		if (dias.length() <= 1)
			ticker = ticker + "0" + String.valueOf(calendar.get(Calendar.DAY_OF_MONTH));
		else
			ticker = ticker + String.valueOf(calendar.get(Calendar.DAY_OF_MONTH));

		if (mes.length() <= 1)
			ticker = ticker + "0" + String.valueOf(calendar.get(Calendar.MONTH) + 1);
		else
			ticker = ticker + String.valueOf(calendar.get(Calendar.MONTH) + 1);
		ticker = ticker + String.valueOf(calendar.get(Calendar.YEAR)).substring(2);

		final char[] arr = new char[] {
			'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V',
			'W', 'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'
		};
		String cadenaAleatoria = "";
		for (Integer i = 0; i <= 1; i++) {
			final char elegido = arr[(int) (Math.random() * 62)];
			cadenaAleatoria = cadenaAleatoria + elegido;

		}

		final char[] arr2 = new char[] {
			'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V',
			'W', 'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'
		};
		String cadenaAleatoria2 = "";
		for (Integer i = 0; i <= 1; i++) {
			final char elegido = arr2[(int) (Math.random() * 62)];
			cadenaAleatoria2 = cadenaAleatoria2 + elegido;

		}

		ticker = cadenaAleatoria2 + ticker + cadenaAleatoria;

		return ticker;
	}

	public RequestForm reconstruct(final RequestForm requestForm, final BindingResult binding) {
		final RequestForm result;
		final Request requestBD;
		Request request;

		request = requestForm.getRequest();

		if (request.getId() == 0) {

			request.setCode(this.generatedTicker());
			request.setStatus("PENDING");

			requestForm.setRequest(request);
			result = requestForm;
		} else {
			//Solo entra aqui cuando se cambia el status
			requestBD = this.findOne(request.getId());
			requestBD.setStatus(request.getStatus());

			requestForm.setRequest(requestBD);
			result = requestForm;
		}
		this.validator.validate(result, binding);
		return result;
	}

	public Request checkCreateRequest(final Request request) {
		Assert.notNull(request);
		if (request.getCarrier() != null) {
			Assert.isTrue(request.getCleanPoints().isEmpty(), "if you select a carrier,you can not select clean points");
			//Si se ha seleccionado un carrier se pone el status a IN COLLECTION
			request.setStatus("IN COLLECTION");
		} else {
			Assert.isTrue(!request.getCleanPoints().isEmpty(), "if you dont select a carrier, you have to select clean points");
			//Si se ha seleccionado puntos limpios se pone el status a CLEAN POINT
			request.setStatus("CLEAN POINT");
		}

		return request;
	}

	public Item reconstructAddPuntuation(final Item item, final BindingResult binding) {
		Assert.notNull(item);
		Item itemDB;

		itemDB = null;
		if (item.getId() == 0)
			Assert.isTrue(false, "the item must be in the system");
		else {
			itemDB = this.itemService.findOne(item.getId());
			itemDB.setValue(item.getValue());
		}

		Assert.isTrue(this.managerService.findByPrincipal().getRequests().contains(itemDB.getRequest()), "Can not commit this operation because its illegal");
		return itemDB;
	}

	public Item findItemByRequestId(final int requestId) {
		Item result;

		result = this.requestRepository.findItemByRequestId(requestId);

		return result;
	}

}
