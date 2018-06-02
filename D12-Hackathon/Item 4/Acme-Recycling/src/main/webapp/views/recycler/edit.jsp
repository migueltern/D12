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

<form:form action="recycler/edit.do" modelAttribute="recyclerForm">
	<br>
<div class="col-md-8 col-centered">
<form:hidden path="recycler.id" />
	
	
<jstl:if test="${recyclerForm.recycler.id == 0}">
<div class="col">
<spring:message code="username" var="Edit" />
			<B><acme:textbox  title="${Edit}" 
				path="recycler.userAccount.username" /><br /></B>
</div>


<div class="col">
<div class="form-row">
	<div class="form-group col-md-6">
<spring:message code="password" var="Edit" /> 
			<B><acme:password title="${Edit}"
				path="recycler.userAccount.password" /></B>   
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
	<B><acme:textbox title="${Edit}" path="recycler.name"/></B>
</div>
	<br />
	<div class="form-group col-md-6">
<spring:message code="Surname" var="Edit" />
	<B><acme:textbox title="${Edit}" path="recycler.surname"/></B>
</div>
</div>
</div>
	
<div class="col">
	<div class="form-row">
		<div class="form-group col-md-6">
<spring:message code="Email" var="Edit" />
	<B><acme:textbox title="${Edit}" path="recycler.email"/></B>
</div>
	
	<div class="form-group col-md-6">
<spring:message code="Phone" var="Edit" />
	<B><acme:textbox title="${Edit}" path="recycler.phone" /></B>
</div>


<div class="col">
<spring:message code="Address" var="Edit" />
	<B><acme:textbox title="${Edit}" path="recycler.address"/></B>
</div>
</div>
</div>
	<br />

	
<div class="col">
	<B><acme:provinceselect code="Province" path="recycler.province"/></B>
</div>
	<br>
	
	<acme:submit name="save" code="recycler.save" />
	
	<acme:cancel url="welcome/index.do" code="recycler.cancel"/>
	<br />
	<br/>
	<jstl:if test="${recyclerForm.recycler.id == 0}">
   		<form:label path="conditions">
		<spring:message code="recycler.legal.accept"/> - <a href="welcome/legal.do"><spring:message code="recycler.legal.moreinfo"/></a>
		</form:label>
		<form:checkbox id="conditions" path="conditions"/>
		<form:errors cssClass="error" path="conditions"/>
   </jstl:if>
 <br/>
 </div>
	</form:form>
	
	
	