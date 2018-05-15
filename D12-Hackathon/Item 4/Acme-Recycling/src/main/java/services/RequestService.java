
package services;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.RequestRepository;
import domain.CleanPoint;
import domain.Item;
import domain.Request;

@Service
@Transactional
public class RequestService {

	// Managed repository -----------------------------------------------------
	@Autowired
	private RequestRepository	requestRepository;


	// Supporting services ----------------------------------------------------

	// Constructors -----------------------------------------------------------
	public RequestService() {
		super();
	}

	// Simple CRUD methods ----------------------------------------------------

	public Request create() {
		Request result;
		List<CleanPoint> cleanPoints;

		cleanPoints = new ArrayList<CleanPoint>();

		//No copiar la siguiente linea en el reconstruct
		result = new Request();

		result.setCode(this.generatedTicker());
		result.setStatus("PENDING");
		result.setCleanPoints(cleanPoints);

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

	public Request save(final Request request) {
		final Request result;

		Assert.notNull(request);

		result = this.requestRepository.save(request);

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
}
