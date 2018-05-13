
package services;

import java.util.Collection;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import repositories.CategoryProductRepository;
import domain.CategoryProduct;
import domain.Manager;

@Service
@Transactional
public class CategoryProductService {

	// Managed repository -----------------------------------------------------
	@Autowired
	private CategoryProductRepository	categoryProductRepository;

	//Suporting services-------------------------------------------------------

	@Autowired
	private ManagerService				managerService;


	// Constructors -----------------------------------------------------------

	public CategoryProductService() {
		super();
	}
	// Simple CRUD methods ----------------------------------------------------

	public CategoryProduct findOne(final int categoryProductId) {
		Assert.isTrue(categoryProductId != 0);

		CategoryProduct result;

		result = this.categoryProductRepository.findOne(categoryProductId);
		Assert.notNull(result);

		return result;

	}

	public Collection<CategoryProduct> findAll() {

		Collection<CategoryProduct> result;

		result = this.categoryProductRepository.findAll();

		return result;

	}

	public CategoryProduct create() {
		CategoryProduct result;

		result = new CategoryProduct();
		return result;
	}

	public CategoryProduct save(final CategoryProduct categoryProduct) {
		final Collection<CategoryProduct> categoryProductsWithProduct;
		categoryProductsWithProduct = this.categoryProductRepository.categoryProductsOfAllProducts();

		Assert.notNull(categoryProduct);
		Assert.notNull(this.managerService.findByPrincipal());
		CategoryProduct result;
		if (categoryProduct.getId() != 0) {
			Assert.isTrue(categoryProduct.getByDefault() == false);
			Assert.isTrue(!categoryProductsWithProduct.contains(categoryProduct));
		}
		result = this.categoryProductRepository.save(categoryProduct);

		return result;

	}

	public void delete(final CategoryProduct categoryProduct) {
		final Manager manager;
		final Collection<CategoryProduct> categoryProductsWithProduct;

		categoryProductsWithProduct = this.categoryProductRepository.categoryProductsOfAllProducts();

		manager = this.managerService.findByPrincipal();
		Assert.notNull(manager);
		Assert.notNull(categoryProduct);

		Assert.isTrue(!categoryProductsWithProduct.contains(categoryProduct));

		Assert.isTrue(categoryProduct.getId() != 0);
		Assert.isTrue(categoryProduct.getByDefault() == false);

		this.categoryProductRepository.delete(categoryProduct);
	}
}
