
package domain;

import java.util.Collection;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.ManyToMany;
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
	private PickUp					pickUp;


	@ManyToMany
	@Valid
	public Collection<CleanPoint> getCleanPoints() {
		return this.cleanPoints;
	}

	public void setCleanPoints(final Collection<CleanPoint> cleanPoints) {
		this.cleanPoints = cleanPoints;
	}

	@OneToOne(optional = false)
	@NotNull
	@Valid
	public PickUp getPickUp() {
		return this.pickUp;
	}

	public void setPickUp(final PickUp pickUp) {
		this.pickUp = pickUp;
	}

}
