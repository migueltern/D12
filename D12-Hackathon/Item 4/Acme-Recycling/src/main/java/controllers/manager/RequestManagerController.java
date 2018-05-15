
package controllers.manager;

import java.util.Collection;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import services.ManagerService;
import services.RequestService;
import controllers.AbstractController;
import domain.Item;
import domain.Manager;
import domain.Request;

@Controller
@RequestMapping("/request/manager")
public class RequestManagerController extends AbstractController {

	//	Services --------------------------------------------------------

	@Autowired
	private RequestService	requestService;

	@Autowired
	private ManagerService	managerService;


	//	Constructors

	public RequestManagerController() {
		super();
	}

	//	Listing ItemNonRequest---------------------------------------------------------
	@RequestMapping(value = "/listItemNonRequest", method = RequestMethod.GET)
	public ModelAndView listItemNonRequest() {
		ModelAndView result;
		Collection<Item> itemsNonRequest;

		itemsNonRequest = this.requestService.findItemsNonRequest();
		result = new ModelAndView("request/listItem");
		result.addObject("items", itemsNonRequest);
		result.addObject("showButtonRequest", true);
		result.addObject("requestURI", "request/manager/listItemNonRequest.do?d-16544-p=1");
		return result;
	}

	//	List myRequest---------------------------------------------------------
	@RequestMapping(value = "/listMyRequest", method = RequestMethod.GET)
	public ModelAndView listMyRequest() {
		ModelAndView result;
		final Collection<Request> myRequests;
		Manager managerPrincipal;

		managerPrincipal = this.managerService.findByPrincipal();
		myRequests = this.requestService.findByActorId(managerPrincipal.getId());

		result = new ModelAndView("request/list");
		result.addObject("requests", myRequests);
		result.addObject("showButtonChangeStatus", true);
		result.addObject("requestURI", "request/manager/listMyRequest.do?d-16544-p=1");
		return result;
	}

	// Create Request-----------------------------------------------------------------

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create() {
		final ModelAndView result;
		final Request request;

		request = this.requestService.create();
		result = this.createEditModelAndView(request);

		return result;
	}

	//Save Request ---------------------------------------------------------------------
	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView save(@Valid final Request request, final BindingResult binding) {
		ModelAndView result;

		//opinionForm = this.opinionService.reconstruct(opinionForm, binding);
		if (binding.hasErrors())
			result = this.createEditModelAndView(request);
		else
			try {
				this.requestService.save(request);
				result = new ModelAndView("redirect:listMyRequest.do");
			} catch (final Throwable oops) {
				result = this.createEditModelAndView(request, "request.commit.error");
			}
		return result;
	}

	protected ModelAndView createEditModelAndView(final Request request) {
		Assert.notNull(request);
		ModelAndView result;
		result = this.createEditModelAndView(request, null);

		return result;
	}

	protected ModelAndView createEditModelAndView(final Request request, final String messageCode) {
		assert request != null;

		ModelAndView result;

		result = new ModelAndView("request/edit");

		result.addObject("request", request);
		result.addObject("message", messageCode);

		return result;

	}

}
