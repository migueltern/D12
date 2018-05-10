
package domain;

import java.util.Collection;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;

@Entity
@Access(AccessType.PROPERTY)
public class Editor extends Actor {

	// Relationships ---------------------------------------------------------------
	private Collection<New>	news;


	@OneToMany
	@Valid
	@NotNull
	public Collection<New> getNews() {
		return this.news;
	}

	public void setNews(final Collection<New> news) {
		this.news = news;
	}

}
