
package domain;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.URL;

@Entity
@Access(AccessType.PROPERTY)
public class Publication extends DomainEntity {

	// Attributes -------------------------------------------------------------

	private String	photo;
	private String	caption;


	@URL
	@NotNull
	public String getPhoto() {
		return this.photo;
	}

	public void setPhoto(final String photo) {
		this.photo = photo;
	}

	@NotBlank
	public String getCaption() {
		return this.caption;
	}

	public void setCaption(final String caption) {
		this.caption = caption;
	}

	// Relationships ---------------------------------------------------------------

}
