
package services;

import java.util.ArrayList;
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
}
