
package controllers;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import services.NewService;
import domain.New;

@Controller
@RequestMapping("/new_")
public class NewController extends AbstractController {

	// Services---------------------------------------------------------
	@Autowired
	private NewService	newService;


	//Constructor--------------------------------------------------------
	public NewController() {
		super();
	}

	//Listing-----------------------------------------------------------

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(final String messageCode) {

		ModelAndView result;
		Collection<New> news;

		news = this.newService.findAllNewsInDescOrder();

		result = new ModelAndView("new/list");
		result.addObject("new_", news);
		result.addObject("requestURI", "new_/list.do");
		result.addObject("message", messageCode);

		return result;

	}
}
