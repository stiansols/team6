
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<meta http-equiv="Content-Type" content="text/html" charset=UTF-8>
<script src="//code.jquery.com/jquery.min.js"></script>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.1/css/datepicker.css" rel="stylesheet" type="text/css" />

<style>
    #knapper {
        margin-top: 5px;
    }
    
    /* St�rrelse p� teksten i knappene */
    #knapper > a, #loggut {
        font-size: 12px;
    }

    #menytekst {
        margin-bottom: -20px;
    }

    .btn-primary {
        margin-top: 5px;
    }
    
    #hele {
        margin-top: 2%;
    }
    
    #cont {
        position: relative;
        min-height: 1%;
        padding-right: 2%;
        padding-left: 2%;
        padding-bottom: 4%;
    }

    #knapper > .btn, #loggut {
        text-align: left;
    }
    #in-cont {
        margin-right: 2%;
        margin-left: 2%;
        margin-bottom: 2%;
    }

</style>
<div id="hele">
    <nav class="navbar navbar-default">
        <div id="cont" class="container col-lg-12">
            <div id="in-cont" class="navbar-header col-lg-12">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#liste" aria-expanded="false">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <div id="menytekst" class= "navbar-brand">Meny</div>
            </div>

            <div class="collapse navbar-collapse col-lg-12" id="liste">
                <div id="knapper">

                    <a class="btn btn-primary col-lg-11 col-xs-11" role="button" href="<c:url value="index"/>" >Hjem </a>
                    <c:if test="${person.getBrukertype() == 3}">                
                        <a class="btn btn-primary col-lg-11 col-xs-11" role="button" href="<c:url value="admin"/>" id="adminKnapp">Admin </a>
                    </c:if>
                    <a class="btn btn-primary col-lg-11 col-xs-11" role="button" href="<c:url value="romOversikt"/>" >Rom og booking </a>
                    <a class="btn btn-primary col-lg-11 col-xs-11" role="button" href="<c:url value="bruker"/>">Bruker </a>
                    <a data-toggle="modal" data-target="#logoff"><button id="loggut" class="btn btn-primary col-lg-11 col-xs-11">Logg ut </button></a>

                </div>
            </div>
        </div>
    </nav>
</div>                
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
                <p>Er du sikker p� at du vil logge ut?</p>
            </div>
            <div class="modal-footer">
                <a class="btn btn-primary" href="<c:url value="logut"/>">Logg ut</a>
                <a class="btn btn-default" data-dismiss="modal">Avbryt</a>
            </div>
        </div>
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.1/js/bootstrap-datepicker.min.js"></script>