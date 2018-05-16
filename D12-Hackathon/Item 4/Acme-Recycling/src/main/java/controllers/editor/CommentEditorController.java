
package controllers.editor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.CommentService;
import services.RecyclerService;
import controllers.AbstractController;
import domain.Comment;
import domain.Recycler;

@Controller
@RequestMapping(value = "/comment/editor")
public class CommentEditorController extends AbstractController {

	//Services--------------------------------------------

	@Autowired
	private CommentService	commentService;

	@Autowired
	private RecyclerService	recyclerService;


	//Constructor--------------------------------------------------------

	public CommentEditorController() {
		super();
	}

	//Display------------------------------------------------------------
	@RequestMapping(value = "/display", method = RequestMethod.GET)
	public ModelAndView display(@RequestParam final int commentId) {
		final ModelAndView result;
		Comment comment = new Comment();
		Recycler recycler;

		comment = this.commentService.findOne(commentId);
		recycler = new Recycler();

		recycler = this.recyclerService.findRecyclerByComment(commentId);

		result = new ModelAndView("comment/display");
		result.addObject("comment", comment);
		result.addObject("recycler", recycler);
		result.addObject("requestURI", "comment/editor/display.do");

		return result;
	}

}
