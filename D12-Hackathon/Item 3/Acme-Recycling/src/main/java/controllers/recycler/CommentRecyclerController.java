
package controllers.recycler;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import services.RecyclerService;
import controllers.AbstractController;
import domain.Comment;

@Controller
@RequestMapping("/comment/recycler")
public class CommentRecyclerController extends AbstractController {

	//	Services --------------------------------------------------------

	//	@Autowired
	//	private CommentService	commentService;

	@Autowired
	private RecyclerService	recyclerService;


	//	Listing ---------------------------------------------------------
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView result;
		final Collection<Comment> comments;

		comments = this.recyclerService.findAllCommentsByRecycler();
		result = new ModelAndView("comment/list");
		result.addObject("comments", comments);
		result.addObject("requestURI", "comment/recycler/list.do");

		return result;
	}

}
