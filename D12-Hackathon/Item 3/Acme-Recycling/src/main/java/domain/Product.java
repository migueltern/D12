
package domain;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.URL;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Access(AccessType.PROPERTY)
public class Product extends Opinable {

	// Attributes -------------------------------------------------------------

	private Date	publicationMoment;
	private String	description;
	private Double	quantity;
	private String	photo;


	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd hh:mm")
	@Past
	@NotNull
	public Date getPublicationMoment() {
		return this.publicationMoment;
	}

	public void setPublicationMoment(final Date publicationMoment) {
		this.publicationMoment = publicationMoment;
	}

	@NotBlank
	public String getDescription() {
		return this.description;
	}

	public void setDescription(final String description) {
		this.description = description;
	}

	public Double getQuantity() {
		return this.quantity;
	}

	public void setQuantity(final Double quantity) {
		this.quantity = quantity;
	}

	@URL
	public String getPhoto() {
		return this.photo;
	}

	public void setPhoto(final String photo) {
		this.photo = photo;
	}


	// Relationships ---------------------------------------------------------------

	private Collection<CategoryProduct>	categoryProducts;
	private Puntuation					puntuation;
	private Carrier						carrier;
	private Recycler					recycler;


	@OneToMany
	@Valid
	@NotNull
	public Collection<CategoryProduct> getCategoryProducts() {
		return this.categoryProducts;
	}

	public void setCategoryProducts(final Collection<CategoryProduct> categoryProducts) {
		this.categoryProducts = categoryProducts;
	}

	@OneToOne(optional = true)
	@NotNull
	@Valid
	public Puntuation getPuntuation() {
		return this.puntuation;
	}

	public void setPuntuation(final Puntuation puntuation) {
		this.puntuation = puntuation;
	}

	@ManyToOne(optional = true)
	@Valid
	public Carrier getCarrier() {
		return this.carrier;
	}

	public void setCarrier(final Carrier carrier) {
		this.carrier = carrier;
	}

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
