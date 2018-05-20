
package controllers.admin;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.NewService;
import controllers.AbstractController;
import domain.Comment;
import domain.New;

@Controller
@RequestMapping("/new_/admin")
public class NewAdminController extends AbstractController {

	// Services---------------------------------------------------------

	@Autowired
	private NewService	newService;


	//Constructor--------------------------------------------------------

	public NewAdminController() {
		super();
	}

	@RequestMapping(value = "/display", method = RequestMethod.GET)
	public ModelAndView displayNew(@RequestParam final int newId) {
		final ModelAndView result;
		New new_ = new New();
		Collection<Comment> comments;

		new_ = this.newService.findOne(newId);
		comments = new ArrayList<>();

		comments = this.newService.findCommentsByNew(newId);

		result = new ModelAndView("new/display");
		result.addObject("new_", new_);
		result.addObject("comments", comments);
		result.addObject("requestURI", "new_/admin/display.do");

		return result;
	}

	//Listing-------------------------------------------------------------
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(final String messageCode) {

		ModelAndView result;
		Collection<New> news;

		news = this.newService.newWithTabooWord();

		result = new ModelAndView("new/list");
		result.addObject("new_", news);
		result.addObject("requestURI", "new_/admin/list.do");
		result.addObject("message", messageCode);

		return result;

	}

	//Delete---------------------------------------------------------------------
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public ModelAndView delete(final int newId) {
		ModelAndView result;
		New new_;

		new_ = this.newService.findOne(newId);
		Assert.notNull(new_);
		try {
			this.newService.deleteAdmin(new_);
			result = new ModelAndView("redirect:list.do");
		} catch (final Throwable oops) {
			result = this.listWithMessage("new.commit.error");
		}

		return result;
	}

	//ancially methods---------------------------------------------------------------------------

	protected ModelAndView listWithMessage(final String message) {
		final ModelAndView result;
		Collection<New> news;
		news = this.newService.findAll();
		result = new ModelAndView("new/list");
		result.addObject("news", news);
		result.addObject("requestURI", "/new_/admin/list.do");
		result.addObject("message", message);
		return result;

	}
}
