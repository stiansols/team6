<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<meta http-equiv="Content-Type" content="text/html" charset=UTF-8>
        <script src="//code.jquery.com/jquery.min.js"></script>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.1/css/datepicker.css" rel="stylesheet" type="text/css" />
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.1/css/datepicker.css" rel="stylesheet" type="text/css" />
        <style>
            .btn-primary {
                margin-top: 5px;
            }
            
            .col-lg-12 {
                position: relative;
                min-height: 1px;
                padding-right: 15px;
                padding-left: 15px;
                margin-bottom: 15px;
            }
            
        </style>
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
        
        <div class="collapse navbar-collapse col-lg-12" id="liste">
            <div id="knapper">

            <c:if test="${person.getBrukertype() == 3}">                
            <a class="btn btn-primary col-lg-11 col-xs-11" role="button" href="<c:url value="admin"/>" id="adminKnapp">Admin </a>
            </c:if><a class="btn btn-primary col-lg-11 col-xs-11" role="button" href="<c:url value="bruker"/>">Bruker </a>
            <a class="btn btn-primary col-lg-11 col-xs-11" role="button" href="<c:url value="index"/>" >Index </a>
            <a class="btn btn-primary col-lg-11 col-xs-11" role="button" href="<c:url value="romOversikt"/>" >Etasjer og rom </a>
            <a class="btn btn-primary col-lg-11 col-xs-11" role="button" href="<c:url value="addBooking"/>" >Booking </a>
            <a class="btn btn-primary col-lg-11 col-xs-11" role="button" href="<c:url value="oppdaterPersonlig"/>" >Oppdater personlig </a>
            <a class="btn btn-primary col-lg-11 col-xs-11" role="button" href="<c:url value="romOrganisering"/>" >Romorganisering </a>
            <a class="btn btn-primary col-lg-11 col-xs-11" role="button" href="<c:url value="innstillinger"/>" >Innstillinger </a>
            <a data-toggle="modal" data-target="#logoff"><button class="btn btn-primary col-lg-11 col-xs-11">Logg ut </button></a>
            
            </div>
            <!--
            <div class="bildelinker">
            <a href="<c:url value="hjem"/>"><img class="valg" src="http://bildr.no/image/eGxRM25P.jpeg" alt="Hjem"/> </a><br>
            <a href="<c:url value="romOversikt"/>"><img class="valg" src="http://bildr.no/image/RHpQQ09s.jpeg" alt="Booking"/> </a><br/>
            <a href="<c:url value="bruker"/>"><img class="valg" src="http://bildr.no/image/Tkt2ckNa.jpeg" alt="Bruker"/> </a><br>
            <a href="<c:url value="innstillinger"/>"><img class="valg" src="http://bildr.no/image/WURwSk1C.jpeg" alt="Innstillinger"/> </a><br>
            <a data-toggle="modal" data-target="#logoff"><img class="valg" src="http://bildr.no/image/ZDMrRnNU.jpeg" alt="Logg ut"/> </a><br>
            </div>
            -->
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
                <p>Er du sikker pÃ¥ at du vil logge ut?</p>
            </div>
            <div class="modal-footer">
                <a class="btn btn-primary" href="<c:url value="logut"/>">Logg ut</a>
                <a class="btn btn-default" data-dismiss="modal">Avbryt</a>
            </div>
        </div>
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.1/js/bootstrap-datepicker.min.js"></script>
