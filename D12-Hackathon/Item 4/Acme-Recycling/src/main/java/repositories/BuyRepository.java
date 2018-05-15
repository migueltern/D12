
package repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import domain.Buy;

@Repository
public interface BuyRepository extends JpaRepository<Buy, Integer> {

}
