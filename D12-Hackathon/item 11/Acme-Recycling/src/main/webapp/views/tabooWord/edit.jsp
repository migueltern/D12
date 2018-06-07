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
<div class="col-md-8 col-centered">	
<form:form action="tabooWord/admin/edit.do" modelAttribute="tabooWord">
<br>
	<form:hidden path="id" />
	<form:hidden path="version" />
	
<spring:message code="Name" var="Edit" />
	<B><acme:textbox title="${Edit}" path="name"/></B>
	<br />
			
	

<!-- 	//BOTONES -->
	
	<acme:submit name="save" code="tabooWord.save"/>
	
	<jstl:if test="${tabooWord.id != 0 }">
	 	<acme:submit_with_on_click name="delete" code="tabooWord.delete" code2="tabooWord.confirm.delete"/>
	</jstl:if>
	
	<acme:cancel url="configurationSystem/admin/tabooWord/list.do?d-16544-p=1" code="tabooWord.cancel"/>
	<br />
</form:form>
</div>