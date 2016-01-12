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
    
    <style type="text/css">
    input:invalid, input:focus:invalid {
    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAeVJREFUeNqkU01oE1EQ/mazSTdRmqSxLVSJVKU9RYoHD8WfHr16kh5EFA8eSy6hXrwUPBSKZ6E9V1CU4tGf0DZWDEQrGkhprRDbCvlpavan3ezu+LLSUnADLZnHwHvzmJlvvpkhZkY7IqFNaTuAfPhhP/8Uo87SGSaDsP27hgYM/lUpy6lHdqsAtM+BPfvqKp3ufYKwcgmWCug6oKmrrG3PoaqngWjdd/922hOBs5C/jJA6x7AiUt8VYVUAVQXXShfIqCYRMZO8/N1N+B8H1sOUwivpSUSVCJ2MAjtVwBAIdv+AQkHQqbOgc+fBvorjyQENDcch16/BtkQdAlC4E6jrYHGgGU18Io3gmhzJuwub6/fQJYNi/YBpCifhbDaAPXFvCBVxXbvfbNGFeN8DkjogWAd8DljV3KRutcEAeHMN/HXZ4p9bhncJHCyhNx52R0Kv/XNuQvYBnM+CP7xddXL5KaJw0TMAF8qjnMvegeK/SLHubhpKDKIrJDlvXoMX3y9xcSMZyBQ+tpyk5hzsa2Ns7LGdfWdbL6fZvHn92d7dgROH/730YBLtiZmEdGPkFnhX4kxmjVe2xgPfCtrRd6GHRtEh9zsL8xVe+pwSzj+OtwvletZZ/wLeKD71L+ZeHHWZ/gowABkp7AwwnEjFAAAAAElFTkSuQmCC);
    background-position: right top;
    background-repeat: no-repeat;
    -moz-box-shadow: none;
  }
  input:valid {
    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAepJREFUeNrEk79PFEEUx9/uDDd7v/AAQQnEQokmJCRGwc7/QeM/YGVxsZJQYI/EhCChICYmUJigNBSGzobQaI5SaYRw6imne0d2D/bYmZ3dGd+YQKEHYiyc5GUyb3Y+77vfeWNpreFfhvXfAWAAJtbKi7dff1rWK9vPHx3mThP2Iaipk5EzTg8Qmru38H7izmkFHAF4WH1R52654PR0Oamzj2dKxYt/Bbg1OPZuY3d9aU82VGem/5LtnJscLxWzfzRxaWNqWJP0XUadIbSzu5DuvUJpzq7sfYBKsP1GJeLB+PWpt8cCXm4+2+zLXx4guKiLXWA2Nc5ChOuacMEPv20FkT+dIawyenVi5VcAbcigWzXLeNiDRCdwId0LFm5IUMBIBgrp8wOEsFlfeCGm23/zoBZWn9a4C314A1nCoM1OAVccuGyCkPs/P+pIdVIOkG9pIh6YlyqCrwhRKD3GygK9PUBImIQQxRi4b2O+JcCLg8+e8NZiLVEygwCrWpYF0jQJziYU/ho2TUuCPTn8hHcQNuZy1/94sAMOzQHDeqaij7Cd8Dt8CatGhX3iWxgtFW/m29pnUjR7TSQcRCIAVW1FSr6KAVYdi+5Pj8yunviYHq7f72po3Y9dbi7CxzDO1+duzCXH9cEPAQYAhJELY/AqBtwAAAAASUVORK5CYII=);
    background-position: right top;
    background-repeat: no-repeat;
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
    
<c:forEach items="${person.getNavn()}" var="brukere">                 
<div class="container">
  <h2>${brukere.getBrukernavn()}</h2>
  <p>Her kan du endre din brukerinformasjon:</p>
  <form role="form">
    <div class="form-group">
      <label for="usr">Brukernavn</label>
      <input type="text" class="form-control" id="usr" disabled="disabled" placeholder="${person.getBrukernavn()}">
    </div>
    <div class="form-group">
      <label for="pwd">E-Mail</label>
      <input type="email" class="form-control" id="mail" disabled="disabled" placeholder="${person.getMail()}">
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