<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%--
    Document   : index
    Created on : 06.jan.2016, 22:36:21
    Author     : Benjamin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        
        <script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
        <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
        <title>Hjem</title>
    </head>
    <body>
        <form:form class = "form-horizontal" method="POST" modelAttribute="personForm" name="innlogging" action="IndexHandlerSupreme">
            <h2>Velkommen ${person.getNavn()} håper du trives med det nye booking systemet<small>Work in progress</small></h2>
        <br>
            <div class="row">
                <div class="col-sm-8">
                    <h4>${person.printBrukerType()} NTNU</h4>
                    <br>
                    <br>
                    <h2>Her er dine fremtidige bookinger</h2>
                     <table id="brukerTabell" class="table table-hover table-bordered results">
   
                    <thead>
                        <tr class="warning no-result">
                        </tr>
                        <tr>
                            <th><h3>Romnr</h3></th>
                            <th><h3>Fra tid</h3></th>
                            <th><h3>Til tid</h3></th>
                            <th><h3>Trykk for å sjekke inn</h3></th>
                            </tr>
                            
                      <tr class="warning no-result">
                      </tr>        
                            
                    </thead>
                    
                        <tbody>
                            
           <c:forEach items="${brukerBookinger}" var="brukere">                 
                            <tr>
                                <td><b>${brukere.getRomNummer()}</b></td>
                                <td><b>${brukere.getFratid()}</b></td>
                                <td><b>${brukere.getTiltid()}</b></td>
                                <td><button class="btn btn-primary" type="submit" value="${brukere.getBookingId()}" name="buttonSupreme" formaction="sjekkInn">Sjekk inn!</button></td>
                            </tr>  
                                
        </c:forEach>
                                
                        </tbody>
            </table>   
                    <br>
                    <br>
                    Her skal det være en kalender
                </div>
                <div class="col-sm-4">
                    <br>
                    <fieldset style="outline: 1px solid black">
                        <h2 style="vertical-align: middle" class="text-center">Timeplan</h2>
                    </fieldset>
                    <div>Her <br> skal <br> det <br> være <br> en <br> liste <br> over <br> abonnement</div>
                    <div>
                        <button>Legg til hendelse</button>
                        <button>Endre abonnementer</button>
                    </div>
                    <br>
                    <h2>StudyEasy</h2>
                </div>
            </div>
        </form:form>
    </body>
</html>
