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


<display:table pagesize="5" class="displaytag" keepStatus="true"
	name="items" requestURI="${requestURI}" id="row">

	<!--  EDIT -->

 	<security:authorize access="hasRole('MANAGER')">
		<spring:message code="request.request" var="Edit" />
		<display:column title="${Edit}" sortable="false">

			<spring:url value="request/manager/create.do" var="editURL">
				<spring:param name="itemId" value="${row.id}" />
			</spring:url>
			<a href="${editURL}"><spring:message code="request.request" /></a>
		</display:column>
	</security:authorize>
	
	<!-- ATRIBUTOS -->
	
	<spring:message code="request.title" var="titleHeader" />
	<display:column property="title" title="${titleHeader}" sortable="true" />
	

	




</display:table>


