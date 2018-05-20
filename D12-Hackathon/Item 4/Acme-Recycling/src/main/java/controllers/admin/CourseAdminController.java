
package controllers.admin;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import services.CourseService;
import controllers.AbstractController;
import domain.Course;

@Controller
@RequestMapping("/editor/admin")
public class CourseAdminController extends AbstractController {

	// Services---------------------------------------------------------
	@Autowired
	private CourseService	courseService;


	//Constructor--------------------------------------------------------

	public CourseAdminController() {
		super();
	}

	//Listing

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list() {

		ModelAndView result;
		Collection<Course> courses;

		courses = this.courseService.findAllWithoutRecyclers();

		result = new ModelAndView("course/list");
		result.addObject("courses", courses);
		//result.addObject("showDelete", true);
		result.addObject("requestURI", "course/admin/list.do?d-16544-p=1");
		return result;

	}

}
