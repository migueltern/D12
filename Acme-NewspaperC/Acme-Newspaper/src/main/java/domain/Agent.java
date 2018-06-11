
package domain;

import java.util.Collection;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.validation.Valid;

@Entity
@Access(AccessType.PROPERTY)
public class Agent extends Actor {

	//Relationships-----------------------------------------------------------------

	private Collection<Advertisement>	advertisements;


	@OneToMany(mappedBy = "agent")
	@Valid
	public Collection<Advertisement> getAdvertisements() {
		return this.advertisements;
	}

	public void setAdvertisements(final Collection<Advertisement> advertisements) {
		this.advertisements = advertisements;
	}

}
