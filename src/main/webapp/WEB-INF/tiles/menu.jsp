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

            <a class="btb btn-default" role="button" href="<c:url value="romOversikt"/>"><img src="http://bildr.no/image/dnc1Ykla.jpeg" alt="Hjem"/> </a><br>
            <a class="btb btn-default" role="button" href="<c:url value="addBooking"/>"><img src="http://bildr.no/image/RHpQQ09s.jpeg" alt="Booking"/> </a><br/>
            <a class="btb btn-default" role="button" href="<c:url value="oppdaterBruker"/>"><img src="http://bildr.no/image/Tkt2ckNa.jpeg" alt="Bruker"/> </a><br>
            <a class="btb btn-default" role="button" href="<c:url value="innstillinger"/>"><img src="http://bildr.no/image/WURwSk1C.jpeg" alt="Innstillinger"/> </a><br>
            <a class="btb btn-default" role="button" href="<c:url value="login"/>"><img src="http://bildr.no/image/ZDMrRnNU.jpeg" alt="Logg ut"/> </a><br>

    </body>
</html>