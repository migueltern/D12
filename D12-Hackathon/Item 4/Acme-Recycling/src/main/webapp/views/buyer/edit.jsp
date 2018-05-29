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

<form:form action="buyer/edit.do" modelAttribute="buyerForm">
	
	<br>
<form:hidden path="buyer.id" />
	
	
<jstl:if test="${buyerForm.buyer.id == 0}">
<div class="col">
			<B><acme:textbox code="buyer.username"
				path="buyer.userAccount.username" /></B>
</div>
<br>
<div class="col">
	<B><acme:provinceselect code="buyer.province" path="buyer.province"/></B>
</div>
<br>
<div class="col">
<div class="form-row">
	<div class="form-group col-md-6">
			<B><acme:password code="buyer.password"
				path="buyer.userAccount.password" /></B>
</div>
	<div class="form-group col-md-6">
			<B><acme:password code="buyer.password" path="passwordCheck" /></B>
</div>
</div>
</div>

		</jstl:if>	
	

<div class="col">
 <div class="form-row">
 	  <div class="form-group col-md-6">
	<acme:textbox code="buyer.name" path="buyer.name"/>
</div>

	<div class="form-group col-md-6">	
	<B><acme:textbox code="buyer.surname" path="buyer.surname"/></B>
</div>
</div>
</div>
		
<div class="col">
	<div class="form-row">
		<div class="form-group col-md-6">
	<B><acme:textbox code="buyer.emailAddress" path="buyer.email"/></B>
</div>
	<br />
	<div class="form-group col-md-6">
	<B><acme:textbox code="buyer.phoneNumber" path="buyer.phone" /></B>
</div>

	<br />
<div class="col">
	<B><acme:textbox code="buyer.postalAddress" path="buyer.address"/></B>

	</div>
</div>
</div>
	<br />

	<br />
	

 
	<acme:submit name="save" code="buyer.save"/>
	<acme:cancel url="welcome/index.do" code="buyer.cancel"/>
	<br />
	<br/>
	<jstl:if test="${buyerForm.buyer.id == 0}">
   		<form:label path="conditions">
		<spring:message code="buyer.legal.accept"/> - <a href="welcome/legal.do"><spring:message code="buyer.legal.moreinfo"/></a>
		</form:label>
		<form:checkbox id="conditions" path="conditions"/>
		<form:errors cssClass="error" path="conditions"/>
   </jstl:if>
 <br/>
 
	</form:form>
	
	
  