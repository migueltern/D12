
package repositories;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Finder;
import domain.Material;

@Repository
public interface FinderRepository extends JpaRepository<Finder, Integer> {

	@Query("select m from Material m where (m.title like %?1% or m.description like %?1%)")
	Page<Material> findByKeyWord(String keyWord, Pageable pageable);

	@Query("select m from Material m where m.totalPrice>=?1")
	Page<Material> findByLowPrice(Double lowPrice, Pageable pageable);

	@Query("select m from Material m where m.totalPrice<=?1")
	Page<Material> findByHighPrice(Double highPrice, Pageable pageable);

}
