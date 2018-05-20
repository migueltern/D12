
package services;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;

import repositories.CourseRepository;
import domain.Buyer;
import domain.Course;
import domain.Item;
import domain.Lesson;
import domain.Material;
import domain.Opinion;
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

	@Autowired
	private LessonService		lessonService;

	@Autowired
	private Validator			validator;


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
		Collection<Opinion> opinions;

		materials = new ArrayList<Material>();
		lessons = new ArrayList<Lesson>();
		opinions = new ArrayList<Opinion>();

		//Solo un buyer podrá crear un curso
		Assert.isTrue(this.buyerService.checkPrincipalBoolean());

		result = new Course();

		result.setMaterials(materials);
		result.setLessons(lessons);
		result.setOpinions(opinions);

		return result;
	}

	public Course save(final Course course) {
		Assert.notNull(course);
		final Course result;
		Collection<Course> courses;
		Buyer buyer;
		Date date;

		date = new Date();
		buyer = new Buyer();
		buyer = this.buyerService.findByPrincipal();
		courses = new ArrayList<>(this.courseRepository.findCoursesCreatedByBuyer(buyer.getId()));

		//Un buyer solo podrá editar un curso que haya creado él.
		if (course.getId() != 0)
			Assert.isTrue(courses.contains(course));
		//Solo un buyer podrá crear un curso
		Assert.isTrue(this.buyerService.checkPrincipalBoolean());
		//Sólo si está en modo borrador se podrá editar el course
		//Assert.isTrue(course.isDraftMode());
		//Si está en modo final la fecha es obligatoria
		if (!course.isDraftMode())
			Assert.notNull(course.getRealisedMoment(), "La fecha no puede ser nula");
		//Al menos un material es obligatorio
		Assert.isTrue(course.getMaterials().size() > 0, "Al menos un material es obligatorio");
		//
		if (course.getRealisedMoment() != null)
			Assert.isTrue(course.getRealisedMoment().after(date), "Fecha de realizacion debe ser posterior a la actual");

		result = this.courseRepository.save(course);
		if (course.getId() == 0)
			buyer.getCourses().add(result);
		return result;
	}

	public void delete(final Course course) {
		Assert.notNull(course);
		Buyer buyer;
		final Collection<Recycler> recyclers;

		Collection<Lesson> lessons;

		//Sólo si está en modo borrar se podrá eliminar el course
		Assert.isTrue(course.isDraftMode(), "Existe un curso que no esta en modo final");

		lessons = this.lessonService.findLessonsByCourseId(course.getId());
		for (final Lesson l : lessons) {
			l.setCourse(null);
			this.lessonService.delete(l);
		}

		if (this.buyerService.findBuyerByCourse(course) != null) {
			buyer = this.buyerService.findBuyerByCourse(course);
			buyer.getCourses().remove(course);
		}

		recyclers = this.recyclerService.findRecyclerByCourse(course);
		for (final Recycler r : recyclers)
			r.getCourses().remove(course);

		this.courseRepository.delete(course);
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

	// Other business methods -------------------------------------------------

	public Collection<Course> coursesOfRecyclerFinished() {
		Collection<Course> result;
		Recycler recyclerConnected;

		recyclerConnected = this.recyclerService.findByPrincipal();

		result = this.courseRepository.coursesOfRecyclerFinished(recyclerConnected.getId());

		return result;

	}
	public Collection<Course> findCoursesCreatedByBuyer() {
		Collection<Course> result;
		Buyer buyerConnected;

		buyerConnected = this.buyerService.findByPrincipal();

		result = this.courseRepository.findCoursesCreatedByBuyer(buyerConnected.getId());

		return result;

	}

	public Collection<Course> coursesAvailables(final Recycler recycler) {

		Collection<Item> itemsOfRecycler;
		Collection<Course> coursesAvailables;
		Collection<Course> coursesOfRecycler;
		itemsOfRecycler = recycler.getItems();

		Integer puntuationOfRecycler = 0;
		for (final Item i : itemsOfRecycler)
			if (i.getRequest().getStatus().equals("FINISHED"))
				puntuationOfRecycler = puntuationOfRecycler + i.getValue();

		coursesOfRecycler = recycler.getCourses();
		coursesAvailables = this.courseRepository.coursesAvailables(puntuationOfRecycler);
		coursesAvailables.removeAll(coursesOfRecycler);
		return coursesAvailables;

	}

	public void assist(final Course course) {
		Recycler recyclerConnected;
		Recycler result;

		recyclerConnected = this.recyclerService.findByPrincipal();

		Assert.notNull(course);
		Assert.notNull(recyclerConnected);

		recyclerConnected.getCourses().add(course);

		result = this.recyclerService.save(recyclerConnected);

		Assert.notNull(result);
	}

	//	RECONSTRUCTOR
	public Course reconstruct(final Course course, final BindingResult bindingResult) {
		Course result;
		Course courseBd;

		if (course.getId() == 0) {
			Collection<Lesson> lessons;
			final Collection<Opinion> opinions;
			result = course;

			lessons = new ArrayList<Lesson>();
			opinions = new ArrayList<Opinion>();

			result.setLessons(lessons);
			result.setOpinions(opinions);
			if (course.getMaterials().contains(null))
				course.setMaterials(new ArrayList<Material>());
		}

		else {
			courseBd = this.courseRepository.findOne(course.getId());
			course.setId(courseBd.getId());
			course.setVersion(courseBd.getVersion());
			course.setLessons(courseBd.getLessons());
			//course.setMaterials(courseBd.getMaterials());
			course.setOpinions(courseBd.getOpinions());
			if (course.getMaterials().contains(null))
				course.setMaterials(new ArrayList<Material>());
			result = course;
		}
		this.validator.validate(result, bindingResult);
		return result;
	}

	public Collection<Course> findCoursesOfMaterial(final int materialId) {
		Collection<Course> courses;
		courses = this.courseRepository.findCoursesOfMaterial(materialId);
		return courses;
	}
}
