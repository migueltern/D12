
package services;

import java.util.Collection;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import repositories.OpinableRepository;
import domain.Opinable;

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

}
