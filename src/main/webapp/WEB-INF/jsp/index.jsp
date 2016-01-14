<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
        <title>Hjem</title>
    </head>
    <body>
        <form:form class = "form-horizontal" method="POST" modelAttribute="personForm" name="innlogging" action="spam">
            <h2>Velkommen ${person.getNavn()} håper du trives med det nye booking systemet<small>Work in progress</small></h2>
            <h3>${person.getBookingerTekst()}</h3>
        <br>
            <div class="row">
                <div class="col-sm-8">
                    <h2>Velkommen ${person.getNavn()}</h2>
                    <br>
                    <h4>${person.printBrukerType()} NTNU</h4>
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
