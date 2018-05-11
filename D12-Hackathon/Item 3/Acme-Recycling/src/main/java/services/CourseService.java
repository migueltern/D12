
package services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import repositories.CourseRepository;

@Service
@Transactional
public class CourseService {

	// Managed repository -----------------------------------------------------
	@Autowired
	private CourseRepository	courseRepository;


	// Supporting services ----------------------------------------------------

	// Constructors -----------------------------------------------------------
	public CourseService() {
		super();
	}

	// Simple CRUD methods ----------------------------------------------------

	// Other business methods -------------------------------------------------

}
