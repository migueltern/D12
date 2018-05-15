
package controllers.editor;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.EditorService;
import services.NewService;
import controllers.AbstractController;
import domain.Editor;
import domain.New;

@Controller
@RequestMapping(value = "/new/editor")
public class NewEditorController extends AbstractController {

	//Services--------------------------------------------

	@Autowired
	private NewService		newService;

	@Autowired
	private EditorService	editorService;


	//Constructor--------------------------------------------------------

	public NewEditorController() {
		super();
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(final String messageCode) {

		ModelAndView result;
		Collection<New> news;

		news = this.editorService.findAllNewByEditor();

		result = new ModelAndView("new/list");
		result.addObject("new", news);
		result.addObject("requestURI", "new/editor/list.do");
		result.addObject("message", messageCode);

		return result;

	}

	//Creation-----------------------------------------------------------

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create() {
		ModelAndView result;
		final New New;

		New = this.newService.create();

		result = this.createEditModelAndView(New);
		return result;
	}

	// Edit---------------------------------------------------------------

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public ModelAndView edit(@RequestParam final int newId) {
		ModelAndView result;
		New New;
		Editor principal;

		principal = this.editorService.findByPrincipal();

		New = this.newService.findOne(newId);

		Assert.notNull(New);
		Assert.isTrue(principal.getNews().contains(New), "This new is  not yours");
		result = this.createEditModelAndView(New);

		return result;

	}
	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView save(New New, final BindingResult bindingResult) {
		ModelAndView result;
		New = this.newService.reconstruct(New, bindingResult);
		if (bindingResult.hasErrors())
			result = this.createEditModelAndView(New);
		else
			try {
				this.newService.save(New);
				result = new ModelAndView("redirect:list.do");

			} catch (final Throwable oops) {
				result = this.createEditModelAndView(New, "new.commit.error");
			}

		return result;
	}

	// Ancillary methods ------------------------------------------------------

	protected ModelAndView createEditModelAndView(final New New) {
		assert New != null;
		ModelAndView result;
		result = this.createEditModelAndView(New, null);
		return result;
	}

	protected ModelAndView createEditModelAndView(final New New, final String message) {

		assert New != null;
		ModelAndView result;

		result = new ModelAndView("new/edit");
		result.addObject("new", New);
		result.addObject("message", message);
		result.addObject("requestURI", "new/editor/edit.do");

		return result;

	}
}
