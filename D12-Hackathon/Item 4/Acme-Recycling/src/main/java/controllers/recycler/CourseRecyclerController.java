
package controllers.recycler;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.CourseService;
import services.RecyclerService;
import controllers.AbstractController;
import domain.Course;
import domain.Recycler;

@Controller
@RequestMapping("/course/recycler")
public class CourseRecyclerController extends AbstractController {

	//	Services --------------------------------------------------------

	@Autowired
	private CourseService	courseService;

	@Autowired
	private RecyclerService	recyclerService;


	//display ------------------------------------------------------------
	@RequestMapping(value = "/display", method = RequestMethod.GET)
	public ModelAndView display(@RequestParam final int courseId) {
		ModelAndView result;
		Course course;

		course = this.courseService.findOne(courseId);
		Assert.isTrue(course.isDraftMode() == false);
		result = new ModelAndView("course/display");
		result.addObject("course", course);
		result.addObject("requestURI", "course/display.do?courseId=" + courseId);

		return result;
	}

	//	Listing ---------------------------------------------------------
	@RequestMapping(value = "/listCoursesAvailables", method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView result;
		final Collection<Course> coursesAvailables;
		Recycler recyclerConnected;

		recyclerConnected = this.recyclerService.findByPrincipal();

		coursesAvailables = this.courseService.coursesAvailables(recyclerConnected);
		result = new ModelAndView("course/list");
		result.addObject("courses", coursesAvailables);
		result.addObject("requestURI", "course/recycler/listCoursesAvailables.do");
		result.addObject("available", true);
		result.addObject("notAvailable", false);

		return result;
	}

	@RequestMapping(value = "/listOfCoursesThatIAttend", method = RequestMethod.GET)
	public ModelAndView listOfCoursesThatIAttend() {
		ModelAndView result;
		final Collection<Course> coursesThatIAttend;
		Recycler recyclerConnected;

		recyclerConnected = this.recyclerService.findByPrincipal();

		coursesThatIAttend = recyclerConnected.getCourses();
		result = new ModelAndView("course/list");
		result.addObject("courses", coursesThatIAttend);
		result.addObject("requestURI", "course/recycler/listOfCoursesThatIAttend.do");
		result.addObject("available", false);
		result.addObject("notAvailable", true);

		return result;
	}
	@RequestMapping(value = "/assist", method = RequestMethod.GET)
	public ModelAndView publish(@RequestParam final int courseId) {
		ModelAndView result;
		Course course;
		Recycler recyclerConnected;

		recyclerConnected = this.recyclerService.findByPrincipal();

		this.recyclerService.checkPrincipal();

		course = this.courseService.findOne(courseId);
		Assert.isTrue(this.courseService.coursesAvailables(recyclerConnected).contains(course));
		try {
			this.courseService.assist(course);
			result = new ModelAndView("redirect:/course/recycler/listCoursesAvailables.do");
		} catch (final Throwable oops) {
			result = this.createAssistModelAndView(course, "course.commit.error");
		}
		return result;
	}

	@RequestMapping(value = "/notAssist", method = RequestMethod.GET)
	public ModelAndView notAssist(@RequestParam final int courseId) {
		ModelAndView result;
		Course course;

		this.recyclerService.checkPrincipal();

		course = this.courseService.findOne(courseId);
		try {
			this.courseService.notAssist(course);
			result = new ModelAndView("redirect:/course/recycler/listOfCoursesThatIAttend.do");
		} catch (final Throwable oops) {
			result = this.createNotAssistModelAndView(course, "course.commit.error");
		}
		return result;
	}

	//Auxiliares ---------------------------------------------------------

	protected ModelAndView createEditModelAndView(final Course course) {

		Assert.notNull(course);
		ModelAndView result;
		result = this.createAssistModelAndView(course, null);
		return result;
	}

	protected ModelAndView createAssistModelAndView(final Course course, final String messageCode) {
		assert course != null;

		ModelAndView result;
		Collection<Course> coursesAvailables;
		Recycler recyclerConnected;
		recyclerConnected = this.recyclerService.findByPrincipal();
		coursesAvailables = this.courseService.coursesAvailables(recyclerConnected);

		result = new ModelAndView("course/list");
		result.addObject("course", course);
		result.addObject("courses", coursesAvailables);
		result.addObject("message", messageCode);
		result.addObject("requestURI", "course/recycler/listCoursesAvailables.do");

		return result;

	}

	protected ModelAndView createNotAssistModelAndView(final Course course) {

		Assert.notNull(course);
		ModelAndView result;
		result = this.createNotAssistModelAndView(course, null);
		return result;
	}

	protected ModelAndView createNotAssistModelAndView(final Course course, final String messageCode) {
		assert course != null;

		ModelAndView result;
		Collection<Course> coursesAssist;
		Recycler recyclerConnected;
		recyclerConnected = this.recyclerService.findByPrincipal();
		coursesAssist = recyclerConnected.getCourses();

		result = new ModelAndView("course/list");
		result.addObject("course", course);
		result.addObject("courses", coursesAssist);
		result.addObject("message", messageCode);
		result.addObject("requestURI", "course/recycler/listOfCoursesThatIAttend.do");

		return result;

	}

}
