
package repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import domain.Incidence;

@Repository
public interface IncidenceRepository extends JpaRepository<Incidence, Integer> {

}
