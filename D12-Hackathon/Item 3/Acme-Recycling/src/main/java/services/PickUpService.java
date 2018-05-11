
package services;

import java.util.Collection;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.PickUpRepository;
import domain.PickUp;

@Service
@Transactional
public class PickUpService {

	// Managed repository -----------------------------------------------------
	@Autowired
	private PickUpRepository	pickUpRepository;


	// Supporting services ----------------------------------------------------

	// Constructors -----------------------------------------------------------
	public PickUpService() {
		super();
	}

	// Simple CRUD methods ----------------------------------------------------
	public PickUp create() {
		final PickUp result;

		//No copiar la siguiente linea en el reconstruct
		result = new PickUp();

		return result;

	}

	public PickUp findOne(final int pickUpId) {
		PickUp result;

		result = this.pickUpRepository.findOne(pickUpId);

		return result;
	}

	public Collection<PickUp> findAll() {
		Collection<PickUp> result;

		result = this.pickUpRepository.findAll();

		return result;
	}

	public PickUp save(final PickUp pickUp) {
		final PickUp result;

		Assert.notNull(pickUp);

		if (pickUp.getId() == 0) {
			Date moment;
			moment = new Date(System.currentTimeMillis() - 1000);
			pickUp.setMoment(moment);
		}

		result = this.pickUpRepository.save(pickUp);

		return result;
	}

	public void delete(final PickUp pickUp) {
		Assert.notNull(pickUp);

		this.pickUpRepository.delete(pickUp);
	}
}
