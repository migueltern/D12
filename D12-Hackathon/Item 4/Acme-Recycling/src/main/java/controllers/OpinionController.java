
package controllers;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.ItemService;
import domain.Opinion;

@Controller
@RequestMapping("/opinion")
public class OpinionController extends AbstractController {

	// Services---------------------------------------------------------
	@Autowired
	private ItemService	itemService;


	//Constructor--------------------------------------------------------
	public OpinionController() {
		super();
	}

	//Listing-----------------------------------------------------------
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(@RequestParam final int itemId) {
		ModelAndView result;
		Collection<Opinion> opinions;

		opinions = this.itemService.findOne(itemId).getOpinions();

		result = new ModelAndView("opinion/list");
		result.addObject("opinions", opinions);
		result.addObject("itemId", itemId);
		result.addObject("requestURI", "opinion/list.do?d-16544-p=1");

		return result;
	}
}
