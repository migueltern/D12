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

<div class="col-md-6 col-centered">
<form:form action="lesson/buyer/edit.do" modelAttribute="lesson">
<br>
	<form:hidden path="id" />
	<form:hidden path="version" />
	<form:hidden path="course" />
	<form:hidden path="number" />

	<!-- ATRIBUTOS -->
	
<div class="col">
 <div class="form-row">
 	  <div class="form-group col-md-6">
	<spring:message code="lesson.title" var="Edit" />
	<B><acme:textbox title="${Edit}" path="title" /></B>
	
</div>

	<div class="form-group col-md-6">	
	<spring:message code="lesson.summary" var="Edit" />
	<acme:textbox title="${Edit}" path="summary" />
</div>
</div>
</div>

	<!-- BOTONES -->
	<acme:submit name="save" code="lesson.save"/>
	
	
	<jstl:if test="${lesson.id !=0 }">
			<acme:submit_with_on_click name="delete" code="lesson.delete" code2="lesson.confirm.delete"/>
			
			
			
	</jstl:if>
		
	<acme:cancel url="course/buyer/list.do?d-16544-p=1" code="lesson.cancel" />
	
</form:form>
</div>
