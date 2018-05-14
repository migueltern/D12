
package controllers.recycler;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import controllers.AbstractController;

@Controller
@RequestMapping("/opinion/recycler")
public class OpinionRecyclerController extends AbstractController {

	//	//Services--------------------------------------------
	//
	//	@Autowired
	//	private OpinionService	opinionService;
	//
	//	@Autowired
	//	private RecyclerService	recyclerService;
	//
	//	@Autowired
	//	private ItemService		itemService;
	//
	//	@Autowired
	//	private CourseService	courseService;
	//
	//	@Autowired
	//	private OpinableService	opinableService;
	//
	//
	//	//Constructor--------------------------------------------------------
	//
	//	public OpinionRecyclerController() {
	//		super();
	//	}
	//
	//	//Listar mis opiniones de itemos
	//	@RequestMapping(value = "/myListOpinionItem", method = RequestMethod.GET)
	//	public ModelAndView myListOpinionItem() {
	//		ModelAndView result;
	//		Collection<Opinion> myOpinions;
	//		Recycler recyclerPrincipal;
	//
	//		recyclerPrincipal = this.recyclerService.findByPrincipal();
	//		myOpinions = this.opinionService.findOpinableItemByActor(recyclerPrincipal.getId());
	//
	//		result = new ModelAndView("opinion/list");
	//		result.addObject("opinions", myOpinions);
	//		result.addObject("requestURI", "opinion/recycler/myListOpinionItem.do?d-16544-p=1");
	//		return result;
	//	}
	//
	//	//Listar mis opiniones de cursos
	//	@RequestMapping(value = "/myListOpinionCourse", method = RequestMethod.GET)
	//	public ModelAndView myListOpinionCourse() {
	//		ModelAndView result;
	//		Collection<Opinion> myOpinions;
	//		Recycler recyclerPrincipal;
	//
	//		recyclerPrincipal = this.recyclerService.findByPrincipal();
	//		myOpinions = this.opinionService.findOpinableCourseByActor(recyclerPrincipal.getId());
	//
	//		result = new ModelAndView("opinion/list");
	//		result.addObject("opinions", myOpinions);
	//		result.addObject("requestURI", "opinion/recycler/myListOpinionCourse.do?d-16544-p=1");
	//		return result;
	//	}
	//
	//	// Create opinable item-----------------------------------------------------------------
	//
	//	@RequestMapping(value = "/createOpinableItem", method = RequestMethod.GET)
	//	public ModelAndView createOpinableItem() {
	//		ModelAndView result;
	//		Opinion opinion;
	//		OpinionForm opinionForm;
	//
	//		opinion = this.opinionService.create();
	//
	//		opinionForm = new OpinionForm();
	//		opinionForm.setOpinion(opinion);
	//		opinionForm.setOpinableItem(true);
	//
	//		result = this.createEditModelAndView(opinionForm);
	//
	//		return result;
	//	}
	//	// Create opinable item-----------------------------------------------------------------
	//
	//	@RequestMapping(value = "/createOpinableCourse", method = RequestMethod.GET)
	//	public ModelAndView createOpinableCourse() {
	//		ModelAndView result;
	//		Opinion opinion;
	//		OpinionForm opinionForm;
	//
	//		opinion = this.opinionService.create();
	//
	//		opinionForm = new OpinionForm();
	//		opinionForm.setOpinion(opinion);
	//		opinionForm.setOpinableItem(false);
	//
	//		result = this.createEditModelAndView(opinionForm);
	//
	//		return result;
	//	}
	//	//Edition--------------------------------------------------------------------------------
	//
	//	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	//	public ModelAndView edit(@RequestParam final int opinionId) {
	//		ModelAndView result;
	//		Opinion opinion;
	//		Recycler recycler;
	//		final OpinionForm opinionForm;
	//
	//		recycler = this.recyclerService.findByPrincipal();
	//		opinion = this.opinionService.findOne(opinionId);
	//		Assert.isTrue(recycler.getOpinions().contains(opinion), "Cannot commit this operation, because it's illegal");
	//		Assert.notNull(opinion);
	//
	//		//Pasar el opinion a opinionform para la vista
	//		opinionForm = new OpinionForm();
	//		opinionForm.setOpinion(opinion);
	//		if (this.opinableService.isItem(opinion))
	//			opinionForm.setOpinableItem(true);
	//		else
	//			opinionForm.setOpinableItem(false);
	//
	//		result = this.createEditModelAndView(opinionForm);
	//
	//		return result;
	//	}
	//
	//	// Save Opinion Item-----------------------------------------------------------------
	//	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "save")
	//	public ModelAndView save(OpinionForm opinionForm, final BindingResult binding) {
	//		ModelAndView result;
	//
	//		opinionForm = this.opinionService.reconstruct(opinionForm, binding);
	//		if (binding.hasErrors())
	//			result = this.createEditModelAndView(opinionForm);
	//		else
	//			try {
	//				this.opinionService.save(opinionForm.getOpinion());
	//				if (this.opinableService.isItem(opinionForm.getOpinion()))
	//					result = new ModelAndView("redirect:myListOpinionItem.do");
	//				else
	//					result = new ModelAndView("redirect:myListOpinionCourse.do");
	//
	//			} catch (final Throwable oops) {
	//				result = this.createEditModelAndView(opinionForm, "opinion.commit.error");
	//			}
	//		return result;
	//	}
	//
	//	protected ModelAndView createEditModelAndView(final OpinionForm opinionForm) {
	//		Assert.notNull(opinionForm);
	//		ModelAndView result;
	//		result = this.createEditModelAndView(opinionForm, null);
	//		return result;
	//	}
	//
	//	protected ModelAndView createEditModelAndView(final OpinionForm opinionForm, final String messageCode) {
	//		assert opinionForm != null;
	//
	//		ModelAndView result;
	//
	//		result = new ModelAndView("opinion/edit");
	//		if (opinionForm.isOpinableItem()) {
	//			Collection<Item> items;
	//
	//			items = this.itemService.findAll();
	//			result.addObject("items", items);
	//			result.addObject("selectItems", true);
	//		} else {
	//			Collection<Course> courses;
	//
	//			courses = this.courseService.findAll();
	//			result.addObject("courses", courses);
	//			result.addObject("selectCourses", true);
	//		}
	//
	//		result.addObject("opinionForm", opinionForm);
	//		result.addObject("message", messageCode);
	//		return result;
	//
	//	}
}
