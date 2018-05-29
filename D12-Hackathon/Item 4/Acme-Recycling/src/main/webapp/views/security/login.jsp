 <%--
 * login.jsp
 *
 * Copyright (C) 2017 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<div class="form-group">
<form:form action="j_spring_security_check" modelAttribute="credentials">

<br>

	<form:label path="username">
		<spring:message code="security.username" />
	</form:label>
	<form:input path="username" class="form-control input-lg"/>	
	<form:errors class="error" path="username" />
	<br />

	<form:label path="password">
		<spring:message code="security.password" />
	</form:label>
	<form:password path="password" class="form-control input-lg"/>	
	<form:errors class="error" path="password" />
	<br />
	
	<jstl:if test="${showError == true}">
		<div class="alert alert-danger">
			<spring:message code="security.login.failed" />
		</div>
	</jstl:if>
	
	<input type="submit" class="btn btn-lg btn-primary btn-block" value="<spring:message code="security.login" />" />
	
</form:form>
</div>