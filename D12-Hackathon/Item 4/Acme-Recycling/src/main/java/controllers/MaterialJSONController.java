
package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import services.AdminService;
import services.CourseService;
import services.LabelMaterialService;
import services.MaterialService;

import com.google.gson.Gson;

import domain.Course;

@Controller
@RequestMapping(value = "/materialJSON")
public class MaterialJSONController extends AbstractController {

	//Services--------------------------------------------
	@Autowired
	MaterialService			materialService;

	@Autowired
	AdminService			adminService;

	@Autowired
	LabelMaterialService	labelMaterialService;

	@Autowired
	CourseService			courseService;


	//Constructor--------------------------------------------------------

	public MaterialJSONController() {
		super();
	}

	//	Listing ---------------------------------------------------------
	@ResponseBody
	@RequestMapping(value = "/list", produces = {
		MediaType.APPLICATION_JSON_VALUE
	}, method = RequestMethod.GET)
	public String list() {

		final Course course = this.courseService.findAll().iterator().next();
		course.setMaterials(null);
		course.setLessons(null);
		final String serialize = new Gson().toJson(course);
		return serialize;
	}
}
