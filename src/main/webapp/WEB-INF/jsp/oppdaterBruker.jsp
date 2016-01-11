<%-- 
    Document   : oppdaterBruker
    Created on : 08.jan.2016, 14:29:22
    Author     : Eirik Saur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <form:form method="POST" modelAttribute="personForm" name="innlogging" action="oppBruker">
         
        <table>
            <tr>
                <td>Brukernavn:<input type="text" path="bruker.brukernavn" name="brukernavn"> </input></td> 
            </tr>
            <tr>
                <td>Nytt Passord: <input type="text" path="bruker.passord" name="passord"></input></td>                
            </tr>
            <tr>
                <td>Ny Email <input type="text" path="bruker.email" name="email"></input></td>                
            </tr>
            <tr>
                <td><input type="submit" value="Send">Registrer</input></td>
            </tr>
        </table>
        </form:form>
