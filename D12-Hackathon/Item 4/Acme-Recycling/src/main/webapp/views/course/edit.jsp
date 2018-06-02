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
<form:form action="course/buyer/edit.do" modelAttribute="course">

<br>
<form:hidden path="id" />
<form:hidden path="version" />



<div class="col">
 <div class="form-row">
 	  <div class="form-group col-md-6">
<spring:message code="course.title" var="Edit" />
	<B><acme:textbox title="${Edit}" path="title"/></B>

</div>

	<div class="form-group col-md-6">	
<spring:message code="course.realisedMoment" var="Edit" />
	<B><acme:textbox title="${Edit}" path="realisedMoment" id="datepicker" placeHolder="yyyy/MM/dd"/></B>
</div>
</div>
</div>
	

	
<div class="col">
 <div class="form-row">
 	  <div class="form-group col-md-6">
	<B><acme:booleanselect code="course.draftMode" path="draftMode"/></B>

</div>

	<div class="form-group col-md-6">	
	<B><acme:selectmultiple items="${materials}" itemLabel="title" code="course.materials" path="materials"/></B>
</div>
</div>
</div>

<br>
<div class="col">
 <div class="form-row">
 	  <div class="form-group col-md-6">
<spring:message code="course.minimumScore" var="Edit" />
	<B><acme:textbox title="${Edit}" path="minimumScore"/></B>
</div>

	<div class="form-group col-md-6">
	
	
<spring:message code="course.description" var="Edit" />
	<acme:textbox title="${Edit}" path="description" />
	
</div>
</div>
</div>
	

	
<div class="col">
	<B><jstl:out value="GPS"></jstl:out></B>
	</div>
<div class="col">	
<br>
<spring:message code="cleanPoint.GPS.name" var="Edit" /> 
	<B><acme:textbox title="${Edit}" path="location.name"/></B>
</div>
<br>
	<div class="col">
 <div class="form-row">
 	  <div class="form-group col-md-6">
 	
	<B><acme:textbox2 code="cleanPoint.GPS.latitude" path="location.latitude" /></B>
</div>

	<div class="form-group col-md-6">	
	<B><acme:textbox2 code="cleanPoint.GPS.longitude" path="location.longitude"/></B>
</div>
</div>
</div>


<br>
<acme:submit name="save" code="course.save"/>

	<jstl:if test="${course.id !=0 }">
			<acme:submit_with_on_click name="delete" code="course.delete" code2="course.confirm.delete"/>
			
			
			
	</jstl:if>
	
<acme:cancel url="course/buyer/list.do?d-16544-p=1"	code="course.cancel" />


</form:form>
</div>



<script type="text/javascript">
$( function() {
    $( "#datepicker" ).datepicker({ 
    	dateFormat: 'yy/mm/dd', 
    	firstDay: 1
    	});

  } );
 </script>