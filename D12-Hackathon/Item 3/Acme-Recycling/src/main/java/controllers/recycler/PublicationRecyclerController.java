
package controllers.recycler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.CourseService;
import services.PublicationService;
import controllers.AbstractController;
import domain.Course;
import domain.Publication;

@Controller
@RequestMapping(value = "/publication/recycler")
public class PublicationRecyclerController extends AbstractController {

	//Services--------------------------------------------

	@Autowired
	private PublicationService	publicationService;

	@Autowired
	private CourseService		courseService;


	//Constructor--------------------------------------------------------

	public PublicationRecyclerController() {
		super();
	}

	//Creation-----------------------------------------------------------

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create(@RequestParam final int courseId) {
		ModelAndView result;
		final Publication publication;

		publication = this.publicationService.create();

		result = this.createEditModelAndView(publication);
		result.addObject("requestURI", "publication/recycler/create.do?courseId=" + courseId);
		return result;

	}

	@RequestMapping(value = "/create", method = RequestMethod.POST, params = "save")
	public ModelAndView create(Publication publication, final BindingResult bindingResult, @RequestParam final int courseId) {
		ModelAndView result;
		publication = this.publicationService.reconstruct(publication, bindingResult);
		Course course;

		if (bindingResult.hasErrors())
			result = this.createEditModelAndView(publication);
		else
			try {
				publication = this.publicationService.save(publication);
				course = this.courseService.findOne(courseId);
				course.getPublications().add(publication);
				this.courseService.save(course);

				result = new ModelAndView("redirect:/product/recycler/list.do?d-16544-p=1");
			} catch (final Throwable oops) {
				result = this.createEditModelAndView(publication, "publication.commit.error");
			}
		return result;

	}
	// Ancillary methods ------------------------------------------------------

	protected ModelAndView createEditModelAndView(final Publication publication) {
		assert publication != null;
		ModelAndView result;
		result = this.createEditModelAndView(publication, null);
		return result;
	}

	protected ModelAndView createEditModelAndView(final Publication publication, final String message) {
		ModelAndView result;

		result = new ModelAndView("publication/edit");
		result.addObject("publication", publication);
		result.addObject("message", message);

		return result;

	}

}
