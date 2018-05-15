
package services;

import java.util.Collection;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import repositories.LabelMaterialRepository;
import domain.LabelMaterial;
import domain.Manager;

@Service
@Transactional
public class LabelMaterialService {

	// Managed repository -----------------------------------------------------
	@Autowired
	private LabelMaterialRepository	labelMaterialRepository;

	//Suporting services

	@Autowired
	private ManagerService			managerService;


	// Constructors -----------------------------------------------------------

	public LabelMaterialService() {
		super();
	}
	// Simple CRUD methods ----------------------------------------------------

	public LabelMaterial findOne(final int labelMaterialId) {
		Assert.isTrue(labelMaterialId != 0);

		LabelMaterial result;

		result = this.labelMaterialRepository.findOne(labelMaterialId);
		Assert.notNull(result);

		return result;

	}

	public Collection<LabelMaterial> findAll() {

		Collection<LabelMaterial> result;

		result = this.labelMaterialRepository.findAll();

		return result;

	}

	public LabelMaterial create() {
		LabelMaterial result;

		result = new LabelMaterial();
		return result;
	}

	public LabelMaterial save(final LabelMaterial labelMaterial) {
		final Collection<LabelMaterial> labelMaterialsWithMaterial;
		labelMaterialsWithMaterial = this.labelMaterialRepository.labelMaterialsOfAllMaterials();

		Assert.notNull(labelMaterial);
		Assert.notNull(this.managerService.findByPrincipal());
		LabelMaterial result;
		if (labelMaterial.getId() != 0) {
			Assert.isTrue(labelMaterial.getByDefault() == false);
			Assert.isTrue(!labelMaterialsWithMaterial.contains(labelMaterial));
		}
		result = this.labelMaterialRepository.save(labelMaterial);

		return result;

	}

	public void delete(final LabelMaterial labelMaterial) {
		final Manager manager;
		final Collection<LabelMaterial> labelMaterialsWithMaterial;

		labelMaterialsWithMaterial = this.labelMaterialRepository.labelMaterialsOfAllMaterials();

		manager = this.managerService.findByPrincipal();
		Assert.notNull(manager);
		Assert.notNull(labelMaterial);

		Assert.isTrue(!labelMaterialsWithMaterial.contains(labelMaterial));

		Assert.isTrue(labelMaterial.getId() != 0);
		Assert.isTrue(labelMaterial.getByDefault() == false);

		this.labelMaterialRepository.delete(labelMaterial);
	}
}
