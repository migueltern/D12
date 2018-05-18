
package controllers.carrier;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import services.AssesmentService;
import services.CarrierService;
import controllers.AbstractController;
import domain.Assesment;
import domain.Carrier;

@Controller
@RequestMapping("/assessment/carrier")
public class AssesmentCarrierController extends AbstractController {

	//	Services --------------------------------------------------------

	@Autowired
	AssesmentService	assesmentService;

	@Autowired
	CarrierService		carrierService;


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

}
