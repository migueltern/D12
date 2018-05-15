
package repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Editor;
import domain.New;

@Repository
public interface EditorRepository extends JpaRepository<Editor, Integer> {

	@Query("select e from Editor e where e.userAccount.id = ?1")
	Editor findByUserAccountId(int id);

	@Query("select s from Editor e join e.news s where e.id=?1")
	Collection<New> findAllNewByEditor(int editorId);

}
