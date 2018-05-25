
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
import services.ItemService;
import services.OpinableService;
import domain.Course;
import domain.Item;
import domain.Opinable;
import domain.Opinion;

@Controller
@RequestMapping("/opinion")
public class OpinionController extends AbstractController {

	// Services---------------------------------------------------------
	@Autowired
	private ItemService		itemService;

	@Autowired
	private OpinableService	opinableService;

	@Autowired
	private CourseService	courseService;


	//Constructor--------------------------------------------------------
	public OpinionController() {
		super();
	}

	//Listing-----------------------------------------------------------
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(@RequestParam final int opinableId) {
		ModelAndView result;
		Collection<Opinion> opinions;
		Opinable opinable;

		result = new ModelAndView("opinion/list");

		opinable = this.opinableService.findOneManual(opinableId);
		opinions = opinable.getOpinions();

		result.addObject("opinions", opinions);

		result.addObject("requestURI", "opinion/list.do?d-16544-p=1");

		return result;
	}

	//Display opinable
	@RequestMapping(value = "/displayOpinable", method = RequestMethod.GET)
	public ModelAndView displayOpinable(@RequestParam final int opinionId) {
		Opinable opinable;
		Item item;
		Course course;
		ModelAndView result;

		result = null;
		opinable = this.opinableService.findByOpinionId(opinionId);
		item = this.itemService.findOne(opinable.getId());
		course = this.courseService.findOne(opinable.getId());
		if (item != null)
			result = new ModelAndView("redirect:/item/display.do?itemId=" + item.getId());
		else if (course != null)
			result = new ModelAndView("redirect:/course/display.do?courseId=" + course.getId());
		else
			Assert.isTrue(false, "The opinable isn't a item or course");

		return result;
	}

}
