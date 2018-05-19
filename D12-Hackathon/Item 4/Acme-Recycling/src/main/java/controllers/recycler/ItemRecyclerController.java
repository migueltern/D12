package controllers.recycler;

import java.util.Collection;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import services.ActorService;
import services.ItemService;
import services.LabelProductService;
import controllers.AbstractController;
import domain.Actor;
import domain.Item;
import domain.LabelProduct;
import domain.Recycler;

@Controller
@RequestMapping("/item/recycler")
public class ItemRecyclerController extends AbstractController{
	
	//	Services --------------------------------------------------------

	@Autowired
	private ItemService itemService;
	
	@Autowired
	private ActorService actorService;
	
	@Autowired
	private LabelProductService labelProductService;
	
	
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
	
	
	// Create-------------------------------------------------------------
	
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create() {
		ModelAndView result;
		Item item;

		item = this.itemService.create();
		result = this.createEditModelAndView(item);

		return result;

	}

	
//	Save-------------------------------------------------------------------
	
	@RequestMapping(value = "/create", method = RequestMethod.POST, params = "save")
	public ModelAndView save(Item item, BindingResult bindingResult) {
		ModelAndView result;
		Item itemReconstruct;
		
		
		itemReconstruct = this.itemService.reconstruct(item, bindingResult);
		
		if (bindingResult.hasErrors())
			result = this.createEditModelAndView(itemReconstruct);
		else
			try {
				this.itemService.save(itemReconstruct);
				result = new ModelAndView("redirect:/item/recycler/list.do");
			} catch (final Throwable oops) {
				
				result = this.createEditModelAndView(itemReconstruct, "item.commit.error");
			}

		return result;
		
	}
	
	// Ancillary methods ------------------------------------------------------
		protected ModelAndView createEditModelAndView(Item item) {
			ModelAndView result;
			result = this.createEditModelAndView(item, null);
			return result;
		}

		protected ModelAndView createEditModelAndView(Item item, String messageCode) {
			ModelAndView result;
			Collection<LabelProduct> labelsProduct;
			
			labelsProduct = this.labelProductService.findAll();

			result = new ModelAndView("item/edit");
			result.addObject("item", item);
			result.addObject("labelsProduct", labelsProduct);
			result.addObject("requestURI", "item/recycler/create.do");
			result.addObject("RequestURIcancel", "item/recycler/list.do");

			return result;

		}

}
