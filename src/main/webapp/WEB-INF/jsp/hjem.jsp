<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Roger
  Date: 14.01.2016
  Time: 16.27
  To change this template use File | Settings | File Templates.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Hjem</title>
</head>
<body>
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
                <button href="#">Legg til hendelse</button>
                <button href="#">Endre abonnementer</button>
            </div>
            <br>
            <h2>StudyEasy</h2>
        </div>
    </div>
</body>
</html>
