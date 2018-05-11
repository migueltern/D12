
package services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import repositories.RecyclerRepository;

@Service
@Transactional
public class RecyclerService {

	// Managed repository -----------------------------------------------------
	@Autowired
	private RecyclerRepository	recyclerRepository;


	// Supporting services ----------------------------------------------------

	// Constructors -----------------------------------------------------------
	public RecyclerService() {
		super();
	}

	// Simple CRUD methods ----------------------------------------------------

	// Other business methods -------------------------------------------------

}
