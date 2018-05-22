
package domain;

import java.util.Collection;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;

import org.hibernate.validator.constraints.NotBlank;

import cz.jirutka.validator.collection.constraints.EachURL;

@Entity
@Access(AccessType.PROPERTY)
public class Legislation extends DomainEntity {

	// Attributes -------------------------------------------------------------

	private String				title;
	private String				body;
	private Collection<String>	links;


	@NotBlank
	public String getTitle() {
		return this.title;
	}

	public void setTitle(final String title) {
		this.title = title;
	}

	@NotBlank
	public String getBody() {
		return this.body;
	}

	public void setBody(final String body) {
		this.body = body;
	}

	@EachURL
	@ElementCollection
	public Collection<String> getLinks() {
		return this.links;
	}

	public void setLinks(final Collection<String> links) {
		this.links = links;
	}

}
