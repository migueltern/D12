package controllers.recycler;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import services.ActorService;
import services.ItemService;
import controllers.AbstractController;
import domain.Actor;
import domain.Item;
import domain.Recycler;

@Controller
@RequestMapping("/item/recycler")
public class ItemRecyclerController extends AbstractController{
	
	//	Services --------------------------------------------------------

	@Autowired
	private ItemService itemService;
	
	@Autowired
	private ActorService actorService;
	
	
	//	Constructors

	public ItemRecyclerController() {
		super();
	}
	
	//	Listing ---------------------------------------------------------
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView result;
		Collection<Item> items;
		Actor principal;
		
		principal = this.actorService.findPrincipal();
		items = this.itemService.findItemsByRecycler(principal.getId());
		
		Assert.isTrue(principal instanceof Recycler);

		result = new ModelAndView("item/list");
		result.addObject("items", items);
		result.addObject("requestURI", "item/recycler/list.do?d-16544-p=1");


		return result;
	}

}
