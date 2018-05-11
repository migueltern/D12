
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
public abstract class Opinable extends DomainEntity {

	public Opinable() {

	}


	//Relationships--------------------------------------------------------------
	private Collection<Opinion>	opinion;


	@Valid
	@NotNull
	@OneToMany(mappedBy = "opinable")
	public Collection<Opinion> getOpinion() {
		return this.opinion;
	}

	public void setOpinion(final Collection<Opinion> opinion) {
		this.opinion = opinion;
	}

}
