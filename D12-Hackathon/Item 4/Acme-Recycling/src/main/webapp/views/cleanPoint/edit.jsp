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

<div class="col-md-8 col-centered">
<form:form action="${requestURI}" modelAttribute="cleanPoint">

<form:hidden path="id" />
<form:hidden path="version" />
	
	<br>
<!-- ATRIBUTOS -->

<div class="col">
 <div class="form-row">
 	  <div class="form-group col-md-6">
<spring:message code="Address" var="Edit" /> 
	<B><acme:textbox title="${Edit}" path="address"/></B>
</div>

	<div class="form-group col-md-6">	
<spring:message code="Phone" var="Edit" /> 
	<B><acme:textbox title="${Edit}" path="phone"/></B>
</div>
</div>
</div>

<div class="col">
 <div class="form-row">
 	  <div class="form-group col-md-6">
	<B><acme:provinceselect code="cleanPoint.province" path="province"/></B>
</div>

	<div class="form-group col-md-6">	
	<B><acme:booleanselect code="cleanPoint.mobile" path="mobile"/></B>
</div>
</div>
</div>
	<br>
	<div class="col">	
	<B><jstl:out value="GPS"></jstl:out></B>
	</div>
<div class="col">	
<br>
<spring:message code="cleanPoint.GPS.name" var="Edit" /> 
	<B><acme:textbox title="${Edit}" path="location.name"/></B>
</div>
<br>
<div class="col">
 <div class="form-row">
 	  <div class="form-group col-md-6">
 	
	<B><acme:textbox2 code="cleanPoint.GPS.latitude" path="location.latitude" /></B>
</div>

	<div class="form-group col-md-6">	
	<B><acme:textbox2 code="cleanPoint.GPS.longitude" path="location.longitude"/></B>
</div>
</div>
</div>
	<br>

	<br>
<!-- BOTONES -->

<acme:submit name="save" code="cleanPoint.save"/>
	


<jstl:if test="${cleanPoint.id != 0}">
		<input type="submit" name="delete" class="btn btn-danger"
			value="<spring:message code="cleanPoint.delete" />"
			onclick="javascript: return confirm('<spring:message code="cleanPoint.confirm.delete" />')" />&nbsp;
	</jstl:if>
	
	
	<acme:cancel
		url="cleanPoint/admin/list.do?d-16544-p=1"
		code="cleanPoint.cancel" />
</form:form>
</div>