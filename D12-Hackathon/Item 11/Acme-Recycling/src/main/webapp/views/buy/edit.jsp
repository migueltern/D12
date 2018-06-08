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
<form:form action="buy/buyer/edit.do" modelAttribute="buy">
<br>
	<form:hidden path="id" />
	<form:hidden path="version" />
	<form:hidden path="material" />
	
<!-- ATRIBUTOS -->

<div class="col">
<div class="form-row">
	<div class="form-group col-md-6">
<spring:message code="buy.quantity" var="Edit" />
<B><acme:textbox title="${Edit}" path="quantity"/></B>
</div>
	<div class="form-group col-md-6">
<spring:message code="buy.comment" var="Edit" />
<B><acme:textbox title="${Edit}" path="comment"/></B>
</div>
</div>
</div>

	<B><spring:message code="buy.creditcard"/></B>
	<br>
	<br>
	
	<div class="col">
<div class="form-row">
	<div class="form-group col-md-6">
	<spring:message code="buy.creditCard.holderName" var="Edit" />
	<B><acme:textbox title="${Edit}" path="creditCard.holderName"/></B>
</div>
	<div class="form-group col-md-6">
	<spring:message code="buy.creditCard.brandName" var="Edit" />
	<B><acme:textbox title="${Edit}" path="creditCard.brandName"/></B>
</div>
</div>
</div>

<div class="col">
	<spring:message code="buy.creditCard.number" var="Edit" />
	<B><acme:textbox title="${Edit}" path="creditCard.number" placeHolder="Ej. XXXXXXXXXXXXXXX"/></B>
</div>

<div class="col">
<div class="form-row">
	<div class="form-group col-md-6">
	<spring:message code="buy.creditCard.expirationMonth" var="Edit" />
	<B><acme:textbox title="${Edit}" path="creditCard.expirationMonth" placeHolder="XX"/></B>
</div>
	<div class="form-group col-md-6">
	<spring:message code="buy.creditCard.expirationYear" var="Edit" />
	<B><acme:textbox title="${Edit}" path="creditCard.expirationYear" placeHolder="XX"/></B>
</div>
</div>
</div>

<div class="col">
	<B><spring:message code="buy.creditCard.cvv" /></B>
	<B><acme:textbox title="${Edit}" path="creditCard.cvv"/></B>
</div>
	<br>
<!-- BOTONES -->

<acme:submit name="save" code="buy.save"/>
	

	<acme:cancel
		url="material/buyer/list.do?d-16544-p=1"
		code="buy.cancel" />
</form:form>
</div>