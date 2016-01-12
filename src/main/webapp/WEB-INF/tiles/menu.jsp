<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><tiles:insertAttribute name="title" ignore="true" /></title>
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    </head>
    <body>      
          
            <a class="btn btn-default col-lg-12 col-xs-12" role="button" href="<c:url value="admin"/>">Admin </a>
            <a class="btn btn-default col-lg-12 col-xs-12" role="button" href="<c:url value="index"/>" >Index </a>
            <a class="btn btn-default col-lg-12 col-xs-12" role="button" href="<c:url value="romOversikt"/>" >Rom Oversikt </a>
            <a class="btn btn-default col-lg-12 col-xs-12" role="button" href="<c:url value="addBooking"/>" >Booking </a>
            <a class="btn btn-default col-lg-12 col-xs-12" role="button" href="<c:url value="test"/>" >Logg inn for Eirik </a>
            <a class="btn btn-default col-lg-12 col-xs-12" role="button" href="<c:url value="login"/>" >Login </a>
            
        <script src="//code.jquery.com/jquery.min.js"></script>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.1/css/datepicker.css" rel="stylesheet" type="text/css" />
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.1/css/datepicker.css" rel="stylesheet" type="text/css" />




            <a class="btb btn-default" role="button" href="<c:url value="romOversikt"/>"><img src="http://bildr.no/image/dnc1Ykla.jpeg" alt="Hjem"/> </a><br>
            <a class="btb btn-default" role="button" href="<c:url value="addBooking"/>"><img src="http://bildr.no/image/RHpQQ09s.jpeg" alt="Booking"/> </a><br/>
            <a class="btb btn-default" role="button" href="<c:url value="oppdaterBruker"/>"><img src="http://bildr.no/image/Tkt2ckNa.jpeg" alt="Bruker"/> </a><br>
            <a class="btb btn-default" role="button" href="<c:url value="innstillinger"/>"><img src="http://bildr.no/image/WURwSk1C.jpeg" alt="Innstillinger"/> </a><br>
            <a class="btb btn-default" role="button" href="<c:url value="login"/>"><img src="http://bildr.no/image/ZDMrRnNU.jpeg" alt="Logg ut"/> </a><br>

    </body>
</html>


<nav class="navbar navbar-default">
    <div class="container col-lg-12">
    <div class="navnbar-header col-lg-12">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#liste" aria-expanded="false">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <div class= "navbar-brand">Meny</div>
        </div><br><br><br>
        <div class="collapse navbar-collapse col-lg-12" id="liste">
	<a class="btn btn-default col-lg-12 col-xs-12" role="button" href="<c:url value="admin"/>">Admin </a>
	<a class="btn btn-default col-lg-12 col-xs-12" role="button" href="<c:url value="index"/>" >Index </a>
	<a class="btn btn-default col-lg-12 col-xs-12" role="button" href="<c:url value="romOversikt"/>" >Rom Oversikt </a>
	<a class="btn btn-default col-lg-12 col-xs-12" role="button" href="<c:url value="addBooking"/>" >Booking </a>
	<a class="btn btn-default col-lg-12 col-xs-12" role="button" href="<c:url value="login"/>" >Login </a>
	<a class="btn btn-default col-lg-12 col-xs-12" role="button" href="<c:url value="registrerBruker"/>" >Registrer bruker </a>
	<a href="<c:url value="index"/>"><img src="http://bildr.no/image/dnc1Ykla.jpeg" alt="Hjem" width="150" height="180"/> <a/><br>
	<a href="<c:url value="addBooking"/>"><img src="http://bildr.no/image/RHpQQ09s.jpeg" alt="Booking" width="150" height="180"/> <a/><br/>
	<a href="<c:url value="oppdaterBruker"/>"><img src="http://bildr.no/image/Tkt2ckNa.jpeg" alt="Bruker" width="150" height="180"/> <a/><br>
	<a href="<c:url value="registrerBruker"/>"><img src="http://bildr.no/image/WURwSk1C.jpeg" alt="Innstillinger" width="150" height="180"/> <a/><br>
	<a href="<c:url value="login"/>"><img src="http://bildr.no/image/ZDMrRnNU.jpeg" alt="Logg ut" width="150" height="180"/> <a/><br>
    </div>
    </div>
    </nav>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.1/js/bootstrap-datepicker.min.js"></script>
