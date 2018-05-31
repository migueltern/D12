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

<form:form action="assessment/carrier/edit.do"
	modelAttribute="assessmentForm">

<div class="col-md-8 col-centered">
<br>

	<form:hidden path="assessment.id" />
	<form:hidden path="assessment.version" />
	<form:hidden path="assessment.moment" />
	<form:hidden path="requestId" />



	<acme:textbox code="assessment.description"
		path="assessment.description" />


	<div class="cool">	

	<spring:message code="assessment.valuation" var="valuation" />
	<B><jstl:out value="${valuation}"></jstl:out></B>
	<form:input path="assessment.valuation" type="number" class="form-control"
		value="${assessmentForm.assessment.valuation}" max="5" min="1" />
</div>


<br>
	<!-- BOTONES -->
	
	<acme:submit name="save" code="assessment.save"/>
	
		
		<jstl:if test="${cancelRedirectToListRequest}">
		<acme:cancel url="request/carrier/listMyRequest.do?d-16544-p=1"
			code="assessment.cancel" />
		</jstl:if>
		
		<jstl:if test="${cancelRedirectToListAssessment}">
		<acme:cancel url="assessment/carrier/listMyAssessment.do?d-16544-p=1"
			code="assessment.cancel" />
		</jstl:if>
</div>
</form:form>

