
package services;

import java.util.Collection;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import repositories.CategoryProductRepository;
import domain.CategoryProduct;

@Service
@Transactional
public class CategoryProductService {

	// Managed repository -----------------------------------------------------
	@Autowired
	private CategoryProductRepository	categoryProductRepository;


	// Supporting services ----------------------------------------------------

	// Constructors -----------------------------------------------------------
	public CategoryProductService() {
		super();
	}

	// Simple CRUD methods ----------------------------------------------------

	public CategoryProduct findOne(final int categoryProductId) {
		CategoryProduct result;

		result = this.categoryProductRepository.findOne(categoryProductId);

		return result;
	}

	public Collection<CategoryProduct> findAll() {
		Collection<CategoryProduct> result;

		result = this.categoryProductRepository.findAll();

		return result;
	}
}
