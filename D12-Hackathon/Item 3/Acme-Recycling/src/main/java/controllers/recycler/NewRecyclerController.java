
package controllers.recycler;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import services.NewService;
import controllers.AbstractController;
import domain.New;

@Controller
@RequestMapping(value = "/new/recycler")
public class NewRecyclerController extends AbstractController {

	//Services--------------------------------------------

	@Autowired
	private NewService	newService;


	//Constructor--------------------------------------------------------

	public NewRecyclerController() {
		super();
	}

	//Listing----------------------------------------------------------
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(final String messageCode) {

		ModelAndView result;
		Collection<New> news;

		news = this.newService.findAll();

		result = new ModelAndView("new/list");
		result.addObject("new", news);
		result.addObject("requestURI", "new/recycler/list.do");
		result.addObject("message", messageCode);

		return result;

	}

}
