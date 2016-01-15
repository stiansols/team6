<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<meta http-equiv="Content-Type" content="text/html" charset=UTF-8>
        <script src="//code.jquery.com/jquery.min.js"></script>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.1/css/datepicker.css" rel="stylesheet" type="text/css" />
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.1/css/datepicker.css" rel="stylesheet" type="text/css" />
<nav class="navbar navbar-default">
    <div class="container col-lg-12">
        <div class="navnbar-header col-lg-12">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#liste" aria-expanded="false">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <div class= "navbar-brand">Meny</div>
        </div>
            <br><br><br>
        <div class="collapse navbar-collapse col-lg-12" id="liste">
            <a class="btn btn-primary col-lg-11 col-xs-11" role="button" href="<c:url value="admin"/>">Admin </a>
            <a class="btn btn-primary col-lg-11 col-xs-11" role="button" href="<c:url value="index"/>" >Index </a>
            <a class="btn btn-primary col-lg-11 col-xs-11" role="button" href="<c:url value="romOversikt"/>" >Booking </a>
            <a class="btn btn-primary col-lg-11 col-xs-11" role="button" href="<c:url value="login"/>" >Login </a>
            <a class="btn btn-primary col-lg-11 col-xs-11" role="button" href="<c:url value="oppdaterPersonlig"/>" >Oppdater Personlig </a>
            <a class="btn btn-primary col-lg-11 col-xs-11" role="button" href="<c:url value="romOrganisering"/>" >Romorganisering </a>
            <a href="<c:url value="hjem"/>"><img src="http://bildr.no/image/eGxRM25P.jpeg" alt="Hjem"/> </a><br>
            <a href="<c:url value="addBooking"/>"><img src="http://bildr.no/image/RHpQQ09s.jpeg" alt="Booking"/> </a><br/>
            <a href="<c:url value="bruker"/>"><img src="http://bildr.no/image/Tkt2ckNa.jpeg" alt="Bruker"/> </a><br>
            <a href="<c:url value="innstillinger"/>"><img src="http://bildr.no/image/WURwSk1C.jpeg" alt="Innstillinger"/> </a><br>
            <a data-toggle="modal" data-target="#logoff"><img src="http://bildr.no/image/ZDMrRnNU.jpeg" alt="Logg ut"/> </a><br>
        </div>
    </div>
</nav>
<div id="logoff" class="modal" role="dialog" style="z-index: 1500">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <i class="fa fa-lock"></i>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Logg ut</h4>
            </div>
            <div class="modal-body">
                <i class="fa fa-question-circle"></i>
                <p>Er du sikker på at du vil logge ut?</p>
            </div>
            <div class="modal-footer">
                <a class="btn btn-primary" href="<c:url value="index"/>">Logg ut</a>
                <a class="btn btn-default" data-dismiss="modal">Avbryt</a>
            </div>
        </div>
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.1/js/bootstrap-datepicker.min.js"></script>