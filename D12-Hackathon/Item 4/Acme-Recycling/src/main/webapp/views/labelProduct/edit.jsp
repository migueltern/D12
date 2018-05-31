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
<br>
<div class="col-md-8 col-centered">
	<form:hidden path="id" />
	<form:hidden path="version" />
	<form:hidden path="items"/>
	<form:hidden path="byDefault"/>
	
<!-- ATRIBUTOS -->
	<B><acme:textbox code="labelProduct.name" path="name"/></B>
	<br />
	
	<%-- <spring:message code="labelProduct.byDefault" var="byDefaultHeader"/>
	<B><jstl:out value="${byDefaultHeader }"></jstl:out></B>
	<select name="byDefault" id="byDefault" style="width: 123px">
		<option value="true" label="true" />

		<option value="false" label="false">
	</select>
	<br />
	<br> --%>
	
<!-- BOTONES -->

	
<acme:submit name="save" code="labelProduct.save"/>
	<acme:cancel
		url="labelProduct/manager/list.do?d-16544-p=1"
		code="labelProduct.cancel" />
		
</div>
</form:form>
