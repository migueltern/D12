
package domain;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.validation.Valid;
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

	private Recycler	recycler;


	@ManyToOne(optional = false)
	@NotNull
	@Valid
	public Recycler getRecycler() {
		return this.recycler;
	}

	public void setRecycler(final Recycler recycler) {
		this.recycler = recycler;
	}

}
