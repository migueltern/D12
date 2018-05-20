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



	<!-- Attributes -->

	<acme:column code="material.title" property="title" sortable="true" />

	<acme:column code="material.description" property="description"
		sortable="true" />

	<acme:column code="material.unitPrice" property="unitPrice"
		sortable="true" />


	<!--  DELETE -->
	<security:authorize access="hasRole('ADMIN')">
		<spring:message code="material.delete" var="delete" />
		<display:column title="${delete}" sortable="true">

			<spring:url value="material/admin/delete.do" var="deleteURL">
				<spring:param name="materialId" value="${row.id}" />
			</spring:url>
			<a href="${deleteURL}"><spring:message code="material.delete" /></a>
		</display:column>



	</security:authorize>


</display:table>

<security:authorize access="hasRole('ADMIN')">

	<spring:url value="material/admin/create.do" var="createURL" />
	<a href="${createURL}"><spring:message code="material.create" /></a>

</security:authorize>
