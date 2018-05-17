
package repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Admin;
import domain.Editor;
import domain.New;

@Repository
public interface AdminRepository extends JpaRepository<Admin, Integer> {

	@Query("select a from Admin a where a.userAccount.id = ?1")
	Admin findByUserAccountId(int id);

	@Query("select c from New c where c.comments.size=(select max(t.comments.size) from New t)")
	Collection<New> findNewWithMoreComments();

	@Query("select e from Editor e where e.news.size=(select max(n.news.size) from Editor n)")
	Collection<Editor> findEditorsWithMoreNewsRedacted();

}
