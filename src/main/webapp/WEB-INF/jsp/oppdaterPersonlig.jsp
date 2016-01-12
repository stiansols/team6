<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="en">
<head>
  <title>Oppdater Personlig Informasjon</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body>
    <form:form method="POST" modelAttribute="personForm" name="innlogging" action="oppPersonlig">
    
    <style>
        .form-group{
            width:30%;
        }
        
        .compare{
            width:30%;
        }
    </style>
    
<script type="text/javascript">
function checkGjenta(theForm) {
if (document.getElementById('nymail1') !== null && document.getElementById('nymail1').value !== document.getElementById('nymail2').value){
    alert('Mailadressen ble ikke gjentatt korrekt');
    return false;
}
    if(document.getElementById('nyttpw1') !== null && document.getElementById('nyttpw1').value !== document.getElementById('nyttpw2').value){
        alert('Passordet ble ikke gjentatt korrekt');
        return false;
    }
    else {
    return true;
    }
}
</script>
    
<c:forEach items="${alleBrukere}" var="brukere">                 
<div class="container">
  <h2>${brukere.getBrukernavn()}</h2>
  <p>Her kan du endre din brukerinformasjon:</p>
  <form role="form">
    <div class="form-group">
      <label for="usr">Brukernavn</label>
      <input type="text" class="form-control" id="usr" disabled="disabled" placeholder="${brukere.getBrukernavn()}">
    </div>
    <div class="form-group">
      <label for="pwd">Navn</label>
      <input type="text" class="form-control" id="navn" disabled="disabled" placeholder="${brukere.getNavn()}">
    </div>
    <div class="form-group">
      <label for="pwd">E-Mail</label>
      <input type="email" class="form-control" id="mail" disabled="disabled" placeholder="${brukere.getMail()}">
    </div>
    <div class="compare">
        <label for="nymail">Ny Mail</label>
        <input type="email" class="form-control" class="compare" id="nymail1" placeholder="Fyll inn ny mail her..">
    </div> 
    <div class="compare">
        <label for="nymail2">Gjenta Ny Mail</label>
        <input type="email" class="form-control" class="compare" id="nymail2" placeholder="Gjenta ny mail her..">
    </div>
    <div class="compare">
        <label for="nyttpw">Nytt Passord</label>
        <input type="password" class="form-control" class="compare" id="nyttpw1" placeholder="Fyll inn nytt passord her..">
    </div>
    
    <div class="compare">
        <label for="nyttpw2">Gjenta Nytt Passord</label>
        <input type="password" class="form-control" class="compare" id="nyttpw2" placeholder="Gjenta nytt passord her..">
    </div>    
    
    <div>
        <input class="compare" type="submit" class="form-control" onclick="return checkGjenta('email1','email2','nyttpw1', 'nyttpw2')">
    </div>

  </form>
</div>
                            
 </c:forEach>
    </form:form>

</body>
</html>