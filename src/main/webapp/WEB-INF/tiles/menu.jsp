<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title><tiles:insertAttribute name="title" ignore="true" /></title>
            
            <!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
	
           
            
    </head>
    <body>      
          
            <a class="btn btn-default col-lg-12 col-xs-12" role="button" href="<c:url value="admin"/>">Admin </a>
            <a class="btn btn-default col-lg-12 col-xs-12" role="button" href="<c:url value="index"/>" >Index </a>
            <a class="btn btn-default col-lg-12 col-xs-12" role="button" href="<c:url value="romOversikt"/>" >Rom Oversikt </a>
            <a class="btn btn-default col-lg-12 col-xs-12" role="button" href="<c:url value="addBooking"/>" >Booking </a>
            <a class="btn btn-default col-lg-12 col-xs-12" role="button" href="<c:url value="test"/>" >Logg inn for Eirik </a>
            <a class="btn btn-default col-lg-12 col-xs-12" role="button" href="<c:url value="login"/>" >Login </a>
      
          
                            <!-- Latest compiled and minified JavaScript -->
	<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    </body>
</html>


<a href="<c:url value="index"/>"><img src="http://bildr.no/image/dnc1Ykla.jpeg" alt="Hjem" width="150" height="180"/> <a/><br>
<a href="<c:url value="addBooking"/>"><img src="http://bildr.no/image/RHpQQ09s.jpeg" alt="Booking" width="150" height="180"/> <a/><br/>
<a href="<c:url value="oppdaterBruker"/>"><img src="http://bildr.no/image/Tkt2ckNa.jpeg" alt="Bruker" width="150" height="180"/> <a/><br>
<a href="<c:url value="registrerBruker"/>"><img src="http://bildr.no/image/WURwSk1C.jpeg" alt="Innstillinger" width="150" height="180"/> <a/><br>
<a href="<c:url value="login"/>"><img src="http://bildr.no/image/ZDMrRnNU.jpeg" alt="Logg ut" width="150" height="180"/> <a/><br>
