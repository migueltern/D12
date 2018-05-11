
package repositories;



import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Buyer;

@Repository
public interface BuyerRepository extends JpaRepository<Buyer, Integer> {

	@Query("select b from Buyer b where b.userAccount.id = ?1")
	Buyer findByBuyerAccountId(int id);
}
