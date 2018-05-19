
package controllers.admin;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import services.IncidenceService;
import controllers.AbstractController;
import domain.Incidence;

@Controller
@RequestMapping("/incidence/admin")
public class IncidenceAdminController extends AbstractController {

	// Services---------------------------------------------------------

	@Autowired
	private IncidenceService	incidenceService;


	//Constructor--------------------------------------------------------

	public IncidenceAdminController() {
		super();
	}

	//Listing-------------------------------------------------------------
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(final String messageCode) {

		final ModelAndView result;
		Collection<Incidence> incidences;

		incidences = this.incidenceService.incidencesWithTabooWord();

		result = new ModelAndView("incidence/list");
		result.addObject("incidences", incidences);
		result.addObject("requestURI", "incidence/admin/list.do");
		result.addObject("message", messageCode);

		return result;

	}

	//Delete---------------------------------------------------------------------
	// @RequestMapping(value = "/delete", method = RequestMethod.GET)
	// public ModelAndView delete(final int incidenceId) {
	// ModelAndView result;
	// Incidence incidence;
	//
	// incidence = this.incidenceService.findOne(incidenceId);
	// Assert.notNull(incidence);
	// try {
	// this.incidenceService.deleteAdmin(incidence);
	// result = new ModelAndView("redirect:list.do");
	// } catch (final Throwable oops) {
	// result = this.listWithMessage("incidence.commit.error");
	// }
	//
	// return result;
	// }

	//ancially methods---------------------------------------------------------------------------

	protected ModelAndView listWithMessage(final String message) {
		final ModelAndView result;
		Collection<Incidence> incidences;
		incidences = this.incidenceService.findAll();
		result = new ModelAndView("incidence/list");
		result.addObject("incidences", incidences);
		result.addObject("requestURI", "/incidence/admin/list.do");
		result.addObject("message", message);
		return result;

	}

}
