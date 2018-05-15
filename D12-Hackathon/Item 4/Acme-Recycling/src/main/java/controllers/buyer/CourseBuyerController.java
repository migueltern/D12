
package controllers.buyer;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.BuyerService;
import services.CourseService;
import services.LessonService;
import controllers.AbstractController;
import domain.Buyer;
import domain.Course;
import domain.Lesson;

@Controller
@RequestMapping("/course/buyer")
public class CourseBuyerController extends AbstractController {

	// Services---------------------------------------------------------
	@Autowired
	private CourseService	courseService;
	@Autowired
	private BuyerService	buyerService;
	@Autowired
	private LessonService	lessonService;


	//Constructor--------------------------------------------------------

	public CourseBuyerController() {
		super();
	}

	//Display-----------------------------------------------------------------
	@RequestMapping(value = "/display", method = RequestMethod.GET)
	public ModelAndView displayCourse(@RequestParam final int courseId) {
		final ModelAndView result;
		Course course = new Course();
		Collection<Lesson> lessons;

		course = this.courseService.findOne(courseId);
		lessons = new ArrayList<>();

		lessons = this.lessonService.findLessonsByCourseId(courseId);

		result = new ModelAndView("course/display");
		result.addObject("course", course);
		result.addObject("lessons", lessons);
		result.addObject("requestURI", "course/buyer/display.do");

		return result;
	}

	//Listing-----------------------------------------------------------------
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list() {
		this.buyerService.checkPrincipal();
		final ModelAndView result;
		final Collection<Course> courses;
		courses = this.courseService.findCoursesCreatedByBuyer();
		result = new ModelAndView("course/mylist");
		result.addObject("courses", courses);
		result.addObject("requestURI", "course/buyer/list.do");
		return result;
	}

	//Creation-----------------------------------------------------------
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create() {
		ModelAndView result;
		final Course course;

		course = this.courseService.create();

		result = this.createEditModelAndView(course);
		result.addObject("requestURI", "course/buyer/edit.do");
		return result;

	}

	//Edit -----------------------------------------------------------------
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public ModelAndView edit(@RequestParam final int courseId) {
		ModelAndView result;
		final Course course;
		final Buyer buyer;
		Assert.notNull(courseId);

		course = this.courseService.findOne(courseId);
		//user = this.userService.findByPrincipal();
		//volume = this.volumeService.findOne(volumeId);
		//Assert.isTrue(user.getVolumes().contains(volume), "Cannot commit this operation, because it's illegal");
		//Assert.notNull(volume);
		result = this.createEditModelAndView(course);
		return result;
	}

	protected ModelAndView createEditModelAndView(final Course course) {
		assert course != null;
		ModelAndView result;
		result = this.createEditModelAndView(course, null);
		return result;
	}

	protected ModelAndView createEditModelAndView(final Course course, final String message) {

		assert course != null;
		ModelAndView result;

		result = new ModelAndView("course/edit");
		result.addObject("course", course);
		result.addObject("message", message);

		return result;

	}

}
