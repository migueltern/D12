
package repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import domain.Publication;

@Repository
public interface PublicationRepository extends JpaRepository<Publication, Integer> {

}
