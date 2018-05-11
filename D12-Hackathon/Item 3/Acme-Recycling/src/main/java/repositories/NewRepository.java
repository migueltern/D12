
package repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import domain.New;

@Repository
public interface NewRepository extends JpaRepository<New, Integer> {

}
