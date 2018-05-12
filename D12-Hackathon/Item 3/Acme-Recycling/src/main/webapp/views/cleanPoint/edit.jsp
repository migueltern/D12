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

<form:form action="${requestURI}" modelAttribute="cleanPoint">

	
	
<!-- ATRIBUTOS -->
	<B><acme:textbox code="cleanPoint.address" path="address"/></B>
	<br />
	<B><acme:textbox code="cleanPoint.province" path="province" readonly="true"/></B>
	<br />
	<B><acme:textbox code="cleanPoint.locality" path="locality" readonly="true"/></B>
	<br />
	<B><acme:booleanselect code="cleanPoint.mobile" path="mobile"/></B>
	<br />
	
	<fieldset>
	<B><acme:textbox code="cleanPoint.GPS.name" path="GPS.name"/></B>
	<br>
	<B><acme:textbox code="cleanPoint.GPS.latitude" path="GPS.latitude"/></B>
	<br>
	<B><acme:textbox code="cleanPoint.GPS.longitude" path="GPS.longitude"/></B>
	<br>
	</fieldset>
	
<!-- BOTONES -->

	<input type="submit" name="save" value="<spring:message code="cleanPoint.save" />" />&nbsp; 

	<acme:cancel
		url="cleanPoint/recycler/list.do?d-16544-p=1"
		code="cleanPoint.cancel" />
</form:form>
