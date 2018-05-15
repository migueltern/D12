/*
 * AbstractController.java
 * 
 * Copyright (C) 2017 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the
 * TDG Licence, a copy of which you may download from
 * http://www.tdg-seville.info/License.html
 */

package controllers;

import org.apache.commons.lang.exception.ExceptionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.ClassUtils;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import services.ConfigurationSystemService;

@Controller
public class AbstractController {

	// Panic handler ----------------------------------------------------------

	@Autowired
	private ConfigurationSystemService	configurationSystemService;


	@ExceptionHandler(Throwable.class)
	public ModelAndView panic(final Throwable oops) {
		ModelAndView result;

		result = new ModelAndView("misc/panic");
		result.addObject("name", ClassUtils.getShortName(oops.getClass()));
		result.addObject("exception", oops.getMessage());
		result.addObject("stackTrace", ExceptionUtils.getStackTrace(oops));

		return result;
	}

	@ModelAttribute(value = "d-16544-p")
	public String getPagination() {
		String result;

		result = "1";

		return result;
	}

	@ModelAttribute(value = "Name")
	public String getName() {
		String result;
		result = this.configurationSystemService.findOne().getName();
		return result;
	}
	@ModelAttribute(value = "bannerURL")
	public String getBannerURL() {
		String result;
		result = this.configurationSystemService.findOne().getBanner();
		return result;
	}

	@ModelAttribute(value = "EnglishWelcomeMessage")
	public String getEnglishWelcomeMessage() {
		String result;
		result = this.configurationSystemService.findOne().getEnglishWelcomeMessage();
		return result;
	}

	@ModelAttribute(value = "SpanishWelcomeMessage")
	public String getSpanishWelcomeMessage() {
		String result;
		result = this.configurationSystemService.findOne().getSpanishWelcomeMessage();
		return result;
	}
}
