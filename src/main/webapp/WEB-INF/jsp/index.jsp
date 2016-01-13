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
        <title>JSP Page</title>
    </head>
    <body>
        <form:form class = "form-horizontal" method="POST" modelAttribute="personForm" name="innlogging" action="spam">
            <h2>Velkommen ${person.getNavn()} håper du trives med det nye booking systemet<small>Work in progress</small></h2>
            <h3>${person.getBookingerTekst()}</h3>
        </form:form>
    </body>
</html>
