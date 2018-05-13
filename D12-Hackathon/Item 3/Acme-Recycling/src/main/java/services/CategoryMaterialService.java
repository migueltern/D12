
package services;

import java.util.Collection;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import repositories.CategoryMaterialRepository;
import domain.CategoryMaterial;
import domain.Manager;

@Service
@Transactional
public class CategoryMaterialService {

	// Managed repository -----------------------------------------------------
	@Autowired
	private CategoryMaterialRepository	categoryMaterialRepository;

	//Suporting services

	@Autowired
	private ManagerService				managerService;


	// Constructors -----------------------------------------------------------

	public CategoryMaterialService() {
		super();
	}
	// Simple CRUD methods ----------------------------------------------------

	public CategoryMaterial findOne(final int categoryMaterialId) {
		Assert.isTrue(categoryMaterialId != 0);

		CategoryMaterial result;

		result = this.categoryMaterialRepository.findOne(categoryMaterialId);
		Assert.notNull(result);

		return result;

	}

	public Collection<CategoryMaterial> findAll() {

		Collection<CategoryMaterial> result;

		result = this.categoryMaterialRepository.findAll();

		return result;

	}

	public CategoryMaterial create() {
		CategoryMaterial result;

		result = new CategoryMaterial();
		return result;
	}

	public CategoryMaterial save(final CategoryMaterial categoryMaterial) {
		final Collection<CategoryMaterial> categoryMaterialsWithMaterial;
		categoryMaterialsWithMaterial = this.categoryMaterialRepository.categoryMaterialsOfAllMaterials();

		Assert.notNull(categoryMaterial);
		Assert.notNull(this.managerService.findByPrincipal());
		CategoryMaterial result;
		if (categoryMaterial.getId() != 0) {
			Assert.isTrue(categoryMaterial.getByDefault() == false);
			Assert.isTrue(!categoryMaterialsWithMaterial.contains(categoryMaterial));
		}
		result = this.categoryMaterialRepository.save(categoryMaterial);

		return result;

	}

	public void delete(final CategoryMaterial categoryMaterial) {
		final Manager manager;
		final Collection<CategoryMaterial> categoryMaterialsWithMaterial;

		categoryMaterialsWithMaterial = this.categoryMaterialRepository.categoryMaterialsOfAllMaterials();

		manager = this.managerService.findByPrincipal();
		Assert.notNull(manager);
		Assert.notNull(categoryMaterial);

		Assert.isTrue(!categoryMaterialsWithMaterial.contains(categoryMaterial));

		Assert.isTrue(categoryMaterial.getId() != 0);
		Assert.isTrue(categoryMaterial.getByDefault() == false);

		this.categoryMaterialRepository.delete(categoryMaterial);
	}
}
