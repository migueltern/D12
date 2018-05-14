
package services;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.CourseRepository;
import domain.Course;
import domain.Lesson;
import domain.Material;
import domain.Recycler;

@Service
@Transactional
public class CourseService {

	// Managed repository -----------------------------------------------------
	@Autowired
	private CourseRepository	courseRepository;

	@Autowired
	private BuyerService		buyerService;

	@Autowired
	private RecyclerService		recyclerService;


	// Supporting services ----------------------------------------------------

	// Constructors -----------------------------------------------------------
	public CourseService() {
		super();
	}

	// Simple CRUD methods ----------------------------------------------------
	public Course create() {
		Course result;
		Collection<Material> materials;
		Collection<Lesson> lessons;

		materials = new ArrayList<Material>();
		lessons = new ArrayList<Lesson>();

		//Solo un buyer podrá crear un curso
		Assert.isTrue(this.buyerService.checkPrincipalBoolean());

		result = new Course();

		result.setMaterials(materials);
		result.setLessons(lessons);

		return result;
	}

	public Collection<Course> findAll() {
		Collection<Course> result;
		result = this.courseRepository.findAll();
		Assert.notNull(result);
		return result;
	}

	public Course findOne(final int courseId) {
		Assert.isTrue(courseId != 0);
		Course result;
		result = this.courseRepository.findOne(courseId);
		return result;
	}

	public Course save(final Course course) {
		Assert.notNull(course);
		final Course result;

		//Si está en modo final la fecha es obligatoria
		if (!course.isDraftMode())
			Assert.notNull(course.getRealisedMoment(), "La fecha no puede ser nula");

		result = this.courseRepository.save(course);

		return result;
	}

	// Other business methods -------------------------------------------------

	public Collection<Course> coursesOfRecyclerFinished() {
		Collection<Course> result;
		Recycler recyclerConnected;

		recyclerConnected = this.recyclerService.findByPrincipal();

		result = this.courseRepository.coursesOfRecyclerFinished(recyclerConnected.getId());

		return result;

	}

}
