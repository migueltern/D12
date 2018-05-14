
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
import services.OpinableService;
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

	@Autowired
	private OpinableService	opinableService;


	//Constructor--------------------------------------------------------

	public OpinionRecyclerController() {
		super();
	}

	//Listar mis opiniones de productos
	@RequestMapping(value = "/myListOpinionProduct", method = RequestMethod.GET)
	public ModelAndView myListOpinionProduct() {
		ModelAndView result;
		Collection<Opinion> myOpinions;
		Recycler recyclerPrincipal;

		recyclerPrincipal = this.recyclerService.findByPrincipal();
		myOpinions = this.opinionService.findOpinableProductByActor(recyclerPrincipal.getId());

		result = new ModelAndView("opinion/list");
		result.addObject("opinions", myOpinions);
		result.addObject("requestURI", "opinion/recycler/myListOpinionProduct.do?d-16544-p=1");
		return result;
	}

	//Listar mis opiniones de cursos
	@RequestMapping(value = "/myListOpinionCourse", method = RequestMethod.GET)
	public ModelAndView myListOpinionCourse() {
		ModelAndView result;
		Collection<Opinion> myOpinions;
		Recycler recyclerPrincipal;

		recyclerPrincipal = this.recyclerService.findByPrincipal();
		myOpinions = this.opinionService.findOpinableCourseByActor(recyclerPrincipal.getId());

		result = new ModelAndView("opinion/list");
		result.addObject("opinions", myOpinions);
		result.addObject("requestURI", "opinion/recycler/myListOpinionCourse.do?d-16544-p=1");
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

		result = this.createEditModelAndView(opinion, true);
		result.addObject("products", products);
		result.addObject("selectProducts", true);
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

		result = this.createEditModelAndView(opinion, false);
		result.addObject("courses", courses);
		result.addObject("selectCourses", true);
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

		result = null;
		if (this.opinableService.isProduct(opinion))
			result = this.createEditModelAndView(opinion, true);
		else if (this.opinableService.isCourse(opinion))
			result = this.createEditModelAndView(opinion, false);
		else
			Assert.isTrue(false, "the opinable don't exist");
		return result;
	}

	// Save Opinion Product-----------------------------------------------------------------
	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "saveOpinionProduct")
	public ModelAndView saveOpinionProduct(@Valid final Opinion opinion, final BindingResult binding) {
		ModelAndView result;

		if (binding.hasErrors())
			result = this.createEditModelAndView(opinion, true);
		else
			try {

				this.opinionService.save(opinion);
				result = new ModelAndView("redirect:myList.do");
			} catch (final Throwable oops) {
				result = this.createEditModelAndView(opinion, "opinion.commit.error", true);
			}
		return result;
	}

	// Save Opinion Course-----------------------------------------------------------------
	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "saveOpinionCourse")
	public ModelAndView saveOpinionCourse(@Valid final Opinion opinion, final BindingResult binding) {
		ModelAndView result;

		if (binding.hasErrors())
			result = this.createEditModelAndView(opinion, false);
		else
			try {

				this.opinionService.save(opinion);
				result = new ModelAndView("redirect:myList.do");
			} catch (final Throwable oops) {
				result = this.createEditModelAndView(opinion, "opinion.commit.error", false);
			}
		return result;
	}

	protected ModelAndView createEditModelAndView(final Opinion opinion, final boolean isProduct) {
		Assert.notNull(opinion);
		ModelAndView result;
		result = this.createEditModelAndView(opinion, null, isProduct);
		return result;
	}

	protected ModelAndView createEditModelAndView(final Opinion opinion, final String messageCode, final boolean isProduct) {
		assert opinion != null;

		ModelAndView result;

		result = new ModelAndView("opinion/edit");
		if (isProduct) {
			Collection<Product> products;

			products = this.productService.findAll();
			result.addObject("products", products);
			result.addObject("selectProducts", true);
		} else {
			Collection<Course> courses;

			courses = this.courseService.findAll();
			result.addObject("courses", courses);
			result.addObject("selectCourses", true);
		}

		result.addObject("opinion", opinion);
		result.addObject("message", messageCode);
		return result;

	}
}
