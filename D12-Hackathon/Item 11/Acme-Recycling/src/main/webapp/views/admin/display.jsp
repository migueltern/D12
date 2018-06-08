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
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<display:table name="admin" class="displaytag "
  requestURI="${requestURI}" id="row" >
  
  <!-- Attributes -->
	
	<display:column>
	<p>
	<B><spring:message code="admin.name" /></B>
	<jstl:out value="${row.name}"></jstl:out>
	
	</p>
	<p>
		<B><spring:message code="admin.surname" /></B>
		<jstl:out value="${row.surname}"></jstl:out>
	</p>
	<p>
		<B><spring:message code="admin.phoneNumber" /></B>
		<jstl:out value="${row.phone}"></jstl:out>
	</p>
	<p>
		<B><spring:message code="admin.emailAddress" /></B>
		<jstl:out value="${row.email}"></jstl:out>
	</p>
		<p>
		<B><spring:message code="admin.postalAddress" /></B>
		<jstl:out value="${row.address}"></jstl:out>
	</p>
	<p>
		<B><spring:message code="admin.province" /></B>
		<jstl:out value="${row.province}"></jstl:out>
	</p>
	
	
</display:column>
  
</display:table>
