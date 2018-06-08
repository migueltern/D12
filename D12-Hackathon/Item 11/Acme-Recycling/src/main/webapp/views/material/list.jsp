<%--
 * list.jsp
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
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<br>
<!-- Finder para el Buyer -->
<security:authorize access="hasRole('BUYER')">
	<jstl:if test="${showSearch}">
		<form:form action="finder/buyer/search.do" modelAttribute="finder">

			<form:hidden path="id" />
			<form:hidden path="version" />
			<form:hidden path="materials" />
<div class="col-md-12 col-centered">
<div class="col ">
 <div class="form-row">
 	  <div class="form-group col-md-3">
<spring:message code="finder.keyWord" var="Edit" /> 
			<acme:textbox title="${Edit}" path="keyWord" />

</div>

	<div class="form-group col-md-3">	
<spring:message code="finder.lowPrice" var="Edit" /> 
			<acme:textbox title="${Edit}" path="lowPrice" />

</div>

	<div class="form-group col-md-3">	
<spring:message code="finder.highPrice" var="Edit" /> 
			<acme:textbox title="${Edit}" path="highPrice" />


</div>

	<div class="form-group col-md-3">
			<input type="submit" name="search" class="btn btn-success"
				value="<spring:message code="finder.search" />" /> &nbsp; 
				
</div>
</div>
</div>
</div>	 
	</form:form>
	</jstl:if>
</security:authorize>

<!-- Listing messageFodler -->
<display:table name="materials" id="row" requestURI="${requestURI}"
	pagesize="5" class="displaytag">


	<!--  EDIT -->
	<security:authorize access="hasRole('ADMIN')">
		<spring:message code="material.edit" var="Edit" />
		<display:column title="${Edit}" sortable="true">

			<spring:url value="material/admin/edit.do" var="editURL">
				<spring:param name="materialId" value="${row.id}" />
			</spring:url>
			<a href="${editURL}"><spring:message code="material.edit" /></a>
		</display:column>
	</security:authorize>


	<!--  Display -->
	<security:authorize access="hasRole('ADMIN')">
		<spring:message code="material.display" var="display" />
		<display:column title="${display}" sortable="true">

			<spring:url value="material/admin/display.do" var="displayURL">
				<spring:param name="materialId" value="${row.id}" />
			</spring:url>
			<a href="${displayURL}"><spring:message code="material.display" /></a>
		</display:column>
	</security:authorize>



	<!-- Attributes -->

	<acme:column code="material.title" property="title" sortable="true" />

	<acme:column code="material.description" property="description"
		sortable="true" />

	<spring:message code="material.format.price" var="patternPrice" />
	<spring:message code="material.unitPrice" var="totalPrice" />
	<display:column property="unitPrice" title="${totalPrice}"
		sortable="true" format="${patternPrice}" />

	<acme:column code="material.quantity" property="quantity"
		sortable="true" />


	<spring:message code="material.format.price" var="patternPrice" />
	<spring:message code="material.totalPrice" var="totalPrice" />
	<display:column property="totalPrice" title="${totalPrice}"
		sortable="true" format="${patternPrice}" />

	<acme:column code="material.labelMaterial" property="labelMaterial.name"
		sortable="true" />
		
	<!--  COMPRAR -->
	<security:authorize access="hasRole('BUYER')">
		<spring:message code="material.buy" var="buy" />
		<display:column title="${buy}" sortable="true">

			<spring:url value="buy/buyer/create.do" var="deleteURL">
				<spring:param name="materialId" value="${row.id}" />
			</spring:url>
			<a href="${deleteURL}"><spring:message code="material.buy" /></a>
		</display:column>
	</security:authorize>
	<%-- 
	<!--  DELETE -->
	<security:authorize access="hasRole('ADMIN')">
		<spring:message code="material.delete" var="delete" />
		<display:column title="${delete}" sortable="true">

			<spring:url value="material/admin/delete.do" var="deleteURL">
				<spring:param name="materialId" value="${row.id}" />
			</spring:url>
			<a href="${deleteURL}"><spring:message code="material.delete" /></a>
		</display:column>



	</security:authorize> --%>


</display:table>
<div class="text-center">
<security:authorize access="hasRole('ADMIN')">

	<spring:url value="material/admin/create.do" var="createURL" />
	<a href="${createURL}"><spring:message code="material.create" /></a>

</security:authorize>
</div>
<div class="text-center">
<security:authorize access="isAnonymous()">
<font size="4" color=black face="Bebas Neue"><B><spring:message code="aviso.material" /></B></font>
<a href="buyer/create.do"><spring:message code="aviso2"  /></a>
</security:authorize>
</div>