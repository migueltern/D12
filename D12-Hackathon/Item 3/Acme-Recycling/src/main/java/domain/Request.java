
package domain;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
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


	@Pattern(regexp = "^\\w{2}\\d{2}(0[1-9]{1}|1[0-2]{1})((0|1|2)\\d{1}|3[0-1]{1})\\w {2}$")
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

}
