
package controllers.buyer;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import services.BuyerService;
import services.CourseService;
import controllers.AbstractController;
import domain.Course;

@Controller
@RequestMapping("/course/buyer")
public class CourseBuyerController extends AbstractController {

	// Services---------------------------------------------------------
	@Autowired
	private CourseService	courseService;
	@Autowired
	private BuyerService	buyerService;


	//Constructor--------------------------------------------------------

	public CourseBuyerController() {
		super();
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
