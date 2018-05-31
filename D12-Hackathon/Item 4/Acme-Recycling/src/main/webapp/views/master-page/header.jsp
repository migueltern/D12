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
<br>
<div>
	<img src="${bannerURL}"  class="center" alt="Acme-Recycling Co., Inc."   />
</div>

<br>
<nav class="navbar navbar-expand-md navbar-light font-weight-bold " style="background-color: #F5F5F5">

	<div class="collapse navbar-collapse " id="navbarColor01" >
		<ul class = "navbar-nav mr-auto">
		
<!-- 		PARA TODOS -->
		<security:authorize access="isAuthenticated()">
		
		<li class="nav-item dropdown ">
         	 	<a class="nav-link dropdown-toggle transform" data-toggle="dropdown"><spring:message code="master.page.profile" /> (<security:authentication property="principal.username" />)<span class="caret"></span></a>
          	<ul class="dropdown-menu" x-placement="bottom-start">
           	 	<li><a class="dropdown-item" href="j_spring_security_logout"><spring:message
							code="master.page.logout" /></a></li>
          		</ul>
       		</li>
       		
		</security:authorize>
		
		
		
		<!-- PARA LOS NO AUTENTICADOS -->
		<security:authorize access="isAnonymous()">
			<li class="nav-item transform">
		
		<li class="nav-item transform"> 
					<a class="nav-link" href="security/login.do">
					
					<spring:message code="master.page.login" />
					</a>

				</li>
				
		
			<li class="nav-item dropdown">
         	 	<a href="#" class="nav-link dropdown-toggle transform" data-toggle="dropdown"><spring:message code="master.page.register"></spring:message><span class="caret"></span></a>
          	<ul class="dropdown-menu" x-placement="bottom-start">
           	 	<li><a class="dropdown-item" href="recycler/create.do"><spring:message
							code="master.page.recycler.register" /></a></li>
           	 	<li><a class="dropdown-item" href="buyer/create.do"><spring:message
								code="master.page.buyer.register" /></a></li>
          		</ul>
       		</li>
					
					
					
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

		
			<li class="nav-item dropdown">
         	 	<a href="#" class="nav-link dropdown-toggle transform" data-toggle="dropdown"><spring:message code="master.page.administrator"></spring:message><span class="caret"></span></a>
          	<ul class="dropdown-menu" x-placement="bottom-start">
           	 	<li><a class="dropdown-item" href="profile/admin/edit.do"><spring:message
							code="master.page.buyer.edit" /></a></li>
           	 	<li><a class="dropdown-item" href="profile/admin/display.do"><spring:message
								code="master.page.buyer.profile" /></a></li>
				<li><a class="dropdown-item" href="admin/dashboard.do"><spring:message
								code="master.page.statistics" /></a></li>
          		</ul>
       		</li>
       		
		
	
	
	
	<li class="nav-item dropdown">

         	 	<a href="#" class="nav-link dropdown-toggle transform" data-toggle="dropdown"><spring:message code="master.page.responsabilidades"></spring:message><span class="caret"></span></a>
          	<ul class="dropdown-menu" x-placement="bottom-start">
           	 	<li><a class="dropdown-item" href="course/admin/list.do?d-16544-p=1"><spring:message
							code="master.page.course.list" /></a></li>
           	 	<li><a class="dropdown-item" href="cleanPoint/admin/list.do?d-16544-p=1"><spring:message
								code="master.page.administrator.cleanPoints" /></a></li>
				<li><a class="dropdown-item" href="material/admin/list.do?d-16544-p=1"><spring:message
								code="master.page.admin.material.list" /></a></li>
				<li><a class="dropdown-item" href="actor/admin/list.do?d-16544-p=1"><spring:message
								code="master.page.ban" /></a></li>
				<li><a class="dropdown-item" href="recycler/list.do?d-16544-p=1"><spring:message
								code="master.page.recycler" /></a></li>				
				
          		</ul>
       		</li>
      		
       		
       <li class="nav-item dropdown">
         	 	<a href="#" class="nav-link dropdown-toggle transform" data-toggle="dropdown"><spring:message code="master.page.administrator.register"></spring:message><span class="caret"></span></a>
          	<ul class="dropdown-menu" x-placement="bottom-start">
           	 	<li><a class="dropdown-item" href="carrier/admin/create.do"><spring:message
							code="master.page.admin.carrier.edit" /></a></li>
           	 	<li><a class="dropdown-item" href="manager_/admin/create.do"><spring:message
								code="master.page.admin.manager.edit" /></a></li>
				<li><a class="dropdown-item" href="editor/admin/create.do"><spring:message
								code="master.page.admin.editor.edit" /></a></li>
          		</ul>
       		</li>
	
	
	
	
	<li class="nav-item dropdown">
         	 	<a href="#" class="nav-link dropdown-toggle transform" data-toggle="dropdown">
         	 	<spring:message code="master.page.mensajes"></spring:message><span class="caret"></span></a>
          	<ul class="dropdown-menu" x-placement="bottom-start">
           	 	<li><a class="dropdown-item" href="messageFolder/admin/list.do?d-16544-p=1"><spring:message
							code="master.page.messageFolder.myList" /></a></li>
				<li><a class="dropdown-item" href="messageFolder/admin/create.do"><spring:message
								code="master.page.messageFolder.create" /></a></li>
				<li><a class="dropdown-item" href="message/admin/send.do"><spring:message
								code="master.page.message.send" /></a></li>
          		</ul>
       		</li>
		
			
			
		<li class="nav-item dropdown">
         	 	<a href="#" class="nav-link dropdown-toggle transform" data-toggle="dropdown"><spring:message code="master.page.administrator.configurationSystem"></spring:message><span class="caret"></span></a>
          	<ul class="dropdown-menu" x-placement="bottom-start">
           	 	<li><a class="dropdown-item" href="configurationSystem/admin/tabooWord/list.do?d-16544-p=1"><spring:message
							code="master.page.administrator.tabooWords" /></a></li>
           	 	<li><a class="dropdown-item" href="configurationSystem/admin/legislation/list.do?d-16544-p=1"><spring:message
								code="master.page.administrator.legislation" /></a></li>
				<li><a class="dropdown-item" href="configurationSystem/admin/edit.do"><spring:message
								code="master.page.administrator.configurationSystem.edit" /></a></li>
          		</ul>
       		</li>
			
					
			
			
		<li class="nav-item dropdown">
         	 	<a href="#" class="nav-link dropdown-toggle transform" data-toggle="dropdown">
         	 	<spring:message code="master.page.tabooWord"></spring:message><span class="caret"></span></a>
          	<ul class="dropdown-menu" x-placement="bottom-start">
           	 	<li><a class="dropdown-item" href="newscast/admin/list.do?d-16544-p=1"><spring:message
							code="master.page.news.tabooWord" /></a></li>
           	 	<li><a class="dropdown-item" href="incidence/admin/list.do?d-16544-p=1"><spring:message
								code="master.page.incidence" /></a></li>
          		</ul>
       		</li>		
			
			<li class="nav-item transform"> 
					<a class="nav-link" href="welcome/aboutUs.do">
					
					<spring:message code="master.page.aboutUs" />
					</a>

				</li>
				
				
		<li class="nav-item dropdown">
         	 	<a href="#" class="nav-link dropdown-toggle transform" data-toggle="dropdown">
         	 	<spring:message code="master.page.opinion"></spring:message><span class="caret"></span></a>
          	<ul class="dropdown-menu" x-placement="bottom-start">
           	 	<li><a class="dropdown-item" href="opinion/actor/myListOpinionItem.do?d-16544-p=1"><spring:message
							code="master.page.opinion.myListOpinionProduct" /></a></li>
           	 	<li><a class="dropdown-item" href="opinion/actor/createOpinableItem.do"><spring:message
								code="master.page.opinion.createOpinableProduct" /></a></li>
          		</ul>
       		</li>
       		
	</security:authorize>


		<!-- PARA EL RECICLADOR -->

<security:authorize access="hasRole('RECYCLER')">
			<li class="nav-item dropdown">
         	 	<a href="#" class="nav-link dropdown-toggle transform" data-toggle="dropdown">
         	 	<spring:message code="master.page.recycler.recyler1"></spring:message><span class="caret"></span></a>
          	<ul class="dropdown-menu" x-placement="bottom-start">
           	 	<li><a class="dropdown-item" href="profile/recycler/edit.do"><spring:message
							code="master.page.recycler.edit" /></a></li>
           	 	<li><a class="dropdown-item" href="profile/recycler/display.do"><spring:message
								code="master.page.recycler.profile" /></a></li>
				
          		</ul>
       		</li>


			
			
			<li class="nav-item dropdown">
         	 	<a href="#" class="nav-link dropdown-toggle transform" data-toggle="dropdown">
         	 	<spring:message code="master.page.mensajes"></spring:message><span class="caret"></span></a>
          	<ul class="dropdown-menu" x-placement="bottom-start">
           	 	<li><a class="dropdown-item" href="messageFolder/recycler/list.do?d-16544-p=1"><spring:message
							code="master.page.messageFolder.myList" /></a></li>
							
           	 	<li><a class="dropdown-item" href="messageFolder/recycler/create.do"><spring:message
								code="master.page.messageFolder.create" /></a></li>
								
							
           	 	<li><a class="dropdown-item" href="message/recycler/send.do"><spring:message
								code="master.page.message.send" /></a></li>
          		</ul>
       		</li>
		


		<li class="nav-item dropdown">
         	 	<a href="#" class="nav-link dropdown-toggle transform" data-toggle="dropdown">
         	 	<spring:message code="master.page.comment"></spring:message><span class="caret"></span></a>
          	<ul class="dropdown-menu" x-placement="bottom-start">
           	 	<li><a class="dropdown-item" href="comment/recycler/list.do?d-16544-p=1"><spring:message
							code="master.page.comment.myList" /></a></li>
           	 	<li><a class="dropdown-item" href="newscast/recycler/list.do?d-16544-p=1"><spring:message
								code="master.page.new.create.comment" /></a></li>
          		</ul>
       		</li>
       		
       		
       	<li class="nav-item dropdown">
         	 	<a href="#" class="nav-link dropdown-toggle transform" data-toggle="dropdown">
         	 	<spring:message code="master.page.item"></spring:message><span class="caret"></span></a>
          	<ul class="dropdown-menu" x-placement="bottom-start">
           	 	<li><a class="dropdown-item" href="item/recycler/list.do?d-16544-p=1"><spring:message
							code="master.page.item.myList" /></a></li>
           	 	<li><a class="dropdown-item" href="item/recycler/create.do"><spring:message
								code="master.page.item.create" /></a></li>
          		</ul>
       		</li>
       		
       		
       	<li class="nav-item dropdown">
         	 	<a href="#" class="nav-link dropdown-toggle transform" data-toggle="dropdown">
         	 	<spring:message code="master.page.incidence"></spring:message><span class="caret"></span></a>
          	<ul class="dropdown-menu" x-placement="bottom-start">
           	 	<li><a class="dropdown-item" href="incidence/recycler/list.do?d-16544-p=1"><spring:message
							code="master.page.incidence.myList" /></a></li>
           	 	<li><a class="dropdown-item" href="incidence/recycler/create.do"><spring:message
								code="master.page.incidence.create" /></a></li>
          		</ul>
       		</li>
       		
       
       
      	 <li class="nav-item dropdown">
         	 	<a href="#" class="nav-link dropdown-toggle transform" data-toggle="dropdown">
         	 	<spring:message code="master.page.course"></spring:message><span class="caret"></span></a>
          	<ul class="dropdown-menu" x-placement="bottom-start">
           	 	<li><a class="dropdown-item" href="course/recycler/listCoursesAvailables.do?d-16544-p=1"><spring:message
							code="master.page.course.listCoursesAvailables" /></a></li>
           	 	<li><a class="dropdown-item" href="course/recycler/listOfCoursesThatIAttend.do?d-16544-p=1"><spring:message
								code="master.page.course.listOfCoursesThatIAttend" /></a></li>
          		</ul>
       		</li>
       
      
    	  <li class="nav-item transform"> 
					<a class="nav-link" href="recycler/list.do?d-16544-p=1">
					
					<spring:message code="master.page.recycler.list" />
					</a>

				</li>
				
				
		 <li class="nav-item dropdown">
         	 	<a href="#" class="nav-link dropdown-toggle transform" data-toggle="dropdown">
         	 	<spring:message code="master.page.opinion"></spring:message><span class="caret"></span></a>
          	<ul class="dropdown-menu" x-placement="bottom-start">
           	 	<li><a class="dropdown-item" href="opinion/actor/myListOpinionItem.do?d-16544-p=1"><spring:message
							code="master.page.opinion.myListOpinionProduct" /></a></li>
           	 	<li><a class="dropdown-item" href="opinion/actor/myListOpinionCourse.do?d-16544-p=1"><spring:message
								code="master.page.opinion.myListOpinionCourse" /></a></li>
				
				<li><a class="dropdown-item" href="opinion/actor/createOpinableItem.do"><spring:message
								code="master.page.opinion.createOpinableProduct" /></a></li>
								
				<li><a class="dropdown-item" href="opinion/actor/createOpinableCourse.do"><spring:message
								code="master.page.opinion.createOpinableCourse" /></a></li>
          		</ul>
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



<security:authorize access="hasRole('BUYER')">


		<li class="nav-item dropdown">
         	 	<a href="#" class="nav-link dropdown-toggle transform" data-toggle="dropdown">
         	 	<spring:message code="master.page.buyer.buyer1"></spring:message><span class="caret"></span></a>
          	<ul class="dropdown-menu" x-placement="bottom-start">
          	
           	 	<li><a class="dropdown-item" href="profile/buyer/edit.do"><spring:message
							code="master.page.buyer.edit" /></a></li>
							
           	 	<li><a class="dropdown-item" href="profile/buyer/display.do"><spring:message
								code="master.page.buyer.profile" /></a></li>
				
          		</ul>
       		</li>


		<li class="nav-item dropdown">
         	 	<a href="#" class="nav-link dropdown-toggle transform" data-toggle="dropdown">
         	 	<spring:message code="master.page.mensajes"></spring:message><span class="caret"></span></a>
          	<ul class="dropdown-menu" x-placement="bottom-start">
          	
           	 	<li><a class="dropdown-item" href="messageFolder/buyer/list.do?d-16544-p=1"><spring:message
							code="master.page.messageFolder.myList" /></a></li>
							
           	 	<li><a class="dropdown-item" href="messageFolder/buyer/create.do"><spring:message
								code="master.page.messageFolder.create" /></a></li>
								
           	 	<li><a class="dropdown-item" href="message/buyer/send.do"><spring:message
								code="master.page.message.send" /></a></li>
          		</ul>
       		</li>



		<li class="nav-item transform"> 
					<a class="nav-link" href="course/buyer/list.do?d-16544-p=1">
					
					<spring:message code="master.page.buyer.course" />
					</a>

				</li>
				
		
		<li class="nav-item transform"> 
					<a class="nav-link" href="recycler/list.do?d-16544-p=1">
					
					<spring:message code="master.page.recycler.list" />
					</a>

				</li>


		<li class="nav-item dropdown">
         	 	<a href="#" class="nav-link dropdown-toggle transform" data-toggle="dropdown">
         	 	<spring:message code="master.page.opinion"></spring:message><span class="caret"></span></a>
          	<ul class="dropdown-menu" x-placement="bottom-start">
          	
           	 	<li><a class="dropdown-item" href="opinion/actor/myListOpinionItem.do?d-16544-p=1"><spring:message
							code="master.page.opinion.myListOpinionProduct" /></a></li>
							
           	 	<li><a class="dropdown-item" href="opinion/actor/createOpinableItem.do"><spring:message
								code="master.page.opinion.createOpinableProduct" /></a></li>
          		</ul>
       		</li>
       		
       		
       	
       		<li class="nav-item dropdown">
         	 	<a href="#" class="nav-link dropdown-toggle transform" data-toggle="dropdown">
         	 	<spring:message code="master.page.material.buy"></spring:message><span class="caret"></span></a>
          	<ul class="dropdown-menu" x-placement="bottom-start">
          	
           	 	<li><a class="dropdown-item" href="material/buyer/list.do?d-16544-p=1"><spring:message
							code="master.page.material" /></a></li>
							
           	 	<li><a class="dropdown-item" href="buy/buyer/list.do?d-16544-p=1"><spring:message
								code="master.page.miscompras" /></a></li>
								
				<li><a class="dropdown-item" href="finder/buyer/list.do?d-16544-p=1"><spring:message
								code="master.page.finder" /></a></li>
          		</ul>
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


			
<security:authorize access="hasRole('CARRIER')">
		
		<li class="nav-item dropdown">
         	 	<a href="#" class="nav-link dropdown-toggle transform" data-toggle="dropdown">
         	 	<spring:message code="master.page.buyer.carrier1"></spring:message><span class="caret"></span></a>
          	<ul class="dropdown-menu" x-placement="bottom-start">
          	
           	 	<li><a class="dropdown-item" href="profile/carrier/edit.do"><spring:message
							code="master.page.buyer.edit" /></a></li>
							
           	 	<li><a class="dropdown-item" href="profile/carrier/display.do"><spring:message
								code="master.page.buyer.profile" /></a></li>
				
          		</ul>
       		</li>
		
		
		<li class="nav-item dropdown">
         	 	<a href="#" class="nav-link dropdown-toggle transform" data-toggle="dropdown">
         	 	<spring:message code="master.page.mensajes"></spring:message><span class="caret"></span></a>
          	<ul class="dropdown-menu" x-placement="bottom-start">
           	 	<li><a class="dropdown-item" href="messageFolder/carrier/list.do?d-16544-p=1"><spring:message
							code="master.page.messageFolder.myList" /></a></li>
							
           	 	<li><a class="dropdown-item" href="messageFolder/carrier/create.do"><spring:message
								code="master.page.messageFolder.create" /></a></li>
								
							
           	 	<li><a class="dropdown-item" href="message/carrier/send.do"><spring:message
								code="master.page.message.send" /></a></li>
          		</ul>
       		</li>
		
		
		
		<li class="nav-item transform"> 
					<a class="nav-link" href="request/carrier/listMyRequest.do?d-16544-p=1">
					
					<spring:message code="master.page.request.listMyRequest" />
					</a>
				</li>
				
		<li class="nav-item transform"> 
					<a class="nav-link" href="assessment/carrier/listMyAssessment.do?d-16544-p=1">
					
					<spring:message code="master.page.assessment.listMyAssessment" />
					</a>

				</li>
				
				
		<li class="nav-item transform"> 
					<a class="nav-link" href="recycler/list.do?d-16544-p=1">
					
					<spring:message code="master.page.recycler.list" />
					</a>

				</li>
				
				
		<li class="nav-item dropdown">
         	 	<a href="#" class="nav-link dropdown-toggle transform" data-toggle="dropdown">
         	 	<spring:message code="master.page.opinion"></spring:message><span class="caret"></span></a>
          	<ul class="dropdown-menu" x-placement="bottom-start">
          	
           	 	<li><a class="dropdown-item" href="opinion/actor/myListOpinionItem.do?d-16544-p=1"><spring:message
							code="master.page.opinion.myListOpinionProduct" /></a></li>
							
           	 	<li><a class="dropdown-item" href="opinion/actor/createOpinableItem.do"><spring:message
								code="master.page.opinion.createOpinableProduct" /></a></li>
          		</ul>
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


<security:authorize access="hasRole('MANAGER')">

			<li class="nav-item dropdown">
         	 	<a href="#" class="nav-link dropdown-toggle transform" data-toggle="dropdown">
         	 	<spring:message code="master.page.buyer.manager1"></spring:message><span class="caret"></span></a>
          	<ul class="dropdown-menu" x-placement="bottom-start">
          	
           	 	<li><a class="dropdown-item" href="profile/manager/edit.do"><spring:message
							code="master.page.buyer.edit" /></a></li>
							
           	 	<li><a class="dropdown-item" href="profile/manager/display.do"><spring:message
								code="master.page.buyer.profile" /></a></li>
				
          		</ul>
       		</li>


			
			<li class="nav-item dropdown">
         	 	<a href="#" class="nav-link dropdown-toggle transform" data-toggle="dropdown">
         	 	<spring:message code="master.page.mensajes"></spring:message><span class="caret"></span></a>
          	<ul class="dropdown-menu" x-placement="bottom-start">
           	 	<li><a class="dropdown-item" href="messageFolder/manager/list.do?d-16544-p=1"><spring:message
							code="master.page.messageFolder.myList" /></a></li>
							
           	 	<li><a class="dropdown-item" href="messageFolder/manager/create.do"><spring:message
								code="master.page.messageFolder.create" /></a></li>
								
							
           	 	<li><a class="dropdown-item" href="message/manager/send.do"><spring:message
								code="master.page.message.send" /></a></li>
          		</ul>
       		</li>
       		
       		
       		
       		<li class="nav-item dropdown">
         	 	<a href="#" class="nav-link dropdown-toggle transform" data-toggle="dropdown">
         	 	<spring:message code="master.page.request"></spring:message><span class="caret"></span></a>
          	<ul class="dropdown-menu" x-placement="bottom-start">
           	 	<li><a class="dropdown-item" href="request/manager/listItemsNonRequest.do?d-16544-p=1"><spring:message
							code="master.page.request.listItemsNonRequest" /></a></li>
							
           	 	<li><a class="dropdown-item" href="request/manager/listMyRequest.do?d-16544-p=1"><spring:message
								code="master.page.request.listMyRequest" /></a></li>
          		</ul>
       		</li>
       		
       		<li class="nav-item dropdown">
         	 	<a href="#" class="nav-link dropdown-toggle transform" data-toggle="dropdown">
         	 	<spring:message code="master.page.label"></spring:message><span class="caret"></span></a>
          	<ul class="dropdown-menu" x-placement="bottom-start">
           	 	<li><a class="dropdown-item" href="labelMaterial/manager/list.do?d-16544-p=1"><spring:message
							code="master.page.labelMaterial.list" /></a></li>
							
           	 	<li><a class="dropdown-item" href="labelProduct/manager/list.do?d-16544-p=1"><spring:message
								code="master.page.labelProduct.list" /></a></li>
          		</ul>
       		</li>
       		
       		
       		<li class="nav-item dropdown">
         	 	<a href="#" class="nav-link dropdown-toggle transform" data-toggle="dropdown">
         	 	<spring:message code="master.page.incidence"></spring:message><span class="caret"></span></a>
          	<ul class="dropdown-menu" x-placement="bottom-start">
           	 	<li><a class="dropdown-item" href="incidence/manager/list.do?d-16544-p=1"><spring:message
							code="master.page.incidences.listNoResolved" /></a></li>
							
           	 	<li><a class="dropdown-item" href="incidence/manager/listResolved.do?d-16544-p=1"><spring:message
								code="master.page.incidences.listResolved" /></a></li>
          		</ul>
       		</li>
       		
       		<li class="nav-item transform"> 
					<a class="nav-link" href="recycler/list.do?d-16544-p=1">
					
					<spring:message code="master.page.recycler.list" />
					</a>

				</li>
				
				
		<li class="nav-item dropdown">
         	 	<a href="#" class="nav-link dropdown-toggle transform" data-toggle="dropdown">
         	 	<spring:message code="master.page.opinion"></spring:message><span class="caret"></span></a>
          	<ul class="dropdown-menu" x-placement="bottom-start">
          	
           	 	<li><a class="dropdown-item" href="opinion/actor/myListOpinionItem.do?d-16544-p=1"><spring:message
							code="master.page.opinion.myListOpinionProduct" /></a></li>
							
           	 	<li><a class="dropdown-item" href="opinion/actor/createOpinableItem.do"><spring:message
								code="master.page.opinion.createOpinableProduct" /></a></li>
          		</ul>
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

<security:authorize access="hasRole('EDITOR')">


		<li class="nav-item dropdown">
         	 	<a href="#" class="nav-link dropdown-toggle transform" data-toggle="dropdown">
         	 	<spring:message code="master.page.buyer.editor1"></spring:message><span class="caret"></span></a>
          	<ul class="dropdown-menu" x-placement="bottom-start">
          	
           	 	<li><a class="dropdown-item" href="profile/editor/edit.do"><spring:message
							code="master.page.buyer.edit" /></a></li>
							
           	 	<li><a class="dropdown-item" href="profile/editor/display.do"><spring:message
								code="master.page.buyer.profile" /></a></li>
				
          		</ul>
       		</li>


			
			<li class="nav-item dropdown">
         	 	<a href="#" class="nav-link dropdown-toggle transform" data-toggle="dropdown">
         	 	<spring:message code="master.page.mensajes"></spring:message><span class="caret"></span></a>
          	<ul class="dropdown-menu" x-placement="bottom-start">
           	 	<li><a class="dropdown-item" href="messageFolder/editor/list.do?d-16544-p=1"><spring:message
							code="master.page.messageFolder.myList" /></a></li>
							
           	 	<li><a class="dropdown-item" href="messageFolder/editor/create.do"><spring:message
								code="master.page.messageFolder.create" /></a></li>
								
							
           	 	<li><a class="dropdown-item" href="message/editor/send.do"><spring:message
								code="master.page.message.send" /></a></li>
          		</ul>
       		</li>
       		
       		
       		<li class="nav-item dropdown">
         	 	<a href="#" class="nav-link dropdown-toggle transform" data-toggle="dropdown">
         	 	<spring:message code="master.page.new"></spring:message><span class="caret"></span></a>
          	<ul class="dropdown-menu" x-placement="bottom-start">
           	 	<li><a class="dropdown-item" href="newscast/editor/list.do?d-16544-p=1"><spring:message
							code="master.page.New.list" /></a></li>
							
           	 	<li><a class="dropdown-item" href="newscast/editor/create.do"><spring:message
								code="master.page.New.create" /></a></li>
				
          		</ul>
       		</li>
       		
       		
       		<li class="nav-item transform"> 
					<a class="nav-link" href="recycler/list.do?d-16544-p=1">
					
					<spring:message code="master.page.recycler.list" />
					</a>

				</li>
				
				
		<li class="nav-item dropdown">
         	 	<a href="#" class="nav-link dropdown-toggle transform" data-toggle="dropdown">
         	 	<spring:message code="master.page.opinion"></spring:message><span class="caret"></span></a>
          	<ul class="dropdown-menu" x-placement="bottom-start">
          	
           	 	<li><a class="dropdown-item" href="opinion/actor/myListOpinionItem.do?d-16544-p=1"><spring:message
							code="master.page.opinion.myListOpinionProduct" /></a></li>
							
           	 	<li><a class="dropdown-item" href="opinion/actor/createOpinableItem.do"><spring:message
								code="master.page.opinion.createOpinableProduct" /></a></li>
          		</ul>
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

			</ul>
	
	</div>
</nav>
							

<div>
	<a href="?language=en">en</a> | <a href="?language=es">es</a>
</div>
<br>
	<div class="text-center">
<font size="10" color=#0B3B0B face="Bebas Neue"><jstl:out
			value="${Name}"></jstl:out></font>

<spring:message code="master.page.new" var="newLanguage" />
<jstl:choose>
	<jstl:when test="${newLanguage == 'Newscasts'}">
		<br>
		<br>
		<i><font size="4" color= #0B3B0B face="Bebas Neue"><jstl:out value="${EnglishWelcomeMessage}"></jstl:out></font></i>
		<br>
		<br>
		<br>
		
	</jstl:when>

	<jstl:when test="${newLanguage == 'Noticias'}">
		<br>
		<br>
		<i><font size="4" color= #0B3B0B face="Bebas Neue"><jstl:out value="${SpanishWelcomeMessage}"></jstl:out></font></i>
		<br>
		<br>
		<br>
	</jstl:when>
</jstl:choose>
</div>