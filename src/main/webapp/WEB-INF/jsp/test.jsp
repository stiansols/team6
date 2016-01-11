<%-- 
    Document   : Test
    Created on : 07.jan.2016, 16:00:53
    Author     : Eirik Saur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
 

    <form:form class = "form-horizontal" method="POST" modelAttribute="personForm" name="innlogging" action="spam">
        
    <div class="form-group">
        <label for="brukerLabel" class="col-sm-2 control-label">Brukernavn</label>
    <div class="col-sm-6">
        <input type="brukernavn" path="bruker.brukernavn" name="brukernavn" class="form-control" id="inputEmail3" placeholder="Brukernavn">
     </div>
     </div>
    <div class="form-group">
        <label for="passLabel"  class="col-sm-2 control-label">Password</label>
    <div class="col-sm-6">
        <input type="password" path="bruker.passord" name="passord" class="form-control" id="inputPassword3" placeholder="Passord">
    </div>
    </div>
    
    <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-primary">Logg inn</button>
    </div>
    </div>    
        
              
                
         
        </form:form>
