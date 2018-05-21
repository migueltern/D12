
package controllers.buyer;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import services.BuyerService;
import services.MaterialService;
import controllers.AbstractController;
import domain.Buyer;
import domain.Material;

@Controller
@RequestMapping(value = "/material/buyer")
public class MaterialBuyerController extends AbstractController {

	//Services--------------------------------------------

	@Autowired
	private MaterialService	materialService;

	@Autowired
	private BuyerService	buyerService;


	//Constructor--------------------------------------------------------

	public MaterialBuyerController() {
		super();
	}

	//	Lista de los materiales que no has comprado aún------------------
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView result;
		final Collection<Material> materials;

		materials = this.materialService.findAll();

		result = new ModelAndView("material/list");
		result.addObject("materials", materials);
		result.addObject("requestURI", "material/buyer/list.do");

		return result;
	}

	//	Lista de los materiales que ya has comprado ------------------
	@RequestMapping(value = "/listYourMaterials", method = RequestMethod.GET)
	public ModelAndView listYourMaterials() {
		ModelAndView result;
		final Collection<Material> materials;
		Buyer buyer;

		buyer = this.buyerService.findByPrincipal();
		materials = this.buyerService.findAllMaterialsBuyByABuyer();

		result = new ModelAndView("material/listYourMaterial");
		result.addObject("materials", materials);
		result.addObject("buyer", buyer);
		result.addObject("requestURI", "material/buyer/listYourMaterials.do");

		return result;
	}

}
