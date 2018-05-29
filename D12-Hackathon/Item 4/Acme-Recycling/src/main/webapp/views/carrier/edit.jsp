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

<form:form action="${requestURI}" modelAttribute="carrierForm">
	
	<br>
<form:hidden path="carrier.id" />
	
	
<jstl:if test="${carrierForm.carrier.id == 0}">
<div class="col">
			<B><acme:textbox code="carrier.username"
				path="carrier.userAccount.username" /></B>
				
</div>
<br>

<div class="col">
<div class="form-row">
	<div class="form-group col-md-6">
			<B><acme:password code="carrier.password"
				path="carrier.userAccount.password" /></B>
</div>
	<div class="form-group col-md-6">
			<B><acme:password code="carrier.password" path="passwordCheck" /></B>
</div>
</div>
</div>
		</jstl:if>	
	
<div class="col">
 <div class="form-row">
 	  <div class="form-group col-md-6">
	<B><acme:textbox code="carrier.name" path="carrier.name"/></B>
</div>
<div class="form-group col-md-6">	
	<B><acme:textbox code="carrier.surname" path="carrier.surname"/></B>
</div>
</div>
</div>

<div class="col">
	<div class="form-row">
		<div class="form-group col-md-6">
	<B><acme:textbox code="carrier.emailAddress" path="carrier.email"/></B>
</div>
	<br />
	<div class="form-group col-md-6">
	<B><acme:textbox code="carrier.phoneNumber" path="carrier.phone" /></B>
</div>

	<br />
<div class="col">
	<B><acme:textbox code="carrier.postalAddress" path="carrier.address"/></B>
</div>
</div>
</div>
<br>
<div class="col">
	<B><acme:provinceselect code="carrier.province" path="carrier.province"/></B>
</div>
	<br />

	<br />
	
	
	
	<acme:submit name="save" code="carrier.save"/>
	<acme:cancel url="welcome/index.do" code="carrier.cancel"/>
	<br />
	<br/>
	<jstl:if test="${carrierForm.carrier.id == 0}">
   		<form:label path="conditions">
		<spring:message code="carrier.legal.accept"/> - <a href="welcome/legal.do"><spring:message code="carrier.legal.moreinfo"/></a>
		</form:label>
		<form:checkbox id="conditions" path="conditions"/>
		<form:errors cssClass="error" path="conditions"/>
   </jstl:if>
 <br/>
	</form:form>