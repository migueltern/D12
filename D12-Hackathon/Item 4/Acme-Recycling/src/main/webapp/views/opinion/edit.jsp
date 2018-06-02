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

<form:form action="${requestURI}" modelAttribute="opinionForm">
<div class="col-md-8 col-centered">
<br>
	<form:hidden path="opinion.id" />
	<form:hidden path="opinion.version" />



<div class="col">
 <div class="form-row">
 	  <div class="form-group col-md-6">
 	  <spring:message code="opinion.title" var="Edit" />
	<acme:textbox title="${Edit}" path="opinion.title" />
</div>

	<div class="form-group col-md-6">
	<spring:message code="opinion.comment" var="Edit" />	
	<acme:textbox title="${Edit}" path="opinion.comment" />
</div>
</div>
</div>


<div class="col">
 <div class="form-row">
 	  <div class="form-group col-md-6">
 	 <spring:message code="opinion.photo" var="Edit" />
	<acme:textbox title="${Edit}" path="opinion.photo" placeHolder="http://"/>
</div>

	<div class="form-group col-md-6">
	<spring:message code="opinion.caption" var="Edit" />	
	<acme:textbox title="${Edit}" path="opinion.caption" />
</div>
</div>
</div>

	


	<jstl:if test="${!hiddenSelects}">

		<jstl:if test="${showItem}">
		<div class="col">
			<acme:select items="${products}" itemLabel="title"
				code="opinion.product" path="opinableId" />
			<br />
			<form:hidden path="opinableItem" value="1" />
			</div>
		</jstl:if>

<div class="col">
		<jstl:if test="${!showItem}">
			<acme:select items="${courses}" itemLabel="title"
				code="opinion.course" path="opinableId" />
			<br />
			<form:hidden path="opinableItem" value="0" />
		</jstl:if>
</div>
	</jstl:if>

	<!-- BOTONES -->

	<acme:submit name="save" code="opinion.save"/>
		
	<security:authorize access="isAuthenticated()">
		<jstl:if test="${opinableItem}">
			<acme:cancel url="opinion/actor/myListOpinionItem.do?d-16544-p=1"
				code="opinion.cancel" />
		</jstl:if>

		<jstl:if test="${!opinableItem}">
			<acme:cancel url="opinion/actor/myListOpinionCourse.do?d-16544-p=1"
				code="opinion.cancel" />
		</jstl:if>
	</security:authorize>
</div>
</form:form>

