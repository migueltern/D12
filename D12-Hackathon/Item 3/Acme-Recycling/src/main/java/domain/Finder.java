
package domain;

import java.util.Date;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Access(AccessType.PROPERTY)
public class Finder extends DomainEntity {

	// Attributes -------------------------------------------------------------

	private String	keyWord;
	private Double	lowPrice;
	private Double	highPrice;
	private Date	starCacheTime;


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
	public Date getStarCacheTime() {
		return this.starCacheTime;
	}

	public void setStarCacheTime(final Date starCacheTime) {
		this.starCacheTime = starCacheTime;
	}

}
