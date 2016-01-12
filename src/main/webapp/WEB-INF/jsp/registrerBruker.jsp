<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
    <head>
        <script src="//code.jquery.com/jquery.min.js"></script>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.1/css/datepicker.css" rel="stylesheet" type="text/css" />
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.1/css/datepicker.css" rel="stylesheet" type="text/css" />

        <title>RegBruker</title>
    </head>
    <body>
        
        <form:form class = "form-horizontal" method="POST" modelAttribute="nyBrukerForm" action="nyBruker">
            <div class="container ">
                <div class="row col-lg-8">
                    <h1 class="col-lg-12">Registrer ny bruker</h1>
                    <div class ="col-lg-12 well">
                        <div class="form-group">
                            <label for="BrukernavnLabel" class="col-lg-2 control-label">Brukernavn</label>
                            <div class="col-lg-10">
                                <input type="brukernavn" path="bruker.brukernavn" name="brukernavn" class="form-control" id="inputEmail3" placeholder="Brukernavn">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="BrukertypeLabel"  class="col-lg-2 control-label">Brukertype</label>
                            <div class="col-lg-10">
                                <input type="brukertype" path="bruker.brukertype" name="brukertype" class="form-control" id="inputBrukertype" placeholder="Brukertype">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="NavnLabel"  class="col-lg-2 control-label">Navn</label>
                            <div class="col-lg-10">
                                <input type="navn" path="bruker.navn" name="navn" class="form-control" id="InputNavn" placeholder="Navn">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="PassordLabel"  class="col-lg-2 control-label">Passord</label>
                            <div class="col-lg-10">
                                <input type="password" path="bruker.passord" name="passord" class="form-control" id="inputPassword" placeholder="Passord">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="MailLabel"  class="col-lg-2 control-label">Mail</label>
                            <div class="col-lg-10">
                                <input type="mail" path="bruker.passord" name="mail" class="form-control" id="inputMail" placeholder="Mail">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-6">
                                <button type="submit" class="btn btn-primary">Send</button>
                            </div>
                        </div>  


                    </form:form>

                    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.1/js/bootstrap-datepicker.min.js"></script>

                    <script type="text/javascript">

            < /body>
                    < /html>