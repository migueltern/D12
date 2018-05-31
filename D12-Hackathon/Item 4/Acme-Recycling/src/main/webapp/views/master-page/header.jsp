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

	<div class="collapse navbar-collapse" id="navbarColor01" >
		<ul class = "navbar-nav mr-auto">
		
<!-- 		PARA TODOS -->
		<security:authorize access="isAuthenticated()">
						
		<a class="nav-link" >	
		<spring:message
						code="master.page.profile" /> (<security:authentication
						property="principal.username" />)
		</a>
		<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle transform" data-toggle="dropdown">  </a>
					<div class="dropdown-menu" x-placement="bottom-start"
						style="position: absolute; transform: translate3d(0px, 40px, 0px); top: 0px; left: 0px; will-change: transform;">
						<a class="dropdown-item" href="j_spring_security_logout"><spring:message
							code="master.page.logout" /></a>
						
					</div></li>
		
		</security:authorize>
		
		<!-- PARA LOS NO AUTENTICADOS -->
		<security:authorize access="isAnonymous()">
			<li class="nav-item transform">
		
		<li class="nav-item transform"> 
					<a class="nav-link" href="security/login.do">
					
					<spring:message code="master.page.login" />
					</a>

				</li>
				
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
					
					
					
		<li class="nav-item transform"> 
					<a class="nav-link" href="newscast/list.do?d-16544-p=1">
					
					<spring:message code="master.page.New.list" />
					</a>

				</li>
				
				
		<li class="nav-item transform"> 
					<a class="nav-link" href="material/list.do?d-16544-p=1">
					
					<spring:message code="master.page.admin.material.list" />
					</a>

				</li>
				
		
		<li class="nav-item transform"> 
					<a class="nav-link" href="recycler/list.do?d-16544-p=1">
					
					<spring:message code="master.page.recycler.list" />
					</a>

				</li>
				
		<li class="nav-item transform"> 
					<a class="nav-link" href="course/list.do?d-16544-p=1">
					
					<spring:message code="master.page.course.listAll" />
					</a>

				</li>
				
		<li class="nav-item transform"> 
					<a class="nav-link" href="welcome/aboutUs.do">
					
					<spring:message code="master.page.aboutUs" />
					</a>

				</li>
				
		<li class="nav-item transform"> 
					<a class="nav-link" href="legislation/list.do?d-16544-p=1">
					
					<spring:message code="master.page.administrator.legislation" />
					</a>

				</li>
				
	</security:authorize>				



	<security:authorize access="hasRole('ADMIN')">
	
	
	<a class="nav-link" >	
		<spring:message code="master.page.administrator"></spring:message>
		</a>
		<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle transform" data-toggle="dropdown">  </a>
					<div class="dropdown-menu" x-placement="bottom-start"
						style="position: absolute; transform: translate3d(0px, 40px, 0px); top: 0px; left: 0px; will-change: transform;">
						<a class="dropdown-item" href="profile/admin/edit.do"><spring:message
							code="master.page.buyer.edit" /></a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="profile/admin/display.do"><spring:message
								code="master.page.buyer.profile" /></a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="admin/dashboard.do"><spring:message
								code="master.page.statistics" /></a>
					</div></li>
					
		
		<a class="nav-link" >	
		<spring:message code="master.page.responsabilidades"></spring:message>
		</a>
		<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle transform" data-toggle="dropdown">  </a>
					<div class="dropdown-menu" x-placement="bottom-start"
						style="position: absolute; transform: translate3d(0px, 40px, 0px); top: 0px; left: 0px; will-change: transform;">
						<a class="dropdown-item" href="course/admin/list.do?d-16544-p=1"><spring:message
							code="master.page.course.list" /></a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="cleanPoint/admin/list.do?d-16544-p=1"><spring:message
								code="master.page.administrator.cleanPoints" /></a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="material/admin/list.do?d-16544-p=1"><spring:message
								code="master.page.admin.material.list" /></a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="actor/admin/list.do?d-16544-p=1"><spring:message
								code="master.page.ban" /></a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="recycler/list.do?d-16544-p=1"><spring:message
								code="master.page.recycler" /></a>
					</div></li>
	
	<a class="nav-link" >	
		<spring:message code="master.page.administrator.register"></spring:message>
		</a>
		<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle transform" data-toggle="dropdown">  </a>
					<div class="dropdown-menu" x-placement="bottom-start"
						style="position: absolute; transform: translate3d(0px, 40px, 0px); top: 0px; left: 0px; will-change: transform;">
						<a class="dropdown-item" href="carrier/admin/create.do"><spring:message
							code="master.page.admin.carrier.edit" /></a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="manager_/admin/create.do"><spring:message
								code="master.page.admin.manager.edit" /></a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="editor/admin/create.do"><spring:message
								code="master.page.admin.editor.edit" /></a>
					</div></li>
					
		
	<a class="nav-link" >	
		<spring:message code="master.page.messageFolder"></spring:message>
		</a>
		<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle transform" data-toggle="dropdown">  </a>
					<div class="dropdown-menu" x-placement="bottom-start"
						style="position: absolute; transform: translate3d(0px, 40px, 0px); top: 0px; left: 0px; will-change: transform;">
						<a class="dropdown-item" href="messageFolder/admin/list.do?d-16544-p=1"><spring:message
							code="master.page.messageFolder.myList" /></a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="messageFolder/admin/create.do"><spring:message
								code="master.page.messageFolder.create" /></a>
					</div></li>
	
		
		<li class="nav-item transform"> 
					<a class="nav-link" href="message/admin/send.do">
					
					<spring:message code="master.page.message.send" />
					</a>

				</li>
				
				
		
		<a class="nav-link" >	
		<spring:message code="master.page.administrator.configurationSystem"></spring:message>
		</a>
		<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle transform" data-toggle="dropdown">  </a>
					<div class="dropdown-menu" x-placement="bottom-start"
						style="position: absolute; transform: translate3d(0px, 40px, 0px); top: 0px; left: 0px; will-change: transform;">
						<a class="dropdown-item" href="configurationSystem/admin/tabooWord/list.do?d-16544-p=1"><spring:message
							code="master.page.administrator.tabooWords" /></a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="configurationSystem/admin/legislation/list.do?d-16544-p=1"><spring:message
								code="master.page.administrator.legislation" /></a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="configurationSystem/admin/edit.do"><spring:message
								code="master.page.administrator.configurationSystem.edit" /></a>
					</div></li>
					
			
			
			<a class="nav-link" >	
		<spring:message code="master.page.tabooWord"></spring:message>
		</a>
		<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle transform" data-toggle="dropdown">  </a>
					<div class="dropdown-menu" x-placement="bottom-start"
						style="position: absolute; transform: translate3d(0px, 40px, 0px); top: 0px; left: 0px; will-change: transform;">
						<a class="dropdown-item" href="newscast/admin/list.do?d-16544-p=1"><spring:message
							code="master.page.news.tabooWord" /></a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="incidence/admin/list.do?d-16544-p=1"><spring:message
								code="master.page.incidence" /></a>
						
					</div></li>
					
					
			
			<li class="nav-item transform"> 
					<a class="nav-link" href="welcome/aboutUs.do">
					
					<spring:message code="master.page.aboutUs" />
					</a>

				</li>
				
				
			
			<a class="nav-link" >	
		<spring:message code="master.page.opinion"></spring:message>
		</a>
		<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle transform" data-toggle="dropdown">  </a>
					<div class="dropdown-menu " x-placement="bottom-start"
						style="position: absolute; transform: translate3d(0px, 40px, 0px); top: 0px; left: 0px; will-change: transform;">
						<a class="dropdown-item" href="opinion/actor/myListOpinionItem.do?d-16544-p=1"><spring:message
							code="master.page.opinion.myListOpinionProduct" /></a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="opinion/actor/createOpinableItem.do"><spring:message
								code="master.page.opinion.createOpinableProduct" /></a>
						
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