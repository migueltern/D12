
package repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import domain.Opinable;

@Repository
public interface OpinableRepository extends JpaRepository<Opinable, Integer> {

}
