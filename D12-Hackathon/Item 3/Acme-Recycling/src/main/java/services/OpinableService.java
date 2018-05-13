
package services;

import java.util.Collection;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import repositories.OpinableRepository;
import domain.Course;
import domain.Opinable;
import domain.Opinion;
import domain.Product;

@Service
@Transactional
public class OpinableService {

	// Managed repository -----------------------------------------------------
	@Autowired
	private OpinableRepository	opinableRepository;


	// Supporting services ----------------------------------------------------

	// Constructors -----------------------------------------------------------
	public OpinableService() {
		super();
	}
	// Simple CRUD methods ----------------------------------------------------

	public Opinable findOne(final int opinableId) {
		Assert.isTrue(opinableId != 0);

		Opinable result;

		result = this.opinableRepository.findOne(opinableId);

		return result;

	}

	public Collection<Opinable> findAll() {

		Collection<Opinable> result;

		result = this.opinableRepository.findAll();

		return result;

	}

	public Opinable save(final Opinable opinable) {
		Opinable result;

		Assert.notNull(opinable);

		result = this.opinableRepository.save(opinable);

		return result;
	}

	public void delete(final Opinable opinable) {
		Assert.notNull(opinable);

		this.opinableRepository.delete(opinable);
	}

	public boolean isProduct(final Opinion opinion) {
		boolean res;
		Product product;

		res = false;
		product = (Product) opinion.getOpinable();
		if (product != null)
			res = true;
		return res;
	}

	public boolean isCourse(final Opinion opinion) {
		boolean res;
		Course course;

		res = false;
		course = (Course) opinion.getOpinable();
		if (course != null)
			res = true;
		return res;
	}
}
