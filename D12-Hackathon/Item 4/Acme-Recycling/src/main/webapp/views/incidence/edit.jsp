
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


<form:form action="${requestURI}" modelAttribute="incidence">

<div class="col-md-8 col-centered">
<br>
	<form:hidden path="id" />

	
<div class="col">
 <div class="form-row">
 	  <div class="form-group col-md-6">
	<B><acme:textbox code="incidence.createdMoment" path="createdMoment" readonly="true"/></B>
</div>

	<div class="form-group col-md-6">
<spring:message code="incidence.reasonWhy" var="Edit" />
	<B><acme:textbox title="${Edit}" path="reasonWhy"/></B>
</div>
</div>
</div>


<div class="col">
 <div class="form-row">
 	  <div class="form-group col-md-6">
<spring:message code="incidence.title" var="Edit" />
		<B><acme:textbox title="${Edit}" path="title"/></B>
	
</div>

	<div class="form-group col-md-6">
<spring:message code="incidence.comment" var="Edit" />	
	<B><acme:textbox title="${Edit}" path="comment"/></B>
</div>
</div>
</div>
	
	
	<!-- 	//BOTONES -->
	
	<acme:submit name="save" code="incidence.save"/>
	
	<jstl:if test="${incidence.id != 0 }">
		<acme:submit_with_on_click code2="incidence.confirm.delete" name="delete" code="incidence.delete"/>
	</jstl:if>
	
	<acme:cancel url="${RequestURIcancel}" code="incidence.cancel"/>
	<br />

	</div>
</form:form>