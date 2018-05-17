
package controllers.carrier;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import services.AssesmentService;
import controllers.AbstractController;

@Controller
@RequestMapping("/assessment/carrier")
public class AssesmentCarrierController extends AbstractController {

	//	Services --------------------------------------------------------

	@Autowired
	AssesmentService	assesmentService;


	//	Constructors

	public AssesmentCarrierController() {
		super();
	}

	//	Listing ---------------------------------------------------------

}
