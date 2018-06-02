<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<%@ taglib prefix="acme" tagdir="/WEB-INF/tags"%>
<div class="col-md-6 col-centered">
	<div class="well bs-component">
		<form:form action="${requestURI}" modelAttribute="m">
		
			<br>

			<jstl:if test="${show}">

				<acme:select code="message.sendTo" path="recipient"
					items="${actors}" itemLabel="userAccount.username" />
			</jstl:if>
			
			<acme:textbox code="message.moment" path="moment" readonly="true"/>
			<br>
			
			<acme:selectPriority code="message.priority" path="priority"/>
			
			<br />
			<br />	
					
			<jstl:if test="${m.recipient != null}">
				<form:hidden path="recipient" />
			</jstl:if>

<spring:message code="message.subject" var="Edit" />
			<acme:textbox title="${Edit}"  path="subject" />
			<br />	
	
<spring:message code="message.body" var="Edit" />		
			<acme:textbox title="${Edit}" path="body" />
			<br />  
			

			<acme:submit name="send" code="message.send.link"/>
			<acme:cancel url="${RequestURICancel}" code="message.cancel.link"/>


<br />  
		</form:form>
	</div>
</div>