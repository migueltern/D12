
package domain;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Access(AccessType.PROPERTY)
public class Finder extends DomainEntity {

	// Attributes -------------------------------------------------------------

	private String	keyWord;
	private Double	lowPrice;
	private Double	highPrice;
	private Date	startCacheTime;


	@NotNull
	public String getKeyWord() {
		return this.keyWord;
	}

	public void setKeyWord(final String keyWord) {
		this.keyWord = keyWord;
	}

	public Double getLowPrice() {
		return this.lowPrice;
	}

	public void setLowPrice(final Double lowPrice) {
		this.lowPrice = lowPrice;
	}

	public Double getHighPrice() {
		return this.highPrice;
	}

	public void setHighPrice(final Double highPrice) {
		this.highPrice = highPrice;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd hh:mm")
	@NotNull
	public Date getStartCacheTime() {
		return this.startCacheTime;
	}

	public void setStartCacheTime(final Date startCacheTime) {
		this.startCacheTime = startCacheTime;
	}


	// Relationships ---------------------------------------------------------------

	private Collection<Material>	materials;


	@ManyToMany
	@NotNull
	@Valid
	public Collection<Material> getMaterials() {
		return this.materials;
	}

	public void setMaterials(final Collection<Material> materials) {
		this.materials = materials;
	}

}
