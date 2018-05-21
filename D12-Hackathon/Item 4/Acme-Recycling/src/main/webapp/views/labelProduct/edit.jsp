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

<form:form action="${requestURI}" modelAttribute="labelProduct">

	<form:hidden path="id" />
	<form:hidden path="version" />
	<form:hidden path="items"/>
	
<!-- ATRIBUTOS -->
	<B><acme:textbox code="labelProduct.name" path="name"/></B>
	<br />
	
	<B><acme:textbox code="labelProduct.byDefault" path="byDefault"/></B>
	<br />
	
<!-- BOTONES -->

	<input type="submit" name="save" value="<spring:message code="labelProduct.save" />" />&nbsp; 

	<acme:cancel
		url="labelProduct/manager/list.do?d-16544-p=1"
		code="labelProduct.cancel" />
</form:form>
