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

<display:table pagesize="5" class="displaytag" keepStatus="true"
	name="courses" requestURI="${requestURI}" id="row">

	<!-- ATRIBUTOS -->

	<spring:message code="course.title" var="titleHeader" />
	<display:column property="title" title="${titleHeader}" sortable="true" />
	
	<spring:message code="course.description" var="descriptionHeader" />
	<display:column property="description" title="${descriptionHeader}" sortable="true" />

	<spring:message code="course.format.realisedMoment" var="pattern"></spring:message>
	<spring:message code="course.realisedMoment" var="realisedHeader" />
	<display:column property="realisedMoment" title="${realisedHeader}"
		sortable="true" format="${pattern}" />
		
	
	<security:authorize access="hasRole('BUYER')">
			<spring:message code="course.createLesson" var="createLesson" />
			<display:column title="${createLesson}" sortable="false">
				<%-- <jstl:if test="${(row.newspaper.publicationDate!=null)and(row.draftMode==false)}"> --%>
					<jstl:if test="${!(row.draftMode)}">
					<spring:url value="lesson/buyer/create.do" var="createURL">
						<spring:param name="courseId" value="${row.id}" />
					</spring:url>
					<a href="${createURL}"><spring:message code="course.lesson.create" /></a>
				</jstl:if>
			</display:column>
			
			<spring:message code="course.lesson.list" var="lessonHeader" />
			<display:column title="${lessonHeader}" sortable="false">
				<spring:url value="lesson/buyer/list.do" var="lessonURL">
					<spring:param name="courseId" value="${row.id }" />
				</spring:url>
				<a href="${lessonURL}"><spring:message code="course.lesson.list2" /></a>
			</display:column>
			</security:authorize>
		
	
	 <!--  EDIT -->
	<security:authorize access="hasRole('RECYCLER')">
		<spring:message code="course.assist" var="assist" />
		<display:column title="${assist}" sortable="true">
			
				<spring:url value="course/recycler/assist.do" var="assistURL">
					<spring:param name="courseId" value="${row.id}" />
				</spring:url>
				<a href="${assistURL}"><spring:message code="course.assist" /></a>
		</display:column>
	</security:authorize> 
	
		
		
		
		
	
	

</display:table>
