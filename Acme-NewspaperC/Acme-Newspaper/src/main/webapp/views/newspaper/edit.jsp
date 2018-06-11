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

<form:form action="newspaper/user/edit.do" modelAttribute="newspaper">

	<form:hidden path="id" />
	<form:hidden path="version" />
	<%-- <form:hidden path="publicationDate" />
	<form:hidden path="publisher" />
	<form:hidden path="articles" /> --%>
<!-- ATRIBUTOS -->
	<acme:textbox code="newspaper.title" path="title"/>
	<br />
	<acme:textbox code="newspaper.description" path="description"/>
	<br />
	<acme:textbox code="newspaper.picture" path="picture" placeHolder="http://"/>
	
	<br />
	
<!-- BOTONES -->

	<input type="submit" name="save" value="<spring:message code="newspaper.save" />" />&nbsp; 

	<acme:cancel
		url="newspaper/user/list.do?d-16544-p=1"
		code="newspaper.cancel" />
</form:form>
