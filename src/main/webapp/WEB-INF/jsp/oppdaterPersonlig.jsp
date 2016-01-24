<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<!DOCTYPE html>
<html lang="en">
<head>
  <title>Oppdater Personlig Informasjon</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
  <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.1/css/datepicker.css" rel="stylesheet" type="text/css" />
  <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.1/css/datepicker.css" rel="stylesheet" type="text/css" />
       
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body>

            
<div class="container">
  <h2>${person.getNavn()}</h2>
  <p>Her kan du endre din brukerinformasjon:</p>
    <div class="form-group">
      <label for="usr">Brukernavn</label>
      <input type="brukernavn" name="brukernavn" path="bruker.brukernavn" class="form-control" id="usr" readonly value="${person.getBrukernavn()}">
    </div>
    <div class="form-group">
      <label for="pwd">E-Mail</label>
      <input type="email" class="form-control" id="gammelmail" readonly placeholder="${person.getMail()}">
    </div> 
    <form:form method="POST" modelAttribute="personlig" action="oppdaterMail">
    <div class="form-group">
        <label for="nyttpw3">Gammelt passord</label>
        <input type="password" path="bruker.passord" name="gpassord" class="form-control" id="gpassord" required placeholder="Fyll ditt nåværende passord" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Må stemme med ditt nåværende passord">
    </div>
    <div class="form-group">
        <label for="nymail">Ny E-Mail</label>
        <input type="email" name="email" path="bruker.mail" class="endre form-control" id="mail" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" required placeholder="Fyll inn ny mail her..">
    </div> 
    <div class="form-group">
        <label for="nymail2">Gjenta Ny E-Mail</label>
        <input type="email" class="endre form-control" id="nymail2" onfocus="validerMail(document.getElementById('mail'), this);" oninput="validerMail(document.getElementById('mail'), this);" required placeholder="Gjenta ny mail her..">
    </div>
    
    <div class="form-group">
    <button class="btn btn-primary" type="submit">Oppdater E-Mail</button>
    </div>  
    </form:form>
    
    <br> 
     <form:form method="POST" modelAttribute="personlig" action="oppdaterPassord">
    <div class="form-group">
        <label for="nyttpw3">Gammelt passord</label>
        <input type="password" name="gpassord" class="form-control" id="gpassord" required placeholder="Fyll ditt nåværende passord" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Må stemme med ditt nåværende passord">
    </div>
    <div class="form-group">
        <label for="nyttpw">Nytt Passord</label>
        <input type="password" name="npassord" class="endre form-control" id="npassord" required placeholder="Fyll inn nytt passord her.." pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Må inneholde minst en stor bokstav, ett tall og minst 8 tegn totalt">
    </div>
    
    <div class="form-group">
        <label for="nyttpw2">Gjenta Nytt Passord</label>
        <input type="password" name="passord2" class="endre form-control" id="nyttpw2" placeholder="Gjenta nytt passord her.." onfocus="validerPassord(document.getElementById('passord'), this);" oninput="validerPassord(document.getElementById('passord'), this);" title="Må være identisk med det forrige" required>
    </div>    
    
    <div class="form-group">
        <button class="btn btn-primary" type="submit">Oppdater Passord</button>
    </div>
     </form:form>   
    </div>
    
        
    <style>
        .form-group{
            width:30%;
        }
        
        .compare{
            width:30%;
        }
        
        .knapp{
            width:30%;
            height:30px;
        }
    </style>
    



<script> 
function validerMail(mail, nymail2) {
if (mail.value !== nymail2.value || mail.value === '' || nymail2.value === '') {
    nymail2.setCustomValidity('Feil E-Mail');
} else {
    nymail2.setCustomValidity('');
}
}
</script>

<script> 
function validerPassord(npassord, nyttpw2) {
if (npassord.value !== nyttpw2.value || npassord.value === '' || nyttpw2.value === '') {
    nyttpw2.setCustomValidity('Feil passord');
} else {
    nyttpw2.setCustomValidity('');
}
}
</script>

<style type="text/css">
    .endre:invalid, .endre:focus:invalid {
    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAeVJREFUeNqkU01oE1EQ/mazSTdRmqSxLVSJVKU9RYoHD8WfHr16kh5EFA8eSy6hXrwUPBSKZ6E9V1CU4tGf0DZWDEQrGkhprRDbCvlpavan3ezu+LLSUnADLZnHwHvzmJlvvpkhZkY7IqFNaTuAfPhhP/8Uo87SGSaDsP27hgYM/lUpy6lHdqsAtM+BPfvqKp3ufYKwcgmWCug6oKmrrG3PoaqngWjdd/922hOBs5C/jJA6x7AiUt8VYVUAVQXXShfIqCYRMZO8/N1N+B8H1sOUwivpSUSVCJ2MAjtVwBAIdv+AQkHQqbOgc+fBvorjyQENDcch16/BtkQdAlC4E6jrYHGgGU18Io3gmhzJuwub6/fQJYNi/YBpCifhbDaAPXFvCBVxXbvfbNGFeN8DkjogWAd8DljV3KRutcEAeHMN/HXZ4p9bhncJHCyhNx52R0Kv/XNuQvYBnM+CP7xddXL5KaJw0TMAF8qjnMvegeK/SLHubhpKDKIrJDlvXoMX3y9xcSMZyBQ+tpyk5hzsa2Ns7LGdfWdbL6fZvHn92d7dgROH/730YBLtiZmEdGPkFnhX4kxmjVe2xgPfCtrRd6GHRtEh9zsL8xVe+pwSzj+OtwvletZZ/wLeKD71L+ZeHHWZ/gowABkp7AwwnEjFAAAAAElFTkSuQmCC);
    background-position: right top;
    background-repeat: no-repeat;
    -moz-box-shadow: none;
  }
  .endre:valid {
    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAepJREFUeNrEk79PFEEUx9/uDDd7v/AAQQnEQokmJCRGwc7/QeM/YGVxsZJQYI/EhCChICYmUJigNBSGzobQaI5SaYRw6imne0d2D/bYmZ3dGd+YQKEHYiyc5GUyb3Y+77vfeWNpreFfhvXfAWAAJtbKi7dff1rWK9vPHx3mThP2Iaipk5EzTg8Qmru38H7izmkFHAF4WH1R52654PR0Oamzj2dKxYt/Bbg1OPZuY3d9aU82VGem/5LtnJscLxWzfzRxaWNqWJP0XUadIbSzu5DuvUJpzq7sfYBKsP1GJeLB+PWpt8cCXm4+2+zLXx4guKiLXWA2Nc5ChOuacMEPv20FkT+dIawyenVi5VcAbcigWzXLeNiDRCdwId0LFm5IUMBIBgrp8wOEsFlfeCGm23/zoBZWn9a4C314A1nCoM1OAVccuGyCkPs/P+pIdVIOkG9pIh6YlyqCrwhRKD3GygK9PUBImIQQxRi4b2O+JcCLg8+e8NZiLVEygwCrWpYF0jQJziYU/ho2TUuCPTn8hHcQNuZy1/94sAMOzQHDeqaij7Cd8Dt8CatGhX3iWxgtFW/m29pnUjR7TSQcRCIAVW1FSr6KAVYdi+5Pj8yunviYHq7f72po3Y9dbi7CxzDO1+duzCXH9cEPAQYAhJELY/AqBtwAAAAASUVORK5CYII=);
    background-position: right top;
    background-repeat: no-repeat;
  }

</style>
                           
</body>
</html>