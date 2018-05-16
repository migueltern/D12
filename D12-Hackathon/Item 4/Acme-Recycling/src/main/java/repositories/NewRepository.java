
package repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Comment;
import domain.New;

@Repository
public interface NewRepository extends JpaRepository<New, Integer> {

	//Me devuelve todos los comentarios que tiene una noticia
	@Query("select c from New n join n.comments c where n.id=?1")
	Collection<Comment> findCommentsByNew(int newId);

}
