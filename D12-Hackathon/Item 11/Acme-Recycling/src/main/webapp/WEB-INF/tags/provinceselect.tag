<%--
 * select.tag
 *
 * Copyright (C) 2017 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@ tag language="java" body-content="empty" %>

<%-- Taglibs --%>

<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags" %>

<%-- Attributes --%> 

<%@ attribute name="path" required="true" %>
<%@ attribute name="code" required="true" %>


<%@ attribute name="id" required="false" %>
<%@ attribute name="onchange" required="false" %>

<jstl:if test="${id == null}">
	<jstl:set var="id" value="${UUID.randomUUID().toString()}" />
</jstl:if>

<jstl:if test="${onchange == null}">
	<jstl:set var="onchange" value="javascript: return true;" />
</jstl:if>

<%-- Definition --%>

<div>
	<form:label path="${path}">
		<spring:message code="${code}" />
	</form:label>	
	<form:select id="${id}" path="${path}" onchange="${onchange}">
		<form:option value="�LAVA" label="�LAVA"/>
		<form:option value="ALBACETE" label="ALBACETE"/> 
		<form:option value="ALICANTE" label="ALICANTE"/> 
		<form:option value="ALMER�A" label="ALMER�A"/> 
		<form:option value="ASTURIAS" label="ASTURIAS"/> 
		<form:option value="�VILA" label="�VILA"/> 
		<form:option value="BADAJOZ" label="BADAJOZ"/> 
		<form:option value="BARCELONA" label="BARCELONA"/> 
		<form:option value="BURGOS" label="BURGOS"/> 
		<form:option value="C�CERES" label="C�CERES"/> 
		<form:option value="C�DIZ" label="C�DIZ"/> 
		<form:option value="CANTABRIA" label="CANTABRIA"/> 
		<form:option value="CASTELL�N" label="C�RDOBA"/> 
		<form:option value="CIUDAD REAL" label="CIUDAD REAL"/> 
		
		<form:option value="C�RDOBA" label="C�RDOBA"/> 
		<form:option value="CUENCA" label="CUENCA"/> 
		<form:option value="GERONA" label="GERONA"/> 
		<form:option value="GRANADA" label="GRANADA"/> 
		<form:option value="GUADALAJARA" label="GUADALAJARA"/> 
		<form:option value="GUIP�ZCOA" label="GUIP�ZCOA"/> 
		<form:option value="HUELVA" label="HUELVA"/>
		
		<form:option value="HUESCA" label="HUESCA"/> 
		<form:option value="ISLAS BALEARES" label="ISLAS BALEARES"/> 
		<form:option value="JA�N" label="JA�N"/> 
		<form:option value="LA CORU�A" label="LA CORU�A"/> 
		<form:option value="LA RIOJA" label="LA RIOJA"/> 
		<form:option value="LAS PALMAS" label="LAS PALMAS"/> 
		<form:option value="LE�N" label="LE�N"/>
		
		<form:option value="L�RIDA" label="L�RIDA"/> 
		<form:option value="LUGO" label="LUGO"/> 
		<form:option value="MADRID" label="MADRID"/> 
		<form:option value="M�LAGA" label="M�LAGA"/> 
		<form:option value="MURCIA" label="MURCIA"/> 
		<form:option value="NAVARRA" label="NAVARRA"/> 
		<form:option value="ORENSE" label="ORENSE"/>
		
		<form:option value="PALENCIA" label="PALENCIA"/> 
		<form:option value="PONTEVEDRA" label="PONTEVEDRA"/> 
		<form:option value="SALAMANCA" label="SALAMANCA"/> 
		<form:option value="SEGOVIA" label="SEGOVIA"/> 
		<form:option value="SEVILLA" label="SEVILLA"/> 
		<form:option value="SORIA" label="SORIA"/> 
		<form:option value="TARRAGONA" label="TARRAGONA"/>
		
		<form:option value="TENERIFE" label="TENERIFE"/> 
		<form:option value="TERUEL" label="TERUEL"/> 
		<form:option value="TOLEDO" label="TOLEDO"/> 
		<form:option value="VALENCIA" label="VALENCIA"/> 
		<form:option value="VALLADOLIZ" label="VALLADOLIZ"/> 
		<form:option value="VIZCAYA" label="VISCAYA"/> 
		<form:option value="ZAMORA" label="ZAMORA"/>
		<form:option value="ZARAGOZA" label="ZARAGOZA"/> 
	</form:select>
	<form:errors path="${path}" cssClass="error" />
</div>


