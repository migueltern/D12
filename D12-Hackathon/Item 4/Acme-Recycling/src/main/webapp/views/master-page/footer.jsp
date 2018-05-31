<%--
 * footer.jsp
 *
 * Copyright (C) 2017 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1"	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<jsp:useBean id="date" class="java.util.Date" />
<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>

<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<%@ taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<hr />

<!-- Footer -->
<footer class="page-footer font-small blue-grey lighten-5 mt-4">

  <div style="background-color: #F5F5F5">
    <div class="container">

      <!-- Grid row-->
      <div class="row py-2 d-flex align-items-center">

       
        <!-- Grid column -->

        

          
        </div>
        <!-- Grid column -->

      </div>
      <!-- Grid row-->

    </div>
 

  <!-- Footer Links -->
  <div class="container text-center text-md-left mt-5">

    <!-- Grid row -->
    <div class="row mt-3 dark-grey-text">

      <!-- Grid column -->
      <div class="col-md-3 col-lg-4 col-xl-3 mb-4">

        <!-- Content -->
        <h6 class="text-uppercase font-weight-bold"><spring:message code="ourCompany"></spring:message></h6>
        <hr class="teal accent-3 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
       <p> <spring:message code="final"></spring:message></p>
        

      </div>
      <!-- Grid column -->

      <!-- Grid column -->
      <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">

        <!-- Links -->
        <h6 class="text-uppercase font-weight-bold"><spring:message code="terms"></spring:message></h6>
        <hr class="teal accent-3 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
        <p>
           <a class="dark-grey-text" href="welcome/legal.do"><spring:message code="terms"></spring:message></a>
        </p>
        
      </div>
      <!-- Grid column -->

      <!-- Grid column -->
      <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">

        <!-- Links -->
        <h6 class="text-uppercase font-weight-bold"><spring:message code="usefulLinks"></spring:message></h6>
        <hr class="teal accent-3 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
        <p>
          <a class="dark-grey-text" href="https://www.instagram.com/ecoembes/">Instagram</a>
        </p>
        <p>
          <a class="dark-grey-text" href="#!">Twitter</a>
        </p>
        <p>
          <a class="dark-grey-text" href="#!">Facebook</a>
        </p>
        <p>
          <a class="dark-grey-text" href="#!">Help</a>
        </p>

      </div>
      <!-- Grid column -->

      <!-- Grid column -->
      <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">

        <!-- Links -->
        <h6 class="text-uppercase font-weight-bold"><spring:message code="contact"></spring:message></h6>
        <hr class="teal accent-3 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
        <p>
          <i class="fa fa-map-marker mr-3"></i> Sevilla, Paradas 41610, ES</p>
        <p>
          <i class="fa fa-envelope mr-3"></i> acme-recycling@example.com</p>
        <p>
          <i class="fa fa-phone mr-3"></i> + 954 369 007</p>
        <p>
          <i class="fa fa-print mr-3"></i> + 652 582 643</p>

      </div>
      <!-- Grid column -->

    </div>
    <!-- Grid row -->

  </div>
  <!-- Footer Links -->

  <!-- Copyright -->
  <div class="footer-copyright text-center text-black-50 py-3">© 2018 Copyright:
    <a class="dark-grey-text" href="https://mdbootstrap.com/bootstrap-tutorial/"> Acme-Recycling Co., Inc</a>
  </div>
  <!-- Copyright -->

</footer>
<!-- Footer -->
