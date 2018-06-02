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
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<form:form action="request/manager/edit.do" modelAttribute="requestForm">
<div class="col-md-8 col-centered">

<br> 

	<form:hidden path="request.id" />
	<form:hidden path="request.version" />
<%-- 	<form:hidden path="code" />
	<form:hidden path="status" /> --%>
	<form:hidden path="itemId" />


<div class="col">
 <div class="form-row">
 	  <div class="form-group col-md-6">
 <spring:message code="request.title" var="Edit" />
	<acme:textbox title="${Edit}" path="request.title" />
</div>

	<div class="form-group col-md-6">
<spring:message code="request.observation" var="Edit" />
	<acme:textbox title="${Edit}" path="request.observation" />
</div>
</div>
</div>
	
<div class="col">
 <div class="form-row">
 	  <div class="form-group col-md-6">
	<acme:select items="${carriers}" itemLabel="name"
		code="request.carrier" path="request.carrier" />
</div>

	<div class="form-group col-md-6">	
	<acme:selectmultiple items="${cleanPoints}" itemLabel="address"
		code="request.cleanPoint" path="request.cleanPoints" />
</div>
</div>
</div>

	<!-- BOTONES -->
	
	<acme:submit name="save" code="request.save"/>


		
		<acme:cancel url="request/manager/listItemsNonRequest.do?d-16544-p=1"
		code="request.cancel" />
</div>
</form:form>

