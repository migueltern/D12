
package domain;

import java.util.Collection;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.Range;

@Entity
@Access(AccessType.PROPERTY)
public class ConfigurationSystem extends DomainEntity {

	// Relationships---------------------------------------------------------------

	private String				name;
	private String				banner;
	private Collection<String>	welcomeMessages;
	private int					maxNumberFinder;
	private int					cacheMaxTime;


	@NotBlank
	public String getName() {
		return this.name;
	}

	public void setName(final String name) {
		this.name = name;
	}
	@NotNull
	public String getBanner() {
		return this.banner;
	}

	public void setBanner(final String banner) {
		this.banner = banner;
	}
	@NotNull
	@ElementCollection
	public Collection<String> getWelcomeMessages() {
		return this.welcomeMessages;
	}

	public void setWelcomeMessages(final Collection<String> welcomeMessages) {
		this.welcomeMessages = welcomeMessages;
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


	@OneToMany
	@Valid
	@NotNull
	public Collection<TabooWord> getTabooWords() {
		return this.tabooWords;
	}

	public void setTabooWords(final Collection<TabooWord> tabooWords) {
		this.tabooWords = tabooWords;
	}

}
