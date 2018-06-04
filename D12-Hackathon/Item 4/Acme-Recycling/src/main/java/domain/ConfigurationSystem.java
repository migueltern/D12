
package domain;

import java.util.Collection;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.Range;
import org.hibernate.validator.constraints.SafeHtml;
import org.hibernate.validator.constraints.URL;
import org.hibernate.validator.constraints.SafeHtml.WhiteListType;

@Entity
@Access(AccessType.PROPERTY)
public class ConfigurationSystem extends DomainEntity {

	// Relationships---------------------------------------------------------------

	private String	name;
	private String	banner;
	private String	englishWelcomeMessage;
	private String	spanishWelcomeMessage;
	private int		maxNumberFinder;
	private int		cacheMaxTime;
	private String	whoAreWeSpanish;
	private String	locationSpanish;
	private String	whoAreWeEnglish;
	private String	locationEnglish;
	private String	aboutUsPicture;


	@NotBlank
	@URL
	public String getAboutUsPicture() {
		return this.aboutUsPicture;
	}

	public void setAboutUsPicture(final String aboutUsPicture) {
		this.aboutUsPicture = aboutUsPicture;
	}

	@NotBlank
	@SafeHtml(whitelistType = WhiteListType.NONE)
	public String getWhoAreWeEnglish() {
		return this.whoAreWeEnglish;
	}

	public void setWhoAreWeEnglish(final String whoAreWeEnglish) {
		this.whoAreWeEnglish = whoAreWeEnglish;
	}

	@NotBlank
	@SafeHtml(whitelistType = WhiteListType.NONE)
	public String getLocationEnglish() {
		return this.locationEnglish;
	}

	public void setLocationEnglish(final String locationEnglish) {
		this.locationEnglish = locationEnglish;
	}

	@NotBlank
	@SafeHtml(whitelistType = WhiteListType.NONE)
	public String getLocationSpanish() {
		return this.locationSpanish;
	}

	public void setLocationSpanish(final String locationSpanish) {
		this.locationSpanish = locationSpanish;
	}

	@NotBlank
	@SafeHtml(whitelistType = WhiteListType.NONE)
	public String getWhoAreWeSpanish() {
		return this.whoAreWeSpanish;
	}

	public void setWhoAreWeSpanish(final String whoAreWeSpanish) {
		this.whoAreWeSpanish = whoAreWeSpanish;
	}

	@NotBlank
	@SafeHtml(whitelistType = WhiteListType.NONE)
	public String getEnglishWelcomeMessage() {
		return this.englishWelcomeMessage;
	}

	public void setEnglishWelcomeMessage(final String englishWelcomeMessage) {
		this.englishWelcomeMessage = englishWelcomeMessage;
	}

	@NotBlank
	@SafeHtml(whitelistType = WhiteListType.NONE)
	public String getSpanishWelcomeMessage() {
		return this.spanishWelcomeMessage;
	}

	public void setSpanishWelcomeMessage(final String spanishWelcomeMessage) {
		this.spanishWelcomeMessage = spanishWelcomeMessage;
	}

	@NotBlank
	@SafeHtml(whitelistType = WhiteListType.NONE)
	public String getName() {
		return this.name;
	}

	public void setName(final String name) {
		this.name = name;
	}
	@URL
	@NotBlank
	public String getBanner() {
		return this.banner;
	}

	public void setBanner(final String banner) {
		this.banner = banner;
	}

	@Range(min = 1, max = 100)
	public int getMaxNumberFinder() {
		return this.maxNumberFinder;
	}

	public void setMaxNumberFinder(final int maxNumberFinder) {
		this.maxNumberFinder = maxNumberFinder;
	}

	@Range(min = 1, max = 24)
	public int getCacheMaxTime() {
		return this.cacheMaxTime;
	}

	public void setCacheMaxTime(final int cacheMaxTime) {
		this.cacheMaxTime = cacheMaxTime;
	}


	// Relationships ---------------------------------------------------------------

	private Collection<TabooWord>	tabooWords;
	private Collection<Legislation>	laws;


	@OneToMany
	@Valid
	@NotNull
	public Collection<TabooWord> getTabooWords() {
		return this.tabooWords;
	}

	public void setTabooWords(final Collection<TabooWord> tabooWords) {
		this.tabooWords = tabooWords;
	}

	@OneToMany
	@Valid
	@NotNull
	public Collection<Legislation> getLaws() {
		return this.laws;
	}

	public void setLaws(final Collection<Legislation> laws) {
		this.laws = laws;
	}

}
