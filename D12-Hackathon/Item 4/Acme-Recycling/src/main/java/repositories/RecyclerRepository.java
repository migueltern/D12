
package repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Comment;
import domain.Recycler;

@Repository
public interface RecyclerRepository extends JpaRepository<Recycler, Integer> {

	@Query("select r from Recycler r where r.userAccount.id = ?1")
	Recycler findByUserAccountId(int id);

	//Query que me devuelve todos los comentarios dado un reciclador
	@Query("select c from Recycler r join r.comments c where r.id=?1")
	Collection<Comment> findAllCommentsByRecycler(int recyclerId);
}
