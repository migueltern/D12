
package domain;

import java.util.Collection;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

@Entity
@Access(AccessType.PROPERTY)
public class Material extends DomainEntity {

	// Attributes -------------------------------------------------------------

	private String	title;
	private String	description;
	private double	pricePerQuantity;
	private double	quantity;
	private double	totalPrice;


	@NotBlank
	public String getTitle() {
		return this.title;
	}

	public void setTitle(final String title) {
		this.title = title;
	}

	@NotBlank
	public String getDescription() {
		return this.description;
	}

	public void setDescription(final String description) {
		this.description = description;
	}

	public double getPricePerQuantity() {
		return this.pricePerQuantity;
	}

	public void setPricePerQuantity(final double pricePerQuantity) {
		this.pricePerQuantity = pricePerQuantity;
	}

	public double getQuantity() {
		return this.quantity;
	}

	public void setQuantity(final double quantity) {
		this.quantity = quantity;
	}

	public double getTotalPrice() {
		return this.totalPrice;
	}

	public void setTotalPrice(final double totalPrice) {
		this.totalPrice = totalPrice;
	}


	// Relationships ---------------------------------------------------------------

	private Collection<CategoryMaterial>	categoryMaterials;


	@OneToMany
	@Valid
	@NotNull
	public Collection<CategoryMaterial> getCategoryMaterials() {
		return this.categoryMaterials;
	}

	public void setCategoryMaterials(final Collection<CategoryMaterial> categoryMaterials) {
		this.categoryMaterials = categoryMaterials;
	}

}
