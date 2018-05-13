
package repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.CategoryProduct;

@Repository
public interface CategoryProductRepository extends JpaRepository<CategoryProduct, Integer> {

	@Query("select c.categoryProducts from Product c")
	Collection<CategoryProduct> categoryProductsOfAllProducts();
}
