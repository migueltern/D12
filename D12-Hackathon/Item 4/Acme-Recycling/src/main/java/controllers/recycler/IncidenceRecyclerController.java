package controllers.recycler;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import services.IncidenceService;
import services.RecyclerService;
import controllers.AbstractController;
import domain.Actor;
import domain.Incidence;

@Controller
@RequestMapping("/incidence/recycler")
public class IncidenceRecyclerController extends AbstractController{
	
//	Services --------------------------------------------------------
	
	@Autowired
	private IncidenceService incidenceService;
	
	@Autowired
	private RecyclerService recyclerService;
	
//	Constructors

	public IncidenceRecyclerController() {
		super();
	}
	
//	Listing ---------------------------------------------------------
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView result;
		Collection<Incidence> incidences;
		Actor principal;
		
		principal = this.recyclerService.findByPrincipal();
		incidences = this.incidenceService.findIncidencesByRecycler(principal.getId());

		result = new ModelAndView("incidence/list");
		result.addObject("incidences", incidences);
		result.addObject("requestURI", "incidence/recycler/list.do?d-16544-p=1");


		return result;
	}
	
	

}
