
package services;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.MaterialRepository;

import domain.Material;

@Service
@Transactional
public class MaterialService {

	@Autowired
	MaterialRepository	materialRepository;


	public MaterialService() {
		super();
	}
	// Simple CRUD methods ----------------------------------------------------

	public Material create() {
		final Material result;
		result = new Material();
		return result;
	}

	public Collection<Material> findAll() {
		Collection<Material> res;
		res = this.materialRepository.findAll();
		return res;
	}

	public Material findOne(final int intBuy) {
		Material res;
		res = this.materialRepository.findOne(intBuy);
		return res;
	}

	public Material save(final Material material) {
		Material result;
		//TODO comprobar
		Assert.notNull(material);
		result = this.materialRepository.save(material);

		return result;
	}

}
