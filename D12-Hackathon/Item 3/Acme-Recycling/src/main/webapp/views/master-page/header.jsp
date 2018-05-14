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
					<li><a href="profile/admin/edit.do"><spring:message code="master.page.buyer.edit" /></a></li>
					<li><a href="profile/admin/display.do"><spring:message code="master.page.buyer.profile" /></a></li>
				</ul>
			</li>
			
			<li><a class="fNiv"><spring:message	code="master.page.administrator.register" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="carrier/admin/create.do"><spring:message code="master.page.admin.carrier.edit" /></a></li>
					<li><a href="manager/admin/create.do"><spring:message code="master.page.admin.manager.edit" /></a></li>
					<li><a href="editor/admin/create.do"><spring:message code="master.page.admin.editor.edit" /></a></li>
				</ul>
			</li>
			
			<li><a class="fNiv"><spring:message	code="master.page.messageFolder" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="messageFolder/admin/list.do?d-16544-p=1"><spring:message code="master.page.messageFolder.myList" /></a></li>
					<li><a href="messageFolder/admin/create.do"><spring:message code="master.page.messageFolder.create" /></a></li>
				</ul>
			</li>
			
			<li><a class="fNiv"><spring:message	code="master.page.administrator.configurationSystem" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="configurationSystem/admin/tabooWord/list.do?d-16544-p=1"><spring:message code="master.page.administrator.tabooWords" /></a></li>				
				</ul>
			</li>
			
			<li><a class="fNiv"><spring:message	code="master.page.administrator.cleanPoints" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="cleanPoint/admin/list.do?d-16544-p=1"><spring:message code="master.page.administrator.cleanPoints" /></a></li>				
				</ul>
			</li>
		</security:authorize>
		
		
		
			<security:authorize access="hasRole('BUYER')">
			
			<li><a class="fNiv"><spring:message	code="master.page.messageFolder" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="messageFolder/buyer/list.do?d-16544-p=1"><spring:message code="master.page.messageFolder.myList" /></a></li>
					<li><a href="messageFolder/buyer/create.do"><spring:message code="master.page.messageFolder.create" /></a></li>
				</ul>
			</li>
			
			<li><a class="fNiv"><spring:message	code="master.page.buyer.buyer1" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="profile/buyer/edit.do"><spring:message code="master.page.buyer.edit" /></a></li>
					<li><a href="profile/buyer/display.do"><spring:message code="master.page.buyer.profile" /></a></li>
				</ul>
			</li>
			</security:authorize>
		
		
		
		<security:authorize access="hasRole('RECYCLER')">
			<li><a class="fNiv"><spring:message	code="master.page.recycler.recyler1" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="profile/recycler/edit.do"><spring:message code="master.page.recycler.edit" /></a></li>
					<li><a href="profile/recycler/display.do"><spring:message code="master.page.recycler.profile" /></a></li>
				</ul>
			</li>
			
			<li><a class="fNiv"><spring:message	code="master.page.messageFolder" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="messageFolder/recycler/list.do?d-16544-p=1"><spring:message code="master.page.messageFolder.myList" /></a></li>
					<li><a href="messageFolder/recycler/create.do"><spring:message code="master.page.messageFolder.create" /></a></li>
				</ul>
			</li>
			
			<li><a class="fNiv"><spring:message	code="master.page.comment" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="comment/recycler/list.do?d-16544-p=1"><spring:message code="master.page.comment.myList" /></a></li>
					<li><a href="new/recycler/list.do?d-16544-p=1"><spring:message code="master.page.new.create.comment" /></a></li>
					
				</ul>
			</li>
			
			<li><a class="fNiv"><spring:message	code="master.page.opinion" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="opinion/recycler/myListOpinionProduct.do?d-16544-p=1"><spring:message code="master.page.opinion.myListOpinionProduct" /></a></li>
					<li><a href="opinion/recycler/myListOpinionCourse.do?d-16544-p=1"><spring:message code="master.page.opinion.myListOpinionCourse" /></a></li>
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
		
		<security:authorize access="hasRole('EDITOR')">
		
			<li><a class="fNiv"><spring:message	code="master.page.messageFolder" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="messageFolder/editor/list.do?d-16544-p=1"><spring:message code="master.page.messageFolder.myList" /></a></li>
					<li><a href="messageFolder/editor/create.do"><spring:message code="master.page.messageFolder.create" /></a></li>
				</ul>
			</li>
		
			<li><a class="fNiv"><spring:message	code="master.page.new" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="new/editor/list.do?d-16544-p=1"><spring:message code="master.page.New.list" /></a></li>
					<li><a href="new/editor/create.do"><spring:message code="master.page.New.create" /></a></li>
				</ul>
			</li>
		</security:authorize>
		
		<security:authorize access="isAnonymous()">
			<li><a class="fNiv" href="security/login.do"><spring:message code="master.page.login" /></a></li>
			<!-- REGISTRO DE USUARIO -->			
			<li><a class="fNiv"><spring:message code="master.page.register" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="recycler/create.do"><spring:message code="master.page.recycler.register" /></a></li>
					<li><a href="buyer/create.do"><spring:message code="master.page.buyer.register" /></a></li>
				</ul>
			</li>
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

