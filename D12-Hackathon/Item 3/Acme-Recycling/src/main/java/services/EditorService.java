
package services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import repositories.EditorRepository;

@Service
@Transactional
public class EditorService {

	// Managed repository -----------------------------------------------------
	@Autowired
	private EditorRepository	editorRepository;


	// Supporting services ----------------------------------------------------

	// Constructors -----------------------------------------------------------
	public EditorService() {
		super();
	}

	// Simple CRUD methods ----------------------------------------------------

	// Other business methods -------------------------------------------------
}
