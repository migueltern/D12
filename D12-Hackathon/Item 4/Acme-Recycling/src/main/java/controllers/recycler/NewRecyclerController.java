
package controllers.recycler;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.NewService;
import controllers.AbstractController;
import domain.Comment;
import domain.New;

@Controller
@RequestMapping(value = "/new_/recycler")
public class NewRecyclerController extends AbstractController {

	//Services--------------------------------------------

	@Autowired
	private NewService	newService;


	//Constructor--------------------------------------------------------

	public NewRecyclerController() {
		super();
	}

	//Listing----------------------------------------------------------
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(final String messageCode) {

		ModelAndView result;
		Collection<New> news;

		news = this.newService.findAll();

		result = new ModelAndView("new/list");
		result.addObject("new_", news);
		result.addObject("requestURI", "new_/recycler/list.do");
		result.addObject("message", messageCode);

		return result;

	}

	//Display------------------------------------------------------------
	@RequestMapping(value = "/display", method = RequestMethod.GET)
	public ModelAndView display(@RequestParam final int newId) {
		final ModelAndView result;
		New new_ = new New();
		Collection<Comment> comments;

		new_ = this.newService.findOne(newId);
		comments = new ArrayList<>();

		comments = this.newService.findCommentsByNew(newId);

		result = new ModelAndView("new/display");
		result.addObject("new_", new_);
		result.addObject("comments", comments);
		result.addObject("requestURI", "new_/recycler/display.do");

		return result;
	}

}
