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

<form:form action="${requestURI}" modelAttribute="managerForm">
	<br>
<form:hidden path="manager.id" />
	
	
<jstl:if test="${managerForm.manager.id == 0}">
<div class="col">
<spring:message code="username" var="Edit" />
			<B><acme:textbox title="${Edit}"
				path="manager.userAccount.username" /></B>
</div>
<br>

<div class="col">
<div class="form-row">
	<div class="form-group col-md-6">
<spring:message code="password" var="Edit" /> 
			<B><acme:password title="${Edit}"
				path="manager.userAccount.password" /></B>
				
</div>
	<div class="form-group col-md-6">
<spring:message code="password" var="Edit" /> 
			<B><acme:password title="${Edit}" path="passwordCheck" /></B>
</div>
</div>
</div>
		</jstl:if>	

<div class="col">
 <div class="form-row">
 	  <div class="form-group col-md-6">
 	<spring:message code="Name" var="Edit" /> 
	<B><acme:textbox title="${Edit}" path="manager.name"/></B>
</div>
	<div class="form-group col-md-6">	
<spring:message code="Surname" var="Edit" /> 
	<B><acme:textbox title="${Edit}" path="manager.surname"/></B>
</div>
</div>
</div>

<div class="col">
	<div class="form-row">
		<div class="form-group col-md-6">
<spring:message code="Email" var="Edit" /> 
	<B><acme:textbox title="${Edit}" path="manager.email"/></B>
</div>
	<br />
	<div class="form-group col-md-6">
<spring:message code="Phone" var="Edit" /> 
	<B><acme:textbox title="${Edit}" path="manager.phone" /></B>
</div>

	<br />
<div class="col">
<spring:message code="Address" var="Edit" /> 
	<B><acme:textbox title="${Edit}" path="manager.address"/></B>
</div>
</div>
</div>
<br>
<div class="col">
	<B><acme:provinceselect code="manager.province" path="manager.province"/></B>
</div>
	<br />

	<br />
	
	
	
	<acme:submit name="save" code="manager.save"/>
	<acme:cancel url="welcome/index.do" code="manager.cancel"/>
	<br />
	<br/>
	<jstl:if test="${managerForm.manager.id == 0}">
   		<form:label path="conditions">
		<spring:message code="manager.legal.accept"/> - <a href="welcome/legal.do"><spring:message code="manager.legal.moreinfo"/></a>
		</form:label>
		<form:checkbox id="conditions" path="conditions"/>
		<form:errors cssClass="error" path="conditions"/>
   </jstl:if>
 <br/>
	</form:form>