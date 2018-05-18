
package controllers.buyer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.LessonService;
import controllers.AbstractController;
import domain.Lesson;

@Controller
@RequestMapping("/course/buyer")
public class LessonBuyerController extends AbstractController {

	// Services---------------------------------------------------------
	@Autowired
	private LessonService	lessonService;


	//Constructor--------------------------------------------------------
	public LessonBuyerController() {
		super();
	}

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

}
