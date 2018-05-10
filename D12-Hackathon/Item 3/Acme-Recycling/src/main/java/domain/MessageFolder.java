
package domain;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;

import org.hibernate.validator.constraints.NotBlank;

@Entity
@Access(AccessType.PROPERTY)
public class MessageFolder extends DomainEntity {

	// Attributes -------------------------------------------------------------

	private String	name;
	private boolean	modifiable;


	@NotBlank
	public String getName() {
		return this.name;
	}

	public void setName(final String name) {
		this.name = name;
	}

	public boolean isModifiable() {
		return this.modifiable;
	}

	public void setModifiable(final boolean modifiable) {
		this.modifiable = modifiable;
	}

	// Relationships ---------------------------------------------------------------

}
