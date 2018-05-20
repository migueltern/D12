package controllers;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.ItemService;
import domain.Item;

@Controller
@RequestMapping("/item")
public class ItemController extends AbstractController{
	
	// Services---------------------------------------------------------
		@Autowired
		private ItemService	 itemService;


		//Constructor--------------------------------------------------------
		public ItemController() {
			super();
		}
		
		//Listing-----------------------------------------------------------
		
		@RequestMapping(value = "/list", method = RequestMethod.GET)
		public ModelAndView list(@RequestParam int actorId) {
			ModelAndView result;
			Collection<Item> items;
			
			items = this.itemService.findItemsByRecycler(actorId);

			result = new ModelAndView("item/list");
			result.addObject("items", items);
			result.addObject("showScore", true);
			result.addObject("requestURI", "item/list.do?d-16544-p=1");


			return result;
		}

}
