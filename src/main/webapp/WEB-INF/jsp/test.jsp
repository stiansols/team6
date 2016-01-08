<%-- 
    Document   : Test
    Created on : 07.jan.2016, 16:00:53
    Author     : Eirik Saur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <form:form method="POST" modelAttribute="personForm" name="innlogging" action="spam">
         
        <table>
            <tr>
                <td>Brukernavn:<input path="bruker.brukernavn" name="brukernavn"> </input></td> 
            </tr>
            <tr>
                <td>Passord: <input path="bruker.passord" name="passord"></input></td>                
            </tr>
            <tr>
                <td><input type="submit" value="Send"</td>
            </tr>
        </table>
        </form:form>
