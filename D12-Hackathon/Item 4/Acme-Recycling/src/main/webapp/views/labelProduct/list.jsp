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
<display:table name="labelProducts" id="row" requestURI="${requestURI}"
	pagesize="5" class="displaytag">

	<!--  EDIT -->
	<security:authorize access="hasRole('MANAGER')">
		<jstl:if test="${row.byDefault==false }">
			<spring:message code="labelProduct.edit" var="Edit" />
			<display:column title="${Edit}" sortable="true">

				<spring:url value="labelProduct/manager/edit.do" var="editURL">
					<spring:param name="labelProductId" value="${row.id}" />
				</spring:url>
				<a href="${editURL}"><spring:message code="labelProduct.edit" /></a>
			</display:column>
		</jstl:if>
	</security:authorize>



	<!-- Attributes -->

	<acme:column code="labelProduct.name" property="name" sortable="true" />

	<acme:column code="labelProduct.byDefault" property="byDefault"
		sortable="true" />


	<!--  EDIT -->
	<security:authorize access="hasRole('MANAGER')">
		<jstl:if test="${row.byDefault==false }">
			<spring:message code="labelProduct.delete" var="delete" />
			<display:column title="${delete}" sortable="true">

				<spring:url value="labelProduct/manager/delete.do" var="deleteURL">
					<spring:param name="labelProductId" value="${row.id}" />
				</spring:url>
				<a href="${deleteURL}"><spring:message
						code="labelProduct.delete" /></a>
			</display:column>
		</jstl:if>



	</security:authorize>


</display:table>

<security:authorize access="hasRole('MANAGER')">

	<spring:url value="labelProduct/manager/create.do" var="createURL" />
	<a href="${createURL}"><spring:message code="labelProduct.create" /></a>

</security:authorize>

