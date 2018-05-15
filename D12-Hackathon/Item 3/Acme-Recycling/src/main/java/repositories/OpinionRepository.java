
package repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Opinion;

@Repository
public interface OpinionRepository extends JpaRepository<Opinion, Integer> {

	@Query("select (select o from Item i where i.id=o.opinable.id) from Actor a join a.opinions o where a.id=?1")
	Collection<Opinion> findOpinableItemByActor(int actorId);

	@Query("select (select o from Course c where c.id=o.opinable.id) from Actor a join a.opinions o where a.id=?1")
	Collection<Opinion> findOpinableCourseByActor(int actorId);

}
