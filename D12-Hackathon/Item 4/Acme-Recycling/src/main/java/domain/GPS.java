
package domain;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Embeddable;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.Range;
import org.hibernate.validator.constraints.SafeHtml;
import org.hibernate.validator.constraints.SafeHtml.WhiteListType;

@Embeddable
@Access(AccessType.PROPERTY)
public class GPS {

	// Attributes -------------------------------------------------------------
	private double	longitude;
	private double	latitude;
	private String	name;


	@Range(min = -180, max = 180)
	public double getLongitude() {
		return this.longitude;
	}

	public void setLongitude(final double longitude) {
		this.longitude = longitude;
	}
	@Range(min = -90, max = 90)
	public double getLatitude() {
		return this.latitude;
	}

	public void setLatitude(final double latitude) {
		this.latitude = latitude;
	}

	@NotBlank
	@SafeHtml(whitelistType = WhiteListType.NONE)
	public String getName() {
		return this.name;
	}

	public void setName(final String name) {
		this.name = name;
	}

}
