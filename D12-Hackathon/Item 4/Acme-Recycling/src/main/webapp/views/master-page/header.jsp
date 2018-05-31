<%--
 * header.jsp
 *
 * Copyright (C) 2017 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>

<div>
	<img src="${bannerURL}" class="img-fluid" alt="Acme-Recycling Co., Inc." />
</div>


<nav class="navbar navbar-expand-md navbar-light font-weight-bold text_menu" style="background-color: #F5F5F5">

	<div class="collapse navbar-collapse" id="navbarColor01">
		<ul class = "navbar-nav mr-auto">
		
		<security:authorize access="isAnonymous()">
			<li class="nav-item transform">
			
			<a class="nav-link" >
			
			
			<spring:message code="master.page.logout"></spring:message>
			</a>
			</li>
		
		
		
		
		
		<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle transform" data-toggle="dropdown">  </a>
					<div class="dropdown-menu" x-placement="bottom-start"
						style="position: absolute; transform: translate3d(0px, 40px, 0px); top: 0px; left: 0px; will-change: transform;">
						<a class="dropdown-item" href="profile/display.do"><%-- <spring:message
								code="master.page.profile.display" /> --%><spring:message
							code="master.page.profile" /></a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="j_spring_security_logout"><spring:message
								code="master.page.logout" /></a>
					</div></li>
				
		<a class="nav-link" >	
		<spring:message code="master.page.register"></spring:message>
		</a>
		<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle transform" data-toggle="dropdown">  </a>
					<div class="dropdown-menu" x-placement="bottom-start"
						style="position: absolute; transform: translate3d(0px, 40px, 0px); top: 0px; left: 0px; will-change: transform;">
						<a class="dropdown-item" href="recycler/create.do"><spring:message
							code="master.page.recycler.register" /></a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="buyer/create.do"><spring:message
								code="master.page.buyer.register" /></a>
					</div></li>
					
	</security:authorize>				

			</ul>
	
	</div>
</nav>
							

<div>
	<a href="?language=en">en</a> | <a href="?language=es">es</a>
</div>
<br>
	<div class="text-center">
<font size="6" color="green" face="Georgia"><B><jstl:out
			value="${Name}"></jstl:out></B></font>

<spring:message code="master.page.new" var="newLanguage" />
<jstl:choose>
	<jstl:when test="${newLanguage == 'Newscasts'}">
		<br>
		<br>
		<i><jstl:out value="${EnglishWelcomeMessage}"></jstl:out></i>
		<br>
		<br>
		<br>
		
	</jstl:when>

	<jstl:when test="${newLanguage == 'Noticias'}">
		<br>
		<br>
		<i><jstl:out value="${SpanishWelcomeMessage}"></jstl:out></i>
		<br>
		<br>
		<br>
	</jstl:when>
</jstl:choose>
</div>