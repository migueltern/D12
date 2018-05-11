
package services;

import java.util.Collection;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.OpinionRepository;
import domain.Opinion;

@Service
@Transactional
public class OpinionService {

	// Managed repository -----------------------------------------------------
	@Autowired
	private OpinionRepository	opinionRepository;


	// Supporting services ----------------------------------------------------

	// Constructors -----------------------------------------------------------
	public OpinionService() {
		super();
	}

	// Simple CRUD methods ----------------------------------------------------

	public Opinion create() {
		Opinion result;

		//No copiar la siguiente linea en el reconstruct
		result = new Opinion();

		return result;
	}

	public Opinion findOne(final int opinionId) {
		Opinion result;

		result = this.opinionRepository.findOne(opinionId);

		return result;
	}

	public Collection<Opinion> findAll() {
		Collection<Opinion> result;

		result = this.opinionRepository.findAll();

		return result;
	}

	public Opinion save(final Opinion opinion) {
		final Opinion result;

		Assert.notNull(opinion);

		if (opinion.getId() == 0) {
			Date createdMoment;
			createdMoment = new Date(System.currentTimeMillis() - 1000);
			opinion.setCreatedMoment(createdMoment);
		}

		result = this.opinionRepository.save(opinion);

		return result;
	}

	public void delete(final Opinion opinion) {
		Assert.notNull(opinion);

		this.opinionRepository.delete(opinion);
	}
}
