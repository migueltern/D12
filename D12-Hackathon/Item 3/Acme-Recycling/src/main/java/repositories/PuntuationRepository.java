
package repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import domain.Puntuation;

@Repository
public interface PuntuationRepository extends JpaRepository<Puntuation, Integer> {

}
