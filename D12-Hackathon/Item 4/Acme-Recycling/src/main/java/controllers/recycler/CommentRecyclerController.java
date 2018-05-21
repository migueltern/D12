
package controllers.recycler;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.CommentService;
import services.NewService;
import services.RecyclerService;
import controllers.AbstractController;
import domain.Comment;
import domain.New;

@Controller
@RequestMapping("/comment/recycler")
public class CommentRecyclerController extends AbstractController {

	//	Services --------------------------------------------------------

	@Autowired
	private CommentService	commentService;

	@Autowired
	private RecyclerService	recyclerService;

	@Autowired
	private NewService		newService;


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

	//Creation-----------------------------------------------------------

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create(@RequestParam final int newId) {
		ModelAndView result;
		final Comment Comment;

		Comment = this.commentService.create();

		result = this.createEditModelAndView(Comment);
		result.addObject("requestURI", "comment/recycler/addNew.do?newId=" + newId);
		return result;

	}

	@RequestMapping(value = "/createReply", method = RequestMethod.GET)
	public ModelAndView createReply(@RequestParam final int commentId) {
		ModelAndView result;

		Comment comment;
		Comment reply;

		comment = this.commentService.findOne(commentId);

		reply = this.commentService.create(comment);

		result = this.createEditModelAndView(reply);

		return result;
	}

	// Edit---------------------------------------------------------------

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public ModelAndView edit(@RequestParam final int commentId) {
		ModelAndView result;
		Comment comment;

		comment = this.commentService.findOne(commentId);
		Assert.notNull(comment);

		result = this.createEditModelAndView(comment);

		return result;

	}

	@RequestMapping(value = "/addNew", method = RequestMethod.POST, params = "save")
	public ModelAndView addNewspaper(Comment comment, final BindingResult bindingResult, @RequestParam final int newId) {
		ModelAndView result;
		comment = this.commentService.reconstruct(comment, bindingResult);
		New New;

		if (bindingResult.hasErrors())
			result = this.createEditModelAndView(comment);
		else
			try {
				comment = this.commentService.save(comment);
				New = this.newService.findOne(newId);
				New.getComments().add(comment);

				this.newService.saveA(New);

				result = new ModelAndView("redirect:/comment/recycler/list.do?d-16544-p=1");
			} catch (final Throwable oops) {
				result = this.createEditModelAndView(comment, "comment.commit.error");
			}
		return result;

	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView save(Comment comment, final BindingResult bindingResult) {
		ModelAndView result;
		comment = this.commentService.reconstruct(comment, bindingResult);
		if (bindingResult.hasErrors())
			result = this.createEditModelAndView(comment);
		else
			try {
				this.commentService.save(comment);

				result = new ModelAndView("redirect:list.do");

			} catch (final Throwable oops) {
				result = this.createEditModelAndView(comment, "comment.commit.error");
			}

		return result;
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "delete")
	public ModelAndView delete(@ModelAttribute final Comment comment, final BindingResult bindingResult) {
		ModelAndView result;

		try {
			this.commentService.delete(comment);
			result = new ModelAndView("redirect:list.do");
		} catch (final Throwable oops) {
			result = this.createEditModelAndView(comment, "comment.commit.error");
		}

		return result;
	}

	// Ancillary methods ------------------------------------------------------

	protected ModelAndView createEditModelAndView(final Comment comment) {
		assert comment != null;
		ModelAndView result;
		result = this.createEditModelAndView(comment, null);
		return result;
	}

	protected ModelAndView createEditModelAndView(final Comment comment, final String message) {

		assert comment != null;
		ModelAndView result;

		result = new ModelAndView("comment/edit");
		result.addObject("comment", comment);
		result.addObject("message", message);
		result.addObject("requestURI", "comment/recycler/edit.do");

		return result;

	}

}
