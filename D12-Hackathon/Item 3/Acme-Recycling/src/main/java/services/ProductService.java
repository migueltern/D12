
package services;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.ProductRepository;
import domain.CategoryProduct;
import domain.Product;
import domain.Recycler;

@Service
@Transactional
public class ProductService {

	// Managed repository -----------------------------------------------------
	@Autowired
	private ProductRepository	productRepository;

	// Supporting services ----------------------------------------------------
	@Autowired
	private RecyclerService		recyclerService;


	// Constructors -----------------------------------------------------------
	public ProductService() {
		super();
	}

	// Simple CRUD methods ----------------------------------------------------
	public Product create() {
		List<CategoryProduct> categoryProducts;
		final Product result;
		Recycler recyclerPrincipal;

		categoryProducts = new ArrayList<CategoryProduct>();
		recyclerPrincipal = this.recyclerService.findByPrincipal();
		//No copiar la siguiente linea en el reconstruct
		result = new Product();

		result.setCategoryProducts(categoryProducts);
		result.setRecycler(recyclerPrincipal);

		return result;

	}

	public Product findOne(final int productId) {
		Product result;

		result = this.productRepository.findOne(productId);

		return result;
	}

	public Collection<Product> findAll() {
		Collection<Product> result;

		result = this.productRepository.findAll();

		return result;
	}

	public Product save(final Product product) {
		final Product result;

		Assert.notNull(product);

		if (product.getId() == 0) {
			Date publicationMoment;
			publicationMoment = new Date(System.currentTimeMillis() - 1000);
			product.setPublicationMoment(publicationMoment);
		}

		result = this.productRepository.save(product);

		return result;
	}
}
