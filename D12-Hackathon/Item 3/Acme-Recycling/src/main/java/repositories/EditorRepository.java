
package repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import domain.Course;

@Repository
public interface EditorRepository extends JpaRepository<Course, Integer> {

}
