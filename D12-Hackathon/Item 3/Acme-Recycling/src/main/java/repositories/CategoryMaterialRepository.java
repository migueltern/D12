
package repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.CategoryMaterial;

@Repository
public interface CategoryMaterialRepository extends JpaRepository<CategoryMaterial, Integer> {

	@Query("select m.categoryMaterials from Material m")
	Collection<CategoryMaterial> categoryMaterialsOfAllMaterials();
}
