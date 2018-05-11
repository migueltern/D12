
package repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import domain.CategoryMaterial;

@Repository
public interface CategoryMaterialRepository extends JpaRepository<CategoryMaterial, Integer> {

}
