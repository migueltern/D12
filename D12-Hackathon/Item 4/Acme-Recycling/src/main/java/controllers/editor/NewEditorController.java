
package controllers.editor;

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
		result.addObject("new_", news);
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
		New new_;
		Editor principal;

		principal = this.editorService.findByPrincipal();

		new_ = this.newService.findOne(newId);

		Assert.notNull(new_);
		Assert.isTrue(principal.getNews().contains(new_), "This new is  not yours");
		result = this.createEditModelAndView(new_);

		return result;

	}
	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView save(New new_, final BindingResult bindingResult) {
		ModelAndView result;
		new_ = this.newService.reconstruct(new_, bindingResult);
		if (bindingResult.hasErrors())
			result = this.createEditModelAndView(new_);
		else
			try {
				this.newService.save(new_);
				result = new ModelAndView("redirect:list.do");

			} catch (final Throwable oops) {
				result = this.createEditModelAndView(new_, "new.commit.error");
			}

		return result;
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "delete")
	public ModelAndView delete(@ModelAttribute final New new_, final BindingResult bindingResult) {
		ModelAndView result;

		try {
			this.newService.delete(new_);
			result = new ModelAndView("redirect:list.do");
		} catch (final Throwable oops) {
			result = this.createEditModelAndView(new_, "new.commit.error");
		}

		return result;
	}
	// Ancillary methods ------------------------------------------------------

	protected ModelAndView createEditModelAndView(final New new_) {
		assert new_ != null;
		ModelAndView result;
		result = this.createEditModelAndView(new_, null);
		return result;
	}

	protected ModelAndView createEditModelAndView(final New new_, final String message) {

		assert new_ != null;
		ModelAndView result;

		result = new ModelAndView("new/edit");
		result.addObject("new_", new_);
		result.addObject("message", message);
		result.addObject("requestURI", "new/editor/edit.do");

		return result;

	}
}
