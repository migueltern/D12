
package repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import domain.Label;

public interface LabelRepository extends JpaRepository<Label, Integer> {

}
