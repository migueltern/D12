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


<table>


<caption class="caption">
<!-- C1 -->
	<spring:message code="dashboard.findNewWithMoreComments" />
</caption>
<display:table name="findNewWithMoreComments" id="row"
	class="displaytag">
	<spring:message code="new.title" var="nameHeader" />
	<display:column title="${nameHeader}">
		<spring:url value="new/admin/display.do" var="idURL">
			<spring:param name="newd" value="${row.id }" />
		</spring:url>
		<a href="${idURL}"><jstl:out value="${row.title}" /></a>
	</display:column>
</display:table>

</table>





