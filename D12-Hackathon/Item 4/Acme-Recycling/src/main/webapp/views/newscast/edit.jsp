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

<form:form action="${requestURI}" modelAttribute="newscast">
<form:hidden path="id" />
<form:hidden path="version" />
<form:hidden path="comments" />
<div class="col-md-8 col-centered">
	<br>
<!-- ATRIBUTOS -->


	<div class="col">

<B><acme:textbox code="new.creationDate" path="creationDate" readonly="true" /></B>
</div>
	
<div class="col">
 <div class="form-row">
 	  <div class="form-group col-md-6">
 	<spring:message code="Title" var="Edit" /> 
<B><acme:textbox title="${Edit}" path="title"/></B>
</div>

	<div class="form-group col-md-6">
<spring:message code="Content" var="Edit" />	
<B><acme:textbox title="${Edit}" path="content"/></B>
</div>
</div>
</div>

<div class="col">
<spring:message code="Pictures" var="Edit" />
<B><acme:textbox title="${Edit}" path="pictures" placeHolder="http://imagen1, http://imagen2"/></B>
</div>



	<br>
<!-- BOTONES -->

<acme:submit name="save" code="new.save"/>
	

	<jstl:if test="${newscast.id != 0}">
		<input type="submit" name="delete" class="btn btn-danger"
			value="<spring:message code="new.delete" />"
			onclick="javascript: return confirm('<spring:message code="new.confirm.delete" />')" />&nbsp;
	</jstl:if>

	<acme:cancel
		url="newscast/editor/list.do?d-16544-p=1"
		code="new.cancel" />
</div>
</form:form>
