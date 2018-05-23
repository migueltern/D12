
package services;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.MaterialRepository;
import domain.Buy;
import domain.Course;
import domain.Finder;
import domain.Material;

@Service
@Transactional
public class MaterialService {

	@Autowired
	MaterialRepository	materialRepository;

	@Autowired
	AdminService		adminService;

	@Autowired
	BuyService			buyService;

	@Autowired
	FinderService		finderService;

	@Autowired
	CourseService		courseService;


	public MaterialService() {
		super();
	}
	// Simple CRUD methods ----------------------------------------------------

	public Material create() {
		final Material result;
		Collection<Buy> buys;
		buys = new ArrayList<Buy>();
		result = new Material();
		result.setBuys(buys);
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
		Assert.notNull(material);
		this.adminService.checkPrincipal();

		material.setTotalPrice(material.getQuantity() * material.getUnitPrice());

		result = this.materialRepository.save(material);

		return result;
	}

	public void delete(final Material material) {
		this.adminService.checkPrincipal();
		Assert.notNull(material);
		Assert.isTrue(material.getId() != 0);
		Collection<Buy> buysOfMaterial;
		Collection<Finder> findersOfMaterial;
		Collection<Course> coursesOfMaterial;
		buysOfMaterial = this.buyService.findBuysOfMaterial(material.getId());
		findersOfMaterial = this.finderService.findFindersOfMaterial(material.getId());
		coursesOfMaterial = this.courseService.findCoursesOfMaterial(material.getId());

		for (final Buy b : buysOfMaterial)
			this.buyService.delete(b);
		for (final Finder f : findersOfMaterial)
			this.finderService.delete(f);
		for (final Course c : coursesOfMaterial)
			this.courseService.delete(c);
		this.materialRepository.delete(material);
	}

	public void flush() {
		this.materialRepository.flush();
	}
}
