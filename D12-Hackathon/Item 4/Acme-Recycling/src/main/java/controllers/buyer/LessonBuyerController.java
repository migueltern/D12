
package controllers.buyer;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.CourseService;
import services.LessonService;
import controllers.AbstractController;
import domain.Course;
import domain.Lesson;

@Controller
@RequestMapping("/lesson/buyer")
public class LessonBuyerController extends AbstractController {

	// Services---------------------------------------------------------
	@Autowired
	private LessonService	lessonService;

	@Autowired
	private CourseService	courseService;


	//Constructor--------------------------------------------------------
	public LessonBuyerController() {
		super();
	}

	//LO VEO UNA TONTERÍA POR LOS POCOS CAMPOS QUE TIENEN
	//Display-----------------------------------------------------------------
	@RequestMapping(value = "/display", method = RequestMethod.GET)
	public ModelAndView displayLesson(@RequestParam final int lessonId) {
		final ModelAndView result;
		Lesson lesson;

		lesson = new Lesson();

		lesson = this.lessonService.findOne(lessonId);

		result = new ModelAndView("lesson/display");
		result.addObject("lesson", lesson);
		result.addObject("requestURI", "lesson/buyer/display.do");

		return result;
	}

	// List ---------------------------------------------------------
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(@RequestParam final int courseId) {
		ModelAndView result;
		final Collection<Lesson> lessons;

		lessons = this.lessonService.findLessonsByCourseId(courseId);

		result = new ModelAndView("lesson/list");
		result.addObject("lessons", lessons);
		result.addObject("requestURI", "/lesson/buyer/list.do");

		return result;
	}

	// Create -----------------------------------------------------------------
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create(@RequestParam final int courseId) {
		ModelAndView result;
		final Course course;
		final Lesson lesson;

		course = this.courseService.findOne(courseId);
		lesson = this.lessonService.create(course);

		result = this.createEditModelAndView(lesson);
		return result;
	}

	// Save -----------------------------------------------------------------
	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView save(Lesson lesson, final BindingResult binding) {
		ModelAndView result;

		lesson = this.lessonService.reconstruct(lesson, binding);

		if (binding.hasErrors())
			result = this.createEditModelAndView(lesson);
		else
			try {

				this.lessonService.save(lesson);
				result = new ModelAndView("redirect:list.do?courseId=" + lesson.getCourse().getId());
			} catch (final Throwable oops) {
				if (oops.getMessage().equals("Summary demasiado pequeño"))
					result = this.createEditModelAndView(lesson, "request.lesson.summary.min");
				else if (oops.getMessage().equals("Summary demasiado grande"))
					result = this.createEditModelAndView(lesson, "request.lesson.summary.max");
				else
					result = this.createEditModelAndView(lesson, "lesson.commit.error");
			}
		return result;
	}

	protected ModelAndView createEditModelAndView(final Lesson lesson) {
		Assert.notNull(lesson);
		ModelAndView result;
		result = this.createEditModelAndView(lesson, null);
		return result;
	}

	protected ModelAndView createEditModelAndView(final Lesson lesson, final String messageCode) {
		assert lesson != null;

		ModelAndView result;

		result = new ModelAndView("lesson/edit");
		result.addObject("lesson", lesson);
		result.addObject("message", messageCode);
		return result;

	}

}
