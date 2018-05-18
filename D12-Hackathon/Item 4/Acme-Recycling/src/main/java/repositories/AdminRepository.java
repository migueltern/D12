
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

	//QUERY I Las noticias que contengan más comentarios.
	@Query("select c from New c where c.comments.size=(select max(t.comments.size) from New t)")
	Collection<New> findNewWithMoreComments();

	//QUERY II Los redactores con mayor número de noticias redactadas.
	@Query("select e from Editor e where e.news.size=(select max(n.news.size) from Editor n)")
	Collection<Editor> findEditorsWithMoreNewsRedacted();

	//QUERY III Las 5 categorías con más productos asociados

	//QUERY IV La media, el mínimo, el máximo y la desviación típica de productos manejados por los manager.

	//QUERY V La media de la solicitudes con el estado Finalizadas

	//QUERY VI La media de usuarios que han reciclado al menos un producto.

	//QUERY VII La media de usuarios baneados en el sistema.

	//QUERY VIII La media, el mínimo, el máximo y la desviación típica de comentarios por noticias.

	//QUERY IX Número de productos(Items) que se han subido al sistema en el día de hoy.

	//QUERY X Dado un recicler la puntuación media de sus productos(Items).

	//QUERY XI La media, el mínimo, el máximo y la desviación típica peticiones por manager.

	//QUERY XII Material más demandado y el menos demandado.
}
