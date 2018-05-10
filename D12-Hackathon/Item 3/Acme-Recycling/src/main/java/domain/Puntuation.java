
package domain;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;

import org.hibernate.validator.constraints.Range;

@Entity
@Access(AccessType.PROPERTY)
public class Puntuation extends DomainEntity {

	// Attributes -------------------------------------------------------------

	private int	value;


	@Range(min = 0, max = 500)
	public int getValue() {
		return this.value;
	}

	public void setValue(final int value) {
		this.value = value;
	}

	// Relationships ---------------------------------------------------------------

}
