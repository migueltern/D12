
package repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import domain.PickUp;

@Repository
public interface PickUpRepository extends JpaRepository<PickUp, Integer> {

}
