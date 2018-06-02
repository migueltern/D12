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

<form:form action="${requestURI}" modelAttribute="comment">

	<form:hidden path="id" />
	<form:hidden path="version" />
	<form:hidden path="commentTo" />
	<form:hidden path="replys" />
	
<!-- ATRIBUTOS -->
<br>
<div class="col">
 <div class="form-row">
 	  <div class="form-group col-md-6">
 	  <B><acme:textbox code="comment.createdMoment" path="createdMoment" readonly="true"/></B>

</div>

	<div class="form-group col-md-6">
<spring:message code="comment.body" var="Edit" />
		<B><acme:textbox title="${Edit}" path="body"/></B>
</div>
</div>
</div>
	
<!-- BOTONES -->

	
	<acme:submit name="save" code="comment.save"/>
<jstl:if test="${comment.id != 0}">
		<input type="submit" name="delete" class="btn btn-danger"
			value="<spring:message code="comment.delete" />"
			onclick="javascript: return confirm('<spring:message code="comment.confirm.delete" />')" />&nbsp;
</jstl:if>
	
	<acme:cancel
		url="comment/recycler/list.do?d-16544-p=1"
		code="comment.cancel" />
</form:form>
