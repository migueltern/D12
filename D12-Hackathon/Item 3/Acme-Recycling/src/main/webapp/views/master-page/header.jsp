<%--
 * header.jsp
 *
 * Copyright (C) 2017 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<div>
	<img src="images/logo.png" alt="Acme-Recycling Co., Inc." />
</div>

<div>
	<ul id="jMenu">
		<!-- Do not forget the "fNiv" class for the first level links !! -->
		<security:authorize access="hasRole('ADMIN')">
			<li><a class="fNiv"><spring:message	code="master.page.administrator" /></a>
				<ul>
					<li class="arrow"></li>
				
				</ul>
			</li>
		</security:authorize>
		
		<security:authorize access="hasRole('CUSTOMER')">
			<li><a class="fNiv"><spring:message	code="master.page.customer" /></a>
				<ul>
					<li class="arrow"></li>
					
				</ul>
			</li>
		</security:authorize>
		
		<security:authorize access="hasRole('RECYCLER')">
			<li><a class="fNiv"><spring:message	code="master.page.opinion" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="opinion/recycler/myList.do?d-16544-p=1"><spring:message code="master.page.opinion.myList" /></a></li>
					<li><a href="opinion/recycler/createOpinableProduct.do"><spring:message code="master.page.opinion.createOpinableProduct" /></a></li>
					<li><a href="opinion/recycler/createOpinableCourse.do"><spring:message code="master.page.opinion.createOpinableCourse" /></a></li>
					
				</ul>
			</li>
		</security:authorize>
		
		<security:authorize access="hasRole('CARRIER')">
			<li><a class="fNiv"><spring:message	code="master.page.messageFolder" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="messageFolder/carrier/list.do?d-16544-p=1"><spring:message code="master.page.messageFolder.myList" /></a></li>
					<li><a href="messageFolder/carrier/create.do"><spring:message code="master.page.messageFolder.create" /></a></li>
				</ul>
			</li>
		</security:authorize>
		
				<security:authorize access="hasRole('MANAGER')">
			<li><a class="fNiv"><spring:message	code="master.page.messageFolder" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="messageFolder/manager/list.do?d-16544-p=1"><spring:message code="master.page.messageFolder.myList" /></a></li>
					<li><a href="messageFolder/manager/create.do"><spring:message code="master.page.messageFolder.create" /></a></li>
				</ul>
			</li>
		</security:authorize>
		
		<security:authorize access="isAnonymous()">
			<li><a class="fNiv" href="security/login.do"><spring:message code="master.page.login" /></a></li>
		</security:authorize>
		
		<security:authorize access="isAuthenticated()">
			<li>
				<a class="fNiv"> 
					<spring:message code="master.page.profile" /> 
			        (<security:authentication property="principal.username" />)
				</a>
				<ul>
					<li class="arrow"></li>
					
					<li><a href="j_spring_security_logout"><spring:message code="master.page.logout" /> </a></li>
				</ul>
			</li>
		</security:authorize>
	</ul>
</div>

<div>
	<a href="?language=en">en</a> | <a href="?language=es">es</a>
</div>

