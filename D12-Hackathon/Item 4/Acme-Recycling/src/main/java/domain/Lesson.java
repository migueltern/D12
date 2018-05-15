
package domain;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;

@Entity
@Access(AccessType.PROPERTY)
public class Lesson extends DomainEntity {

	// Attributes -------------------------------------------------------------

	private String	title;
	private String	sumary;
	private int		number;


	@NotBlank
	public String getTitle() {
		return this.title;
	}

	public void setTitle(final String title) {
		this.title = title;
	}

	@NotBlank
	@Size(min = 10, max = 50)
	public String getSumary() {
		return this.sumary;
	}

	public void setSumary(final String sumary) {
		this.sumary = sumary;
	}

	public int getNumber() {
		return this.number;
	}

	public void setNumber(final int number) {
		this.number = number;
	}

}
