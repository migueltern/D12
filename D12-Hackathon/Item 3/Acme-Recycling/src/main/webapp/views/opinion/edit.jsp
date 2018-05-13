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

<form:form action="opinion/recycler/edit.do" modelAttribute="opinion">

	<form:hidden path="id" />
	<form:hidden path="version" />
	
	<acme:textbox code="opinion.title" path="title"/>
	<br />
 	<acme:textbox code="opinion.comment" path="comment"/>
	<br /> 
	
	<jstl:if test="${selectProducts}" >
		<acme:select items="${products}" itemLabel="title" code="opinion.product" path="opinable"/>
		<br />
	
		<!-- BOTON SAVE para producto -->
		<input type="submit" name="saveOpinionProduct"
			value="<spring:message code="opinion.save"/>" />&nbsp;
		
	</jstl:if>
	
	<jstl:if test="${selectCourses}" >
		<acme:select items="${courses}" itemLabel="title" code="opinion.course" path="opinable"/>
		<br />
		
		<!-- BOTON SAVE para producto -->
		<input type="submit" name="saveOpinionCourse"
			value="<spring:message code="opinion.save"/>" />&nbsp;
			
	</jstl:if>
	
	
	
	
	<!-- BOTONES -->
		
		<acme:cancel
		url="opinion/recycler/myList.do?d-16544-p=1"
		code="opinion.cancel" />
</form:form>

