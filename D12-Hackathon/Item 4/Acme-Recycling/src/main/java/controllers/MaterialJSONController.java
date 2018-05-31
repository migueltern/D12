
package controllers;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import services.AdminService;
import services.LabelMaterialService;
import services.MaterialService;

import com.google.gson.Gson;

import domain.Material;

@RestController
@RequestMapping(value = "/materialJSON")
public class MaterialJSONController extends AbstractController {

	//Services--------------------------------------------

	@Autowired
	AdminService			adminService;

	@Autowired
	LabelMaterialService	labelMaterialService;

	@Autowired
	MaterialService			materialService;


	//Constructor--------------------------------------------------------

	public MaterialJSONController() {
		super();
	}

	//	Listing ---------------------------------------------------------
	//	@RequestMapping(value = "/list", produces = {
	//		MediaType.APPLICATION_JSON_VALUE
	//	}, method = RequestMethod.GET)
	//	public Material list() {
	//
	//		final Material material = this.materialService.findAll().iterator().next();
	//		material.setBuys(null);
	//		material.setLabelMaterial(null);
	//		//		final String serialize = new Gson().toJson(material);
	//		return material;
	//	}

	@ResponseBody
	@RequestMapping(value = "/listJSON", produces = {
		MediaType.APPLICATION_JSON_VALUE
	}, method = RequestMethod.GET)
	public String list() {

		final Material material = this.materialService.findAll().iterator().next();
		material.setBuys(null);
		//Quitamos la bidireccionalidad para que no nos salga un stack overflow al intentar mapearlo a json
		material.getLabelMaterial().setMaterials(null);
		final String serialize = new Gson().toJson(material);
		return serialize;
	}

	//	@RequestMapping(value = "/addMaterial", method = RequestMethod.POST)
	//	public ModelAndView addMaterial(final Material material) {
	//
	//		ModelAndView result;
	//		//final Material material;
	//		final Collection<Material> materials = new ArrayList<Material>();
	//
	//		result = new ModelAndView("material/list");
	//		result.addObject("materials", materials);
	//		result.addObject("requestURI", "materialSON/listJSON.do");
	//
	//		return result;
	//	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView addMaterial() {

		ModelAndView result;
		//final Material material;
		final Collection<Material> materials = new ArrayList<Material>();

		final RestTemplate restTemplate = new RestTemplate();
		//Si intento convertirlo a la clase Material.class no funcionaria, por lo tanto lo convertimos a una clase String y despues hacemos la conversion con Gson
		final String string = restTemplate.getForObject("http://localhost:8080/Acme-Recycling/materialJSON/listJSON.do", String.class);
		//Hacemos la conversion con Gson
		final Gson gson = new Gson();
		final Material material = gson.fromJson(string, Material.class);

		//Lo añadimos a la lista
		materials.add(material);

		result = new ModelAndView("material/list");
		result.addObject("materials", materials);
		result.addObject("requestURI", "materialSON/list.do");

		return result;
	}

}
