
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
<%@taglib prefix="security"	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags"%>


<form:form action="${requestURI }" modelAttribute="messageFolder">
<div class="col-md-8 col-centered">	
	<br>
	<form:hidden path="id" />

<spring:message code="messageFolder.name" var="Edit" />	
	<B><acme:textbox title="${Edit}" path="name"/></B>
	<br />
	
	
	<!-- 	//BOTONES -->
	
	<acme:submit name="save" code="messageFolder.save"/>
	
	<jstl:if test="${messageFolder.id != 0 }">
		<acme:submit_with_on_click code2="messageFolder.confirm.delete"  name="delete" code="messageFolder.delete"/>
	</jstl:if>
	
	<acme:cancel url="${RequestURIcancel}" code="messageFolder.cancel"/>
	<br />
</div>
	
</form:form>