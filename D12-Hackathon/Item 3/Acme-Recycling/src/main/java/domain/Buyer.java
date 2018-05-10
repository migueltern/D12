
package domain;

import java.util.Collection;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;

@Entity
@Access(AccessType.PROPERTY)
public class Buyer extends Actor {

	// Relationships ---------------------------------------------------------------
	private Collection<Buy>		buys;
	private Collection<Course>	courses;


	@NotNull
	@Valid
	@OneToMany
	public Collection<Buy> getBuys() {
		return this.buys;
	}

	public void setBuys(final Collection<Buy> buys) {
		this.buys = buys;
	}
	@NotNull
	@Valid
	@OneToMany
	public Collection<Course> getCourses() {
		return this.courses;
	}

	public void setCourse(final Collection<Course> courses) {
		this.courses = courses;
	}

}
