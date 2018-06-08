
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


<form:form action="${requestURI}" modelAttribute="item">
<div class="col-md-8 col-centered">
<br>
	<form:hidden path="id" />
	
	
<div class="col">
 <div class="form-row">
 	  <div class="form-group col-md-6">
	<B><acme:textbox code="item.publicationMoment" path="publicationMoment" readonly="true"/></B>
</div>

	<div class="form-group col-md-6">
<spring:message code="item.title" var="Edit" />
		<B><acme:textbox title="${Edit}" path="title"/></B>
</div>
</div>
</div>
	
<div class="col">
 <div class="form-row">
 	  <div class="form-group col-md-6">
 	  <spring:message code="item.description" var="Edit" />
	<B><acme:textbox title="${Edit}" path="description"/></B>
</div>

	<div class="form-group col-md-6">
	 <spring:message code="item.quantity" var="Edit" />
	<B><acme:textbox title="${Edit}" path="quantity"/></B>
</div>
</div>
</div>
	
<div class="col">
<spring:message code="item.photo" var="Edit" />
	<B><acme:textbox title="${Edit}" path="photo" placeHolder="http://"/></B>
	
</div>

<div class="col">	
	<B><acme:select items="${labelsProduct}" itemLabel="name" code="item.labelProduct" path="labelProduct"/></B>
</div>
	
	
	<!-- 	//BOTONES -->
	
	<acme:submit name="save" code="item.save"/>
	
	<jstl:if test="${item.id != 0 }">
		<acme:submit_with_on_click code2="item.confirm.delete" name="delete" code="item.delete"/>
	</jstl:if>
	
	<acme:cancel url="${RequestURIcancel}" code="item.cancel"/>
	<br />

	</div>
</form:form>