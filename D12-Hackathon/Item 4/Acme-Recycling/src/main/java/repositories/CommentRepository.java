
package repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Comment;
import domain.New;

@Repository
public interface CommentRepository extends JpaRepository<Comment, Integer> {

	//dado un comentario que me devuelva la new
	@Query("select n from New n join n.comments c where c.id=?1")
	New findNewbyComment(int commentId);

}
