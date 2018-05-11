
package services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import repositories.ManagerRepository;

@Service
@Transactional
public class ManagerService {

	// Managed repository -----------------------------------------------------
	@Autowired
	private ManagerRepository	managerRepository;


	// Supporting services ----------------------------------------------------

	// Constructors -----------------------------------------------------------
	public ManagerService() {
		super();
	}

	// Simple CRUD methods ----------------------------------------------------

	// Other business methods -------------------------------------------------

}
