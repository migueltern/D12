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
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags"%>


<display:table name="comment" class="displaytag"
	requestURI="${requestURI}" id="row">

	
 <display:column>

	<B><spring:message code="comment.body" /></B>
	<jstl:out value="${row.body}"></jstl:out>
	<p>
	
	
 	<spring:message code="article.format.publishedMoment1" var="pattern"></spring:message>
	<fmt:formatDate value="${row.createdMoment}" pattern="${pattern}" var="newdatevar" />
	<B><spring:message code="comment.createdMoment"></spring:message></B>
	<c:out value="${newdatevar}" />
			


	
</display:column> 

</display:table>

<display:table name="recycler" class="displaytag"
	id="row">
	<display:column>
	<h2><spring:message code="comment.recycler" /></h2>	
	<jstl:out value="${row.name}"></jstl:out>
	</display:column>
</display:table>
	
	
	

	


	