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
<display:table name="incidences" id="row" requestURI="${requestURI}"
	pagesize="5" class="displaytag">
	
	<security:authorize access="hasRole('RECYCLER')">
	<spring:message code="incidence.edit" var="Edit"/>
		
		<display:column title="${Edit}" sortable="true">
		
		<jstl:if test="${row.resolved==false}">
			<spring:url value="${RequestURIedit}" var="editURL">
				<spring:param name="incidenceId" value="${row.id}" />
			</spring:url>
			<a href="${editURL}"><spring:message code="incidence.edit" /></a>
		
		</jstl:if>
		</display:column>
	</security:authorize>
	<!-- Attributes -->

	<acme:column code="incidence.title" property="title" sortable ="true"/>
	
	<spring:message code="message.format.date" var="pattern"></spring:message>
	<spring:message code="incidence.createdMoment" var="postedHeader" />
	<display:column property="createdMoment" title="${postedHeader}"
		sortable="true" format="${pattern}" />
	

<!-- Attributes PARA EL ADMIN -->
<security:authorize access="hasRole('ADMIN')">

<acme:column code="incidence.reasonWhy" property="reasonWhy" sortable ="true"/>

<acme:column code="incidence.comment" property="comment" sortable ="true"/>

<spring:message code="resolved" var="resolved" />
	<display:column title="${resolved}">
		<jstl:if test="${row.resolved==true}">
			<div
				style="position: relative; width: 30px; height: 30px; margin-left: auto; margin-right: auto;">

				<img src="images/no.jpeg" width="30" height="30">
			</div>
		</jstl:if>
		<jstl:if test="${row.resolved==false}">
			<div
				style="position: relative; width: 30px; height: 30px; margin-left: auto; margin-right: auto;">

				<img src="images/yes.jpeg" width="30" height="30">
			</div>
		</jstl:if>
		
</display:column>
		
</security:authorize>
</display:table>



