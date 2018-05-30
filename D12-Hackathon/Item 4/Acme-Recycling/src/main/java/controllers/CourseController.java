
package controllers;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.CourseService;
import domain.Course;

@Controller
@RequestMapping("/course")
public class CourseController extends AbstractController {

	// Services---------------------------------------------------------

	@Autowired
	private CourseService	courseService;


	//Constructor--------------------------------------------------------
	public CourseController() {
		super();
	}

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

	//list ------------------------------------------------------------
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView result;
		Collection<Course> courses;

		courses = this.courseService.findCoursesNoAuthenticate();

		result = new ModelAndView("course/list");
		result.addObject("courses", courses);
		result.addObject("requestURI", "course/list.do?d-16544-p=1");

		return result;
	}
}
