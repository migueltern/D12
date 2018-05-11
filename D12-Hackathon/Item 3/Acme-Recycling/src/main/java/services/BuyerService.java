
package services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import repositories.BuyerRepository;

@Service
@Transactional
public class BuyerService {

	// Managed repository -----------------------------------------------------
	@Autowired
	private BuyerRepository	buyerRepository;


	// Supporting services ----------------------------------------------------

	// Constructors -----------------------------------------------------------
	public BuyerService() {
		super();
	}

	// Simple CRUD methods ----------------------------------------------------

	// Other business methods -------------------------------------------------
}
