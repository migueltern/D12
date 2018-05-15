
package services;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.LessonRepository;
import domain.Lesson;

@Service
@Transactional
public class LessonService {

	// Managed repository -----------------------------------------------------
	@Autowired
	private LessonRepository	lessonRepository;


	// Supporting services ----------------------------------------------------

	// Constructors -----------------------------------------------------------
	public LessonService() {
		super();
	}

	// Simple CRUD methods ----------------------------------------------------

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
}
