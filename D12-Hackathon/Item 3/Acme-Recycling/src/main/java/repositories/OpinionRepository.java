
package repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Opinion;

@Repository
public interface OpinionRepository extends JpaRepository<Opinion, Integer> {

	@Query("select p from Product p where p.id=(select o.opinable.id from Actor a join a.opinions o where a.id=?1)")
	Collection<Opinion> findOpinableProductByActor(int actorId);

	@Query("select c from Course c where c.id=(select o.opinable.id from Actor a join a.opinions o where a.id=?1)")
	Collection<Opinion> findOpinableCourseByActor(int actorId);

}
