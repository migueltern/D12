
package repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import domain.Incidence;

public interface IncidenceRepository extends JpaRepository<Incidence, Integer> {

}
