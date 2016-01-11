<%-- 
    Document   : registrerBruker
    Created on : 08.jan.2016, 13:59:27
    Author     : Eirik Saur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <form:form method="POST" modelAttribute="endreBrukerForm" name="innlogging" action="regBruker">
         
        <table align="center">
            <tr>
                <td>Navn <input type="text" path="bruker.navn" name="navn"></input></td>                
            </tr>
            <tr>
                <td>Brukernavn:<input type="text" path="bruker.brukernavn" name="brukernavn"> </input></td> 
            </tr>
            <tr>
                <td>Passord: <input type="text" path="bruker.passord" name="passord"></input></td>                
            </tr>
            <tr>
                <td>Email <input type="text" path="bruker.email" name="email"></input></td>                
            </tr>
            <tr>
                <td>Brukertype <input type="int" path="bruker.type" name="type"></input></td>                
            </tr>
            <tr>
                <td><input type="submit" value="Send">Registrer</input></td>
            </tr>
        </table>
        </form:form>
    
