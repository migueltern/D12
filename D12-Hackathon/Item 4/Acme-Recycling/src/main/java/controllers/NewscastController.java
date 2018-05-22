
package controllers;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import services.NewscastService;
import domain.Newscast;

@Controller
@RequestMapping("/newscast")
public class NewscastController extends AbstractController {

	// Services---------------------------------------------------------
	@Autowired
	private NewscastService	newscastService;


	//Constructor--------------------------------------------------------
	public NewscastController() {
		super();
	}

	//Listing-----------------------------------------------------------

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(final String messageCode) {

		ModelAndView result;
		Collection<Newscast> news;

		news = this.newscastService.findAllNewsInDescOrder();

		result = new ModelAndView("newscast/list");
		result.addObject("newscast", news);
		result.addObject("requestURI", "newscast/list.do");
		result.addObject("message", messageCode);

		return result;

	}
}
