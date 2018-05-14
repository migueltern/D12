
package repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import domain.Assesment;

@Repository
public interface AssesmentRepository extends JpaRepository<Assesment, Integer> {

}
