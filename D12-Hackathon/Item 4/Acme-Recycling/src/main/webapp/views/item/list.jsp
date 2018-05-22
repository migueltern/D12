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


<script type="text/javascript">
	function confirmDelete(itemId) {
		confirm=confirm('<spring:message code="item.confirm.delete"/>');
		if (confirm)
		  window.location.href ="item/recycler/delete.do?itemId=" + itemId;
		  else
			  window.location.href ="item/recycler/list.do";
	}
</script>

<security:authorize access="hasRole('RECYCLER')">
<%-- <jstl:if test="${showScore}">
<h2><spring:message code="item.score" /></h2>
</jstl:if> --%>
</security:authorize>
<!-- Listing messageFodler -->
<display:table name="items" id="row" requestURI="${requestURI}"
	pagesize="5" class="displaytag">
	
	<!-- Attributes -->

	<acme:column code="item.title" property="title" sortable ="true"/>
	
	<spring:message code="message.format.date" var="pattern"></spring:message>
	<spring:message code="item.publicationMoment" var="postedHeader" />
	<display:column property="publicationMoment" title="${postedHeader}"
		sortable="true" format="${pattern}" />
	
	<acme:column code="item.quantity" property="quantity" sortable ="true"/>
	
	<acme:column code="item.value" property="value" sortable ="true"/>
	
	<acme:column code="item.labelProduct" property="labelProduct.name" sortable ="true"/>
	
	
	<jstl:if test="${showDelete}">
 	<spring:message code="item.delete" var="deleteHeader" />
		<display:column title="${deleteHeader}" sortable="true">
			<input type="button" name="delete"
				value="<spring:message code="item.delete" />"
				onclick="confirmDelete(${row.id});" />
	</display:column>
	</jstl:if>
	
	
	


</display:table>



