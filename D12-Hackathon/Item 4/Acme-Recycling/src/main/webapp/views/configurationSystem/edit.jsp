<%--
 * edit.jsp
 *
 * Copyright (C) 2017 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<div class="col-md-8 col-centered">	
<form:form action="${RequestURI }" modelAttribute="configurationSystem">
<br>
	<form:hidden path="id" />
	<form:hidden path="version" />
	
	<font size="5" color = "green" face="Georgia" ><B><spring:message code="welcome"  /></B></font>
	<fieldset>
	<div class="col">
<div class="form-row">
	<div class="form-group col-md-6">
	<B><acme:textbox code="configurationSystem.name" path="name"/></B>
</div>
	<div class="form-group col-md-6">
	
	<B><acme:textbox code="configurationSystem.banner" path="banner" /></B>
</div>
</div>
</div>
		
		<div class="col">
	<B><acme:textbox code="configurationSystem.englishWelcomeMessage" path="englishWelcomeMessage" /></B>
	</div>
	
	<div class="col">
	<B><acme:textbox code="configurationSystem.spanishWelcomeMessage" path="spanishWelcomeMessage" /></B>
	</div>
	</fieldset>
	<br>
	<font size="5" color = "green" face="Georgia" ><B><spring:message code="finder"  /></B></font>
	
	<div class="col">
<div class="form-row">
	<div class="form-group col-md-6">
	<B><acme:textbox code="configurationSystem.maxNumberFinder" path="maxNumberFinder" /></B>
</div>
	<div class="form-group col-md-6">
	
	<B><acme:textbox code="configurationSystem.cacheMaxTime" path="cacheMaxTime" /></B>
	
</div>
</div>
</div>
	
	<font size="5" color = "green" face="Georgia" ><B><spring:message code="aboutUs"  /></B></font>
	<fieldset>
	<div class="col">
	<B><acme:textbox code="configurationSystem.whoAreWeSpanish" path="whoAreWeSpanish" /></B>
	</div>
	
	<div class="col">
	<B><acme:textbox code="configurationSystem.whoAreWeEnglish" path="whoAreWeEnglish" /></B>
	</div>
	
	<div class="col">
	<B><acme:textbox code="configurationSystem.locationSpanish" path="locationSpanish" /></B>
	</div>
	
	<div class="col">
	<B><acme:textbox code="configurationSystem.locationEnglish" path="locationEnglish" /></B>
	</div>
	
	<div class="col">
	<B><acme:textbox code="configurationSystem.aboutUsPicture" path="aboutUsPicture" /></B>
	</div>
	</fieldset>
	<br>
	

<!-- 	//BOTONES -->
	
	<acme:submit name="save" code="configurationSystem.save"/>
	

		
		<acme:cancel
		url="welcome/index.do"
		code="configurationSystem.cancel" />
	<br />
</form:form>
</div>