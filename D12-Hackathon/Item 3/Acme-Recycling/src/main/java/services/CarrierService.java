
package services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import repositories.CarrierRepository;

@Service
@Transactional
public class CarrierService {

	// Managed repository -----------------------------------------------------
	@Autowired
	private CarrierRepository	carrierRepository;


	// Supporting services ----------------------------------------------------

	// Constructors -----------------------------------------------------------
	public CarrierService() {
		super();
	}

	// Simple CRUD methods ----------------------------------------------------

	// Other business methods -------------------------------------------------
}
