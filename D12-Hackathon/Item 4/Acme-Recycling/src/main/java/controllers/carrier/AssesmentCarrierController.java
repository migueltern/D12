
package controllers.carrier;

import java.util.Collection;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.AssesmentService;
import services.CarrierService;
import services.RequestService;
import controllers.AbstractController;
import domain.Assesment;
import domain.Carrier;
import domain.Request;
import forms.AssessmentForm;

@Controller
@RequestMapping("/assessment/carrier")
public class AssesmentCarrierController extends AbstractController {

	//	Services --------------------------------------------------------

	@Autowired
	AssesmentService	assesmentService;

	@Autowired
	CarrierService		carrierService;

	@Autowired
	RequestService		requestService;


	//	Constructors

	public AssesmentCarrierController() {
		super();
	}

	//	Listing ---------------------------------------------------------
	@RequestMapping(value = "/listMyAssessment", method = RequestMethod.GET)
	public ModelAndView list() {
		final ModelAndView result;
		final Collection<Assesment> myAssessments;
		Carrier carrier;

		carrier = this.carrierService.findByPrincipal();
		myAssessments = this.assesmentService.findByCarrierId(carrier.getId());
		result = new ModelAndView("assessment/list");
		result.addObject("assessments", myAssessments);
		result.addObject("requestURI", "/assessment/carrier/listMyAssessment.do?d-16544-p=1");

		return result;
	}

	// Create Assesment-----------------------------------------------------------------

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create(@RequestParam final int requestId) {
		final ModelAndView result;
		final Request request;
		AssessmentForm assessmentForm;

		//No se puede crear assessment en un request que no te pertenece
		request = this.requestService.findOne(requestId);
		final Collection<Request> requests = this.requestService.findByCarrierId(this.carrierService.findByPrincipal().getId());
		Assert.isTrue(requests.contains(request));

		assessmentForm = this.assesmentService.create(requestId);

		result = this.createEditModelAndView(assessmentForm);

		return result;
	}

	//Save Assessment ---------------------------------------------------------------------
	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView saveChangeStatus(@Valid final AssessmentForm assessmentForm, final BindingResult binding) {
		ModelAndView result;

		if (binding.hasErrors())
			result = this.createEditModelAndView(assessmentForm);
		else
			try {
				this.assesmentService.save(assessmentForm);
				result = new ModelAndView("redirect:listMyAssessment.do");
			} catch (final Throwable oops) {
				result = this.createEditModelAndView(assessmentForm, "assessment.commit.error");
			}
		return result;
	}

	protected ModelAndView createEditModelAndView(final AssessmentForm assessmentForm) {
		Assert.notNull(assessmentForm);
		ModelAndView result;
		result = this.createEditModelAndView(assessmentForm, null);

		return result;
	}

	protected ModelAndView createEditModelAndView(final AssessmentForm assessmentForm, final String messageCode) {
		assert assessmentForm != null;

		ModelAndView result;

		result = new ModelAndView("assessment/edit");
		result.addObject("assessmentForm", assessmentForm);
		result.addObject("message", messageCode);

		return result;

	}

}
