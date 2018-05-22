
package services;

import java.util.Collection;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;

import repositories.LegislationRepository;
import domain.Legislation;

@Service
@Transactional
public class LegislationService {

	// Managed repository -----------------------------------------------------
	@Autowired
	private LegislationRepository	legislationRepository;

	// Supporting services ----------------------------------------------------

	@Autowired
	private AdminService			adminService;

	@Autowired
	private Validator				validator;


	// Constructors -----------------------------------------------------------

	public LegislationService() {
		super();
	}

	// Simple CRUD methods ----------------------------------------------------

	public Legislation create() {
		this.adminService.checkPrincipal();
		Legislation result;

		result = new Legislation();

		return result;

	}

	public Legislation findOne(final int lawId) {
		this.adminService.checkPrincipal();
		Legislation result;

		Assert.notNull(lawId);
		Assert.isTrue(lawId != 0);

		result = this.legislationRepository.findOne(lawId);

		return result;

	}

	public Collection<Legislation> findAll() {
		this.adminService.checkPrincipal();
		Collection<Legislation> result;

		result = this.legislationRepository.findAll();

		Assert.notNull(result);

		return result;
	}

	public Legislation save(final Legislation law) {

		Assert.notNull(law);

		this.adminService.checkPrincipal();

		Legislation result;

		result = this.legislationRepository.save(law);

		return result;
	}

	public void delete(final Legislation law) {
		this.adminService.checkPrincipal();
		Assert.notNull(law);
		Assert.isTrue(law.getId() != 0);

		this.legislationRepository.delete(law);

	}

	public Legislation reconstruct(final Legislation law, final BindingResult bindingResult) {
		Legislation result;
		Legislation lawBD;
		if (law.getId() == 0)
			result = law;
		else {
			lawBD = this.legislationRepository.findOne(law.getId());
			law.setId(lawBD.getId());
			law.setVersion(lawBD.getVersion());

			result = law;
		}
		this.validator.validate(result, bindingResult);
		return result;
	}

	public void flush() {
		this.legislationRepository.flush();
	}

}
