
package controllers.carrier;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.CarrierService;
import services.RequestService;
import controllers.AbstractController;
import domain.Carrier;
import domain.Request;

@Controller
@RequestMapping("/request/carrier")
public class RequestCarrierController extends AbstractController {

	//	Services --------------------------------------------------------

	@Autowired
	RequestService	requestService;

	@Autowired
	CarrierService	carrierService;


	//	Constructors

	public RequestCarrierController() {
		super();
	}

	//	Listing ---------------------------------------------------------

	@RequestMapping(value = "/listMyRequest", method = RequestMethod.GET)
	public ModelAndView list() {
		final ModelAndView result;
		final Collection<Request> requests;
		final Carrier carrier;

		carrier = this.carrierService.findByPrincipal();
		requests = carrier.getRequests();
		result = new ModelAndView("request/list");
		result.addObject("requests", requests);
		result.addObject("showButtonAddAssessment", true);
		result.addObject("showButtonChangeStatus", true);
		result.addObject("requestURI", "/request/carrier/listMyRequest.do?d-16544-p=1");

		return result;
	}

	//Change Status
	@RequestMapping(value = "/changeStatus", method = RequestMethod.GET)
	public ModelAndView changeStatus(@RequestParam final int requestId) {
		ModelAndView result;
		Request request;

		//Solo se puede cambiar el status de TUS requests
		request = this.requestService.findOne(requestId);
		Assert.isTrue(this.carrierService.findByPrincipal().getRequests().contains(request), "Can not commit this operation because its illegal");

		result = new ModelAndView("request/changeStatus");
		result.addObject("request", request);
		result.addObject("requestURI", "request/carrier/edit.do");

		return result;
	}

	//Save Request ---------------------------------------------------------------------
	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "saveChangeStatus")
	public ModelAndView saveChangeStatus(Request request, final BindingResult binding) {
		ModelAndView result;

		request = this.requestService.reconstruct(request, binding);
		if (binding.hasErrors())
			result = new ModelAndView("redirect:changeStatus.do?requestId=" + request.getItem());
		else
			try {
				this.requestService.save(request);
				result = new ModelAndView("redirect:listMyRequest.do");
			} catch (final Throwable oops) {
				result = new ModelAndView("redirect:changeStatus.do?requestId=" + request.getItem());
			}
		return result;
	}

}