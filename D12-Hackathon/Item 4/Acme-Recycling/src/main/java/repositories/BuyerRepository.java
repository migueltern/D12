
package repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Buyer;

@Repository
public interface BuyerRepository extends JpaRepository<Buyer, Integer> {

	@Query("select b from Buyer b where b.userAccount.id = ?1")
	Buyer findByBuyerAccountId(int id);

	//Me hace falta para el delete de course para el buyer
	@Query("select b from Buyer b join b.courses c where c.id=?1")
	Buyer findBuyerByCourse(int buyerId);

	@Query("select b from Buyer b join b.buys bs where bs.id=?1")
	Buyer findBuyerOfBuy(int buyId);

	@Query("select b from Buyer b where b.finder.id=?1")
	Buyer findBuyerOfFinder(int finderId);

}
