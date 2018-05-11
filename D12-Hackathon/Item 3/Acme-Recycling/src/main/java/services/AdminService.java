
package services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import repositories.AdminRepository;

@Service
@Transactional
public class AdminService {

	// Managed repository -----------------------------------------------------
	@Autowired
	private AdminRepository	adminRepository;


	// Supporting services ----------------------------------------------------

	// Constructors -----------------------------------------------------------
	public AdminService() {
		super();
	}

	// Simple CRUD methods ----------------------------------------------------

	// Other business methods -------------------------------------------------
}
