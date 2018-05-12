
package controllers.recycler;

import java.util.Collection;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.CourseService;
import services.OpinionService;
import services.ProductService;
import services.RecyclerService;
import controllers.AbstractController;
import domain.Course;
import domain.Opinion;
import domain.Product;
import domain.Recycler;

@Controller
@RequestMapping("/opinion/recycler")
public class OpinionRecyclerController extends AbstractController {

	//Services--------------------------------------------

	@Autowired
	private OpinionService	opinionService;

	@Autowired
	private RecyclerService	recyclerService;

	@Autowired
	private ProductService	productService;

	@Autowired
	private CourseService	courseService;


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

	// Create opinable product-----------------------------------------------------------------

	@RequestMapping(value = "/createOpinableProduct", method = RequestMethod.GET)
	public ModelAndView createOpinableProduct() {
		ModelAndView result;
		Opinion opinion;
		Collection<Product> products;

		opinion = this.opinionService.create();
		products = this.productService.findAll();

		result = this.createEditModelAndView(opinion);
		result.addObject("selectProducts", true);
		result.addObject("products", products);
		return result;
	}
	// Create opinable product-----------------------------------------------------------------

	@RequestMapping(value = "/createOpinableCourse", method = RequestMethod.GET)
	public ModelAndView createOpinableCourse() {
		ModelAndView result;
		Opinion opinion;
		Collection<Course> courses;

		opinion = this.opinionService.create();
		courses = this.courseService.findAll();

		result = this.createEditModelAndView(opinion);
		result.addObject("selectCourses", true);
		result.addObject("courses", courses);
		return result;
	}
	//Edition--------------------------------------------------------------------------------

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public ModelAndView edit(@RequestParam final int opinionId) {
		ModelAndView result;
		Opinion opinion;
		Recycler recycler;

		recycler = this.recyclerService.findByPrincipal();
		opinion = this.opinionService.findOne(opinionId);
		Assert.isTrue(recycler.getOpinions().contains(opinion), "Cannot commit this operation, because it's illegal");
		Assert.notNull(opinion);
		result = this.createEditModelAndView(opinion);
		return result;
	}

	// Save -----------------------------------------------------------------
	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView save(@Valid final Opinion opinion, final BindingResult binding) {
		ModelAndView result;

		//opinion = this.opinionService.reconstruct(opinion, binding);

		if (binding.hasErrors())
			result = this.createEditModelAndView(opinion);
		else
			try {

				this.opinionService.save(opinion);
				result = new ModelAndView("redirect:myList.do");
			} catch (final Throwable oops) {
				result = this.createEditModelAndView(opinion, "opinion.commit.error");
			}
		return result;
	}

	protected ModelAndView createEditModelAndView(final Opinion opinion) {
		Assert.notNull(opinion);
		ModelAndView result;
		result = this.createEditModelAndView(opinion, null);
		return result;
	}

	protected ModelAndView createEditModelAndView(final Opinion opinion, final String messageCode) {
		assert opinion != null;

		ModelAndView result;

		result = new ModelAndView("opinion/edit");
		result.addObject("opinion", opinion);
		result.addObject("message", messageCode);
		return result;

	}

}
