
package repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Message;

@Repository
public interface MessageRepository extends JpaRepository<Message, Integer> {

	@Query("select m from Message m where messageFolder.id=?1")
	Collection<Message> findMessagesByMessageFolder(int messageFolderId);

	
	@Query("select m from Message m where m.messageFolder.id = ?1 and (m.subject like %?2% or m.body like %?2%)")
	Collection<Message> findMessageWithTabooWord(int messageFolderId, String tabooWord);

}
