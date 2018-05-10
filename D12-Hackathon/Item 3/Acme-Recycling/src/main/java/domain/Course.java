
package domain;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.URL;

@Entity
@Access(AccessType.PROPERTY)
public class Course extends Opinion {

	// Attributes -------------------------------------------------------------

	private String	title;
	private String	description;
	private GPS		location;
	private Date	realisedMoment;
	private String	picture;
	private boolean	draftMode;
	private int		minimumScore;


	@Override
	@NotBlank
	public String getTitle() {
		return this.title;
	}

	@Override
	public void setTitle(final String title) {
		this.title = title;
	}
	@NotBlank
	public String getDescription() {
		return this.description;
	}

	public void setDescription(final String description) {
		this.description = description;
	}
	@NotNull
	@Valid
	public GPS getLocation() {
		return this.location;
	}

	public void setLocation(final GPS location) {
		this.location = location;
	}

	public Date getRealisedMoment() {
		return this.realisedMoment;
	}

	public void setRealisedMoment(final Date realisedMoment) {
		this.realisedMoment = realisedMoment;
	}

	@URL
	public String getPicture() {
		return this.picture;
	}

	public void setPicture(final String picture) {
		this.picture = picture;
	}

	public boolean isDraftMode() {
		return this.draftMode;
	}

	public void setDraftMode(final boolean draftMode) {
		this.draftMode = draftMode;
	}

	public int getMinimumScore() {
		return this.minimumScore;
	}

	public void setMinimumScore(final int minimumScore) {
		this.minimumScore = minimumScore;
	}


	// Relationships ---------------------------------------------------------------

	private Collection<Publication>	publications;
	private Collection<Material>	materials;


	@OneToMany
	@Valid
	@NotNull
	public Collection<Publication> getPublications() {
		return this.publications;
	}

	public void setPublications(final Collection<Publication> publications) {
		this.publications = publications;
	}

	@ManyToMany
	@Valid
	@NotNull
	public Collection<Material> getMaterials() {
		return this.materials;
	}

	public void setMaterials(final Collection<Material> materials) {
		this.materials = materials;
	}

}
