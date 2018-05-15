
package domain;

import java.util.Collection;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotBlank;

@Entity
@Access(AccessType.PROPERTY)
public class Request extends DomainEntity {

	// Attributes -------------------------------------------------------------

	private String	code;
	private String	title;
	private String	observation;
	private String	status;


	@NotBlank
	@Pattern(regexp = "^\\w{2}\\d{2}(0[1-9]{1}|1[0-2]{1})((0|1|2)\\d{1}|3[0-1]{1})\\w{2}$")
	public String getCode() {
		return this.code;
	}

	public void setCode(final String code) {
		this.code = code;
	}
	@NotBlank
	public String getTitle() {
		return this.title;
	}

	public void setTitle(final String title) {
		this.title = title;
	}

	public String getObservation() {
		return this.observation;
	}

	public void setObservation(final String observation) {
		this.observation = observation;
	}

	@Pattern(regexp = "(PENDING)|(FINISHED)|(IN COLLECTION) | (CLEAN POINT) | (CANCELLED)")
	public String getStatus() {
		return this.status;
	}

	public void setStatus(final String status) {
		this.status = status;
	}


	// Relationships ---------------------------------------------------------------

	private Collection<CleanPoint>	cleanPoints;
	private Assesment				assesment;
	private Item					item;
	private Carrier					carrier;


	@ManyToMany
	@Valid
	public Collection<CleanPoint> getCleanPoints() {
		return this.cleanPoints;
	}

	public void setCleanPoints(final Collection<CleanPoint> cleanPoints) {
		this.cleanPoints = cleanPoints;
	}

	@OneToOne(optional = true)
	@Valid
	public Assesment getAssesment() {
		return this.assesment;
	}

	public void setAssesment(final Assesment assesment) {
		this.assesment = assesment;
	}

	@OneToOne(optional = false)
	@NotNull
	@Valid
	public Item getItem() {
		return this.item;
	}

	public void setItem(final Item item) {
		this.item = item;
	}

	@ManyToOne(optional = false)
	public Carrier getCarrier() {
		return this.carrier;
	}

	public void setCarrier(final Carrier carrier) {
		this.carrier = carrier;
	}

}