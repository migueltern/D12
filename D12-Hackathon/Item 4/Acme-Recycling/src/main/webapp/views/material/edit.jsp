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
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<form:form action="${requestURI}" modelAttribute="material">

	<form:hidden path="id" />
	<form:hidden path="version" />
	<form:hidden path="buys"/>
	<form:hidden path="totalPrice"/>

<br>
	<!-- ATRIBUTOS -->
	<div class="col">
	<B><acme:textbox code="material.title" path="title" /></B>
	</div>
<br>
<div class="col">
 <div class="form-row">
 	  <div class="form-group col-md-6">
	<B><acme:textbox code="material.description" path="description" /></B>
</div>
	<br />
	<div class="form-group col-md-6">
	<B><acme:textbox code="material.unitPrice" path="unitPrice" /></B>
</div>
</div>
</div>


 <div class="col">
	<B><acme:select items="${labelMaterials }" itemLabel="name" code="material.labelMaterial" path="labelMaterial"/></B>

</div>
	<br />
	
	<div class="col">
	<B><acme:textbox code="material.quantity" path="quantity" /></B>
</div>
<br>

	

	<!-- BOTONES -->
<acme:submit name="save" code="material.save" />
	 

	<acme:cancel url="material/admin/list.do?d-16544-p=1"
		code="material.cancel" />
</form:form>
