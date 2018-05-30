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
<%-- <footer class="page-footer font-small mdb-color lighten-3 pt-4 mt-4">

<div class="row">

      <!-- Grid column -->
      <div class="col-md-4 col-lg-3 mr-auto my-md-4 my-0 mt-4 mb-1">

        <!-- Content -->
        <h5 class="font-weight-bold text-uppercase mb-4">Content</h5>
        <p>Here you can use rows and columns here to organize your footer content.</p>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugit amet numquam iure provident voluptate esse quasi, veritatis totam voluptas nostrum.</p>

      </div>
     
<div class="col-md-4 col-lg-3 mr-auto my-md-4 my-0 mt-4 mb-1"> 
	<h2 class="font-weight-bold text-uppercase mb-4">Aviso Legal</h2>

    <div class="font-weight-bold text-uppercase mb-4">

        <a href="welcome/legal.do">Términos y condiciones</a>
     
    </div>
    <br/>
</div>

<div class="col-md-4 col-lg-3 mx-auto my-md-4 my-0 mt-4 mb-1">

        <!-- Contact details -->
        <h5 class="font-weight-bold text-uppercase mb-4">Address</h5>

        <ul class="list-unstyled">
          <li><p><i class="fa fa-home mr-3"></i> New York, NY 10012, US</p></li>
          <li><p><i class="fa fa-envelope mr-3"></i> info@example.com</p></li>
          <li><p><i class="fa fa-phone mr-3"></i> + 01 234 567 88</p></li>
          <li><p><i class="fa fa-print mr-3"></i> + 01 234 567 89</p></li>
        </ul>

      </div>

</div>


<!-- Copyright -->
  <div class="footer-copyright text-center py-3">© 2018 Copyright:
    <fmt:formatDate value="${date}" pattern="yyyy" /> Acme-Recycling Co., Inc.
  </div>
</footer> --%>



<!-- Footer -->
<footer class="page-footer font-small blue-grey lighten-5 mt-4">

  <div style="background-color: #F5F5F5">
    <div class="container">

      <!-- Grid row-->
      <div class="row py-4 d-flex align-items-center">

        <!-- Grid column -->
        <div class="col-md-6 col-lg-5 text-center text-md-left mb-4 mb-md-0">
          <h6 class="mb-0">More info!</h6>
        </div>
        <!-- Grid column -->

        <!-- Grid column -->
        <div class="col-md-6 col-lg-7 text-center text-md-right">

          
        </div>
        <!-- Grid column -->

      </div>
      <!-- Grid row-->

    </div>
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
