
package controllers.recycler;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import services.OpinionService;
import services.RecyclerService;
import controllers.AbstractController;
import domain.Opinion;
import domain.Recycler;

@Controller
@RequestMapping("/opinion/recycler")
public class OpinionRecyclerController extends AbstractController {

	//Services--------------------------------------------

	@Autowired
	private OpinionService	opinionService;

	@Autowired
	private RecyclerService	recyclerService;


	//Constructor--------------------------------------------------------

	public OpinionRecyclerController() {
		super();
	}

	//Listar mis opiniones 
	@RequestMapping(value = "/myList", method = RequestMethod.GET)
	public ModelAndView myList() {
		ModelAndView result;
		Collection<Opinion> myOpinions;
		Recycler recyclerPrincipal;

		recyclerPrincipal = this.recyclerService.findByPrincipal();
		myOpinions = this.opinionService.findByActor(recyclerPrincipal.getId());

		result = new ModelAndView("opinion/list");
		result.addObject("opinions", myOpinions);
		result.addObject("requestURI", "opinion/recycler/myList.do?d-16544-p=1");
		return result;

	}

}
