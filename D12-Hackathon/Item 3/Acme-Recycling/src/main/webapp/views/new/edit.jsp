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

<form:form action="${requestURI}" modelAttribute="new">

	<form:hidden path="id" />
<!-- ATRIBUTOS -->

<fieldset>
<B><acme:textbox code="new.title" path="title"/></B>
	<br />
	<B><acme:textbox code="new.content" path="content"/></B>
	<br />
	<B><acme:textbox code="new.creationDate" path="creationDate" readonly="true"/></B>
	<br />
	

	
	<B><acme:textbox code="new.pictures" path="pictures" placeHolder="http://imagen1, http://imagen2"/></B>
	</fieldset>
	<br>
<!-- BOTONES -->

	<input type="submit" name="save" value="<spring:message code="new.save" />" />&nbsp; 

	<acme:cancel
		url="new/editor/list.do?d-16544-p=1"
		code="new.cancel" />
</form:form>