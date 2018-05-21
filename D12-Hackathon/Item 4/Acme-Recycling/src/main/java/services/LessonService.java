
package services;

import java.util.Collection;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;

import repositories.LessonRepository;
import domain.Buyer;
import domain.Course;
import domain.Lesson;

@Service
@Transactional
public class LessonService {

	// Managed repository -----------------------------------------------------
	@Autowired
	private LessonRepository	lessonRepository;
	@Autowired
	private BuyerService		buyerService;
	@Autowired
	private Validator			validator;


	// Supporting services ----------------------------------------------------

	// Constructors -----------------------------------------------------------
	public LessonService() {
		super();
	}

	// Simple CRUD methods ----------------------------------------------------

	public Lesson create(final Course course) {
		Date date;
		Buyer buyer;
		Lesson lesson;
		Integer number;

		number = this.lessonRepository.findLessonsByCourseId(course.getId()).size() + 1;

		date = new Date();
		buyer = this.buyerService.findByPrincipal();

		//Comprobamos que sea un buyer
		Assert.isTrue(this.buyerService.checkPrincipalBoolean());
		//El curso debe de estar en modo borrador
		Assert.isTrue(course.isDraftMode());
		//No puedo crear lecciones para un curso que ya ha pasado
		if (course.getRealisedMoment() != null)
			Assert.isTrue(course.getRealisedMoment().after(date));
		//No puedo crear lecciones para un curso que no sea del buyer conectado
		Assert.isTrue(buyer.getCourses().contains(course));

		lesson = new Lesson();
		lesson.setCourse(course);
		lesson.setNumber(number);
		return lesson;
	}

	public Lesson save(final Lesson lesson) {
		Assert.notNull(lesson);
		Lesson result;

		Assert.isTrue(lesson.getSummary().length() >= 10, "Summary demasiado pequeño");
		Assert.isTrue(lesson.getSummary().length() <= 50, "Summary demasiado grande");
		result = this.lessonRepository.save(lesson);

		Assert.notNull(result);

		return result;

	}

	public void delete(final Lesson lesson) {

		Assert.notNull(lesson);
		Assert.isTrue(lesson.getId() != 0);

		this.lessonRepository.delete(lesson);

	}

	public Collection<Lesson> findAll() {
		Collection<Lesson> result;

		result = this.lessonRepository.findAll();
		return result;
	}

	public Lesson findOne(final int lessonId) {
		Assert.isTrue(lessonId != 0);

		Lesson result;

		result = this.lessonRepository.findOne(lessonId);
		return result;
	}

	//Other business methods---------------------------------------------------

	public Collection<Lesson> findLessonsByCourseId(final int courseId) {
		Collection<Lesson> result;

		result = this.lessonRepository.findLessonsByCourseId(courseId);

		return result;

	}

	public void flush() {
		this.lessonRepository.flush();
	}

	public Lesson reconstruct(final Lesson lesson, final BindingResult bindingResult) {
		Lesson result;
		final Lesson lessonBd;

		if (lesson.getId() == 0)
			result = lesson;
		else {
			lessonBd = this.lessonRepository.findOne(lesson.getId());
			lesson.setId(lessonBd.getId());
			lesson.setVersion(lessonBd.getVersion());
			lesson.setCourse(lessonBd.getCourse());
			lesson.setNumber(lessonBd.getNumber());
			result = lesson;
		}
		this.validator.validate(result, bindingResult);
		return result;
	}
}
