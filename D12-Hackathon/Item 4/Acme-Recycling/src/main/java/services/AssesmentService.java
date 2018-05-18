
package services;

import java.util.Collection;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.AssesmentRepository;
import domain.Assesment;

@Service
@Transactional
public class AssesmentService {

	// Managed repository -----------------------------------------------------
	@Autowired
	private AssesmentRepository	assesmentRepository;


	// Supporting services ----------------------------------------------------

	// Constructors -----------------------------------------------------------
	public AssesmentService() {
		super();
	}

	// Simple CRUD methods ----------------------------------------------------
	public Assesment create() {
		final Assesment result;

		//No copiar la siguiente linea en el reconstruct
		result = new Assesment();

		return result;

	}

	public Assesment findOne(final int assesmentId) {
		Assesment result;

		result = this.assesmentRepository.findOne(assesmentId);

		return result;
	}

	public Collection<Assesment> findAll() {
		Collection<Assesment> result;

		result = this.assesmentRepository.findAll();

		return result;
	}

	public Assesment save(final Assesment assesment) {
		final Assesment result;

		Assert.notNull(assesment);

		if (assesment.getId() == 0) {
			Date moment;
			moment = new Date(System.currentTimeMillis() - 1000);
			assesment.setMoment(moment);
		}

		result = this.assesmentRepository.save(assesment);

		return result;
	}

	public void delete(final Assesment assesment) {
		Assert.notNull(assesment);

		this.assesmentRepository.delete(assesment);
	}

	public Collection<Assesment> findByCarrierId(final int id) {
		Collection<Assesment> result;
		result = this.assesmentRepository.findByCarrierId(id);
		return result;
	}

}
