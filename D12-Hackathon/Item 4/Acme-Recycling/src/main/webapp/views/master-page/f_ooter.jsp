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

<hr />
<footer class="page-footer font-small mdb-color lighten-3 pt-4 mt-4">

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
</footer>



