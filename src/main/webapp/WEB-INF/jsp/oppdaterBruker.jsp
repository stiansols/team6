<%-- 
    Document   : oppdaterBruker
    Created on : 08.jan.2016, 14:29:22
    Author     : Eirik Saur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
    <form:form method="POST" modelAttribute="personForm" name="innlogging" action="oppBruker">
         
        <script>
        prototypevar $rows=$('#tabell tr');
        $('#sok').keyup(function() {
        var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();
    
        $rows.show().filter(function() {
        var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
        return !~text.indexOf(val);
        }).hide();
        });
        </script>
        
        
        
        <div><table id="tabell">
                <th>Brukernavn</th>
                <th>Navn</th>
                
            <c:forEach items="${alleBrukere}" var="bruker">
           
                <tr><td>${bruker.brukernavn}</td> <td>${bruker.navn}</td></tr>
           
                    </c:forEach>
                </table>
        
            
           &emsp;Brukernavn søk:<input type="text" path="bruker.brukernavn" name="brukernavn" id="sok"> </input>
                <button class="btn btn-primary" action="searchBruker">Søk</button> 
        </div>
        
        <div>Brukernavn:<br><input type="text" path="bruker.brukernavn" name="brukernavn"></input></div> 
        <div>Nytt Passord: <br><input type="text" path="bruker.passord" name="passord"></input></div>                
        <div>Ny Email:<br> <input type="text" path="bruker.email" name="email"></input></div>                
           <div><button type="Submit" class="btn btn-primary" value="Send">Oppdater</button></div>
           
           <c:forEach items="${alleBrukere}" var="bruker">
           
               <option>${bruker.brukernavn}</option>
           
                    </c:forEach>
         
        </form:form>
            <!-- Latest compiled and minified JavaScript -->
	<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
