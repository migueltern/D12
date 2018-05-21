
package controllers.buyer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.BuyService;
import controllers.AbstractController;
import domain.Buy;

@Controller
@RequestMapping("/buy/buyer")
public class BuyBuyerController extends AbstractController {

	// Services ---------------------------------------------------------------

	@Autowired
	private BuyService	buyService;


	// Create -----------------------------------------------------------------

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create(@RequestParam final int materialId) {
		ModelAndView result;
		Buy buy;

		buy = this.buyService.create(materialId);

		result = this.createEditModelAndView(buy);
		return result;
	}

	// Save -----------------------------------------------------------------
	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView save(Buy buy, final BindingResult bindingResult) {
		ModelAndView result;

		buy = this.buyService.reconstruct(buy, bindingResult);
		if (bindingResult.hasErrors())
			result = this.createEditModelAndView(buy);
		else
			try {
				this.buyService.save(buy);
				result = new ModelAndView("redirect:/material/buyer/listYourMaterials.do?d-16544-p=1");
			} catch (final Throwable oops) {

				result = this.createEditModelAndView(buy, "buy.commit.error");

			}
		return result;
	}

	//Auxiliares ---------------------------------------------------------

	protected ModelAndView createEditModelAndView(final Buy buy) {

		Assert.notNull(buy);
		ModelAndView result;
		result = this.createEditModelAndView(buy, null);
		return result;
	}

	protected ModelAndView createEditModelAndView(final Buy buy, final String messageCode) {
		assert buy != null;

		ModelAndView result;

		result = new ModelAndView("buy/edit");
		result.addObject("buy", buy);
		result.addObject("message", messageCode);
		return result;

	}

}
