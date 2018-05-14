
package services;

import java.util.Collection;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import repositories.LabelProductRepository;
import domain.LabelProduct;
import domain.Manager;

@Service
@Transactional
public class LabelProductService {

	// Managed repository -----------------------------------------------------
	@Autowired
	private LabelProductRepository	labelProductRepository;

	//Suporting services-------------------------------------------------------

	@Autowired
	private ManagerService			managerService;


	// Constructors -----------------------------------------------------------

	public LabelProductService() {
		super();
	}
	// Simple CRUD methods ----------------------------------------------------

	public LabelProduct findOne(final int labelProductId) {
		Assert.isTrue(labelProductId != 0);

		LabelProduct result;

		result = this.labelProductRepository.findOne(labelProductId);
		Assert.notNull(result);

		return result;

	}

	public Collection<LabelProduct> findAll() {

		Collection<LabelProduct> result;

		result = this.labelProductRepository.findAll();

		return result;

	}

	public LabelProduct create() {
		LabelProduct result;

		result = new LabelProduct();
		return result;
	}

	public LabelProduct save(final LabelProduct labelProduct) {
		final Collection<LabelProduct> labelProductsWithProduct;
		labelProductsWithProduct = this.labelProductRepository.labelProductsOfAllProducts();

		Assert.notNull(labelProduct);
		Assert.notNull(this.managerService.findByPrincipal());
		LabelProduct result;
		if (labelProduct.getId() != 0) {
			Assert.isTrue(labelProduct.getByDefault() == false);
			Assert.isTrue(!labelProductsWithProduct.contains(labelProduct));
		}
		result = this.labelProductRepository.save(labelProduct);

		return result;

	}

	public void delete(final LabelProduct labelProduct) {
		final Manager manager;
		final Collection<LabelProduct> labelProductsWithProduct;

		labelProductsWithProduct = this.labelProductRepository.labelProductsOfAllProducts();

		manager = this.managerService.findByPrincipal();
		Assert.notNull(manager);
		Assert.notNull(labelProduct);

		Assert.isTrue(!labelProductsWithProduct.contains(labelProduct));

		Assert.isTrue(labelProduct.getId() != 0);
		Assert.isTrue(labelProduct.getByDefault() == false);

		this.labelProductRepository.delete(labelProduct);
	}
}
