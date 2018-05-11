
package repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Recycler;

@Repository
public interface RecyclerRepository extends JpaRepository<Recycler, Integer> {

	@Query("select r from Recycler r where r.userAccount.id = ?1")
	Recycler findByUserAccountId(int id);
}
