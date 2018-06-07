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





<div class="text-center">
<!-- C1 -->
	<B><spring:message code="dashboard.findNewWithMoreComments" /></B>
</div>
<display:table name="findNewWithMoreComments" id="row"
	class="displaytag">
	<spring:message code="new.title" var="nameHeader" />
	<display:column title="${nameHeader}">
		<spring:url value="newscast/admin/display.do" var="idURL">
			<spring:param name="newscastId" value="${row.id }" />
		</spring:url>
		<a href="${idURL}"><jstl:out value="${row.title}" /></a>
	</display:column>
</display:table>

<br>

<div class="text-center">
<!-- C2 -->
	<B><spring:message code="dashboard.findEditorsWithMoreNewsRedacted" /></B>
</div>
<display:table name="findEditorsWithMoreNewsRedacted" id="row"
	class="displaytag">
	<spring:message code="editor.name" var="nameHeader" />
	<display:column title="${nameHeader}">
		<spring:url value="editor/admin/display.do" var="idURL">
			<spring:param name="editorId" value="${row.id }" />
		</spring:url>
		<a href="${idURL}"><jstl:out value="${row.name}" /></a>
	</display:column>
</display:table>

<br>


<!-- C3 -->
<div class="text-center">
	<B><spring:message code="dashboard.findTop5LabelProducts" /></B>
</div>
<display:table name="findTop5LabelProducts" id="row"
	class="displaytag">
	<spring:message code="editor.name" var="nameHeader" />
	<display:column title="${nameHeader}">
		<jstl:out value="${row.name}" />
	</display:column>
</display:table>

<br>
	<div class="text-center">
<table>
<!-- C4 -->


		<B><spring:message
			code="dashboard.avgMinMaxAndStddevOfCoursesByBuyer" /></B>
	
	<tr>
		<th><spring:message code="dashboard.AVG" /></th>
		<th><spring:message code="dashboard.MIN" /></th>
		<th><spring:message code="dashboard.MAX" /></th>
		<th><spring:message code="dashboard.STDDEV" /></th>
	</tr>
	<tr>
		<jstl:forEach var="medidas"
			items="${avgMinMaxAndStddevOfCoursesByBuyer}">
			<td><fmt:formatNumber type="number" minFractionDigits="3" maxFractionDigits="3" value="${medidas}" /></td>
		</jstl:forEach>
	</tr>
</table>
</div>


<br>
<div class="text-center">
<table>
<!-- C5 -->
	
		<B><spring:message
			code="dashboard.avgOfIncidencesResolved" /></B>
	

	<tr>
		<td><fmt:formatNumber type="number" minFractionDigits="3" maxFractionDigits="3" value="${avgOfIncidencesResolved}" /></td>
	</tr>
</table>
</div>


<br>
<div class="text-center">
<table>
<!-- C6 -->
	
		<B><spring:message
			code="dashboard.avgOfRecyclerWithAtLeastOneProduct" /></B>


	<tr>
		<td><fmt:formatNumber type="number" minFractionDigits="3" maxFractionDigits="3" value="${avgOfRecyclerWithAtLeastOneProduct}" /></td>
	</tr>
</table>
</div>

<br>
<div class="text-center">
<table>
<!-- C7 -->
	
		<B><spring:message
			code="dashboard.avgOfUsersBanned" /></B>
	

	<tr>
		<td><fmt:formatNumber type="number" minFractionDigits="3" maxFractionDigits="3" value="${avgOfUsersBanned}" /></td>
	</tr>
</table>
</div>


<br>
<div class="text-center">
<table>
<!-- C8 -->
	

		<B><spring:message
			code="dashboard.avgMinMaxAndStddevOfCommentsByNews" /></B>
	
	<tr>
		<th><spring:message code="dashboard.AVG" /></th>
		<th><spring:message code="dashboard.MIN" /></th>
		<th><spring:message code="dashboard.MAX" /></th>
		<th><spring:message code="dashboard.STDDEV" /></th>
	</tr>
	<tr>
		<jstl:forEach var="medidas"
			items="${avgMinMaxAndStddevOfCommentsByNews}">
			<td><fmt:formatNumber type="number" minFractionDigits="3" maxFractionDigits="3" value="${medidas}" /></td>
		</jstl:forEach>
	</tr>
</table>
</div>

<br>

<div class="text-center">
<!-- C9 -->
	<B><spring:message code="dashboard.findLatestItems" /></B>
</div>

<br>

<display:table name="findLatestItems" id="row"
	class="displaytag">
	<spring:message code="new.title" var="nameHeader" />
	<display:column title="${nameHeader}">
		<spring:url value="item/admin/display.do" var="idURL">
			<spring:param name="itemId" value="${row.id }" />
		</spring:url>
		<a href="${idURL}"><jstl:out value="${row.title}" /></a>
	</display:column>
</display:table>

<br>
<div class="text-center">
<table>
<!-- C10 -->
	

		<B><spring:message
			code="dashboard.nameTitleRecyclerWithItemMostValue" /></B>

	<tr>
		<th><spring:message code="editor.name" /></th>
		<th><spring:message code="new.title" /></th>
	</tr>
	<tr>
		<jstl:forEach var="medidas"
			items="${nameTitleRecyclerWithItemMostValue}">
			<%-- <td><fmt:formatNumber type="text" minFractionDigits="3" maxFractionDigits="3" value="${medidas}" /></td> --%>
			<td> <jstl:out value="${medidas}"></jstl:out></td>
		</jstl:forEach>
	</tr>
</table>
</div>

<br>
<div class="text-center">
<table>
<!-- C11 -->
	

		<B><spring:message
			code="dashboard.avgMinMaxAndStddevOfRequestByManager" /></B>

	<tr>
		<th><spring:message code="dashboard.AVG" /></th>
		<th><spring:message code="dashboard.MIN" /></th>
		<th><spring:message code="dashboard.MAX" /></th>
		<th><spring:message code="dashboard.STDDEV" /></th>
	</tr>
	<tr>
		<jstl:forEach var="medidas"
			items="${avgMinMaxAndStddevOfRequestByManager}">
			<td><fmt:formatNumber type="number" minFractionDigits="3" maxFractionDigits="3" value="${medidas}" /></td>
		</jstl:forEach>
	</tr>
</table>
</div>


<br>
<div class="text-center">
<!-- C12 -->
	<B><spring:message code="dashboard.findTop3Materials" /></B>
</div>

<br>
<display:table name="findTop3Materials" id="row"
	class="displaytag">
	<spring:message code="editor.name" var="nameHeader" />
	<display:column title="${nameHeader}">
		<spring:url value="material/admin/display.do" var="idURL">
			<spring:param name="materialId" value="${row.id }" />
		</spring:url>
		<a href="${idURL}"><jstl:out value="${row.title}" /></a>
	</display:column>
</display:table>

<br>
<div class="text-center">
<table>
<!-- C13 -->
	
		<B><spring:message
			code="dashboard.ratioCarrierWithAtLeastOneRequestVersusCarrierWithNoOneRequest" />
	</B>

	<tr>
		<td><fmt:formatNumber type="number" minFractionDigits="3" maxFractionDigits="3" value="${ratioCarrierWithAtLeastOneRequestVersusCarrierWithNoOneRequest}" /></td>
	</tr>
</table>
</div>