
package repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Course;

@Repository
public interface CourseRepository extends JpaRepository<Course, Integer> {

	@Query("select r.courses from Recycler r join r.courses c where c.realisedMoment<current_date and r.id=?1")
	Collection<Course> coursesOfRecyclerFinished(int recyclerId);

	@Query("select c from Course c where c.realisedMoment>current_date and c.minimumScore<?1 and c.draftMode=false")
	Collection<Course> coursesAvailables(int puntuation);

}
