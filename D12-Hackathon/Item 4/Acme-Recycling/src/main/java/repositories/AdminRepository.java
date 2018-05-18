
package repositories;

import java.util.Collection;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Admin;
import domain.Editor;
import domain.LabelProduct;
import domain.New;

@Repository
public interface AdminRepository extends JpaRepository<Admin, Integer> {

	@Query("select a from Admin a where a.userAccount.id = ?1")
	Admin findByUserAccountId(int id);

	//QUERY I Las noticias que contengan m�s comentarios.
	@Query("select c from New c where c.comments.size=(select max(t.comments.size) from New t)")
	Collection<New> findNewWithMoreComments();

	//QUERY II Los redactores con mayor n�mero de noticias redactadas.
	@Query("select e from Editor e where e.news.size=(select max(n.news.size) from Editor n)")
	Collection<Editor> findEditorsWithMoreNewsRedacted();

	//QUERY III Las 5 categor�as de productos con m�s productos asociados
	@Query("select l from LabelProduct l where l.items.size!=0 order by l.items.size desc")
	Page<LabelProduct> findTop5LabelProducts(Pageable pageable);

	//QUERY IV La media, el m�nimo, el m�ximo y la desviaci�n t�pica de productos manejados por los manager.
	@Query("select avg(b.courses.size),min(b.courses.size),max(b.courses.size),stddev(b.courses.size) from Buyer b")
	Double[] avgMinMaxAndStddevOfCoursesByBuyer();

	//QUERY V La media de la solicitudes con el estado Finalizadas
	@Query("select count(i)*1.0/(select count(st) from Incidence st) from Incidence i where i.resolved=true")
	Double avgOfIncidencesResolved();

	//QUERY VI La media de usuarios que han reciclado al menos un producto.

	//QUERY VII La media de usuarios baneados en el sistema.

	//QUERY VIII La media, el m�nimo, el m�ximo y la desviaci�n t�pica de comentarios por noticias.

	//QUERY IX N�mero de productos(Items) que se han subido al sistema en el d�a de hoy.

	//QUERY X Dado un recicler la puntuaci�n media de sus productos(Items).

	//QUERY XI La media, el m�nimo, el m�ximo y la desviaci�n t�pica peticiones por manager.

	//QUERY XII Material m�s demandado y el menos demandado.
}
