<%-- 
    Document   : login
    Created on : 08.jan.2016, 09:42:34
    Author     : Archimedes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>StudyEasy - Logg inn</title>
        <!-- <link href="<!--c:url value="/resources/css/main.css" />" rel="stylesheet"> -->
    </head>
    <body>
    <table align="center" class="alt">
        <tr><td>
        <h1>StudyEasy</h1>

        <div id="logging">
        	<table align="center">
        		<tr>
        			<td>
        			<p> Brukernavn: </p>
        			<input type="text"/>
        			</td>
        		</tr>
        		<tr>
        			<td>
        			<p> Passord:  </p>
        			<input type="password"/>
        			</td>
        		</tr>
        	</table>
        </div>
        </td></tr>
        <tr><td>
		<button>Logg inn </button>
		<button>Logg inn (mobil) </button>
        </td></tr>
        </table>
    </body>
</html>
