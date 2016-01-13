<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
    <head>
        <script src="//code.jquery.com/jquery.min.js"></script>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.1/css/datepicker.css" rel="stylesheet" type="text/css" />
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.1/css/datepicker.css" rel="stylesheet" type="text/css" />

        <title>RegBruker</title>
    </head>
    <body>
        
        <form:form class = "form-horizontal" method="POST" modelAttribute="nyBrukerForm" action="nyBruker">
            
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
function sjekkMail2(theForm){
if (document.getElementById('nymail1') !== null && document.getElementById('nymail1').value !== document.getElementById('nymail2').value){
    alert('Mailadressen ble ikke gjentatt korrekt');
    return false;
    }
   
    else {
    return true;
    }
}
</script>

<script type="text/javascript">
    function sjekkPassord2(theForm){
         if(document.getElementById('nyttpw1') !== null && document.getElementById('nyttpw1').value !== document.getElementById('nyttpw2').value){
        alert('Passordet ble ikke gjentatt korrekt');
        return false;
        }
        else{
            return true;
        }
    }
</script>

<script> 
function validerMail2(inputMail, inputMail2) {
if (inputMail.value !== inputMail2.value || inputMail.value === '' || inputMail2.value === '') {
    inputMail2.setCustomValidity('Feil E-Mail');
} else {
    inputMail2.setCustomValidity('');
}
}
</script>

<script> 
function validerPassord2(inputPassword, inputPassword2) {
if (inputPassword.value !== inputPassword2.value || inputPassword.value === '' || inputPassword2.value === '') {
    inputPassword2.setCustomValidity('Feil passord');
} else {
    inputPassword2.setCustomValidity('');
}
}
</script>
            
            <div class="container ">
                <div class="row col-lg-8">
                    <h1 class="col-lg-12">Registrer ny bruker</h1>
                    <div class ="col-lg-12 well">
                        <div class="form-group">
                            <label for="BrukernavnLabel" class="col-lg-2 control-label">Brukernavn</label>
                            <div class="col-lg-10">
                                <input path="bruker.brukernavn" name="brukernavn" class="form-control" id="inputBruker" placeholder="Brukernavn" pattern="^[a-zA-Z][a-zA-Z0-9-_\.]{1,20}$" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="BrukertypeLabel"  class="col-lg-2 control-label">Brukertype</label>
                            <div class="col-lg-10">
                                <input path="bruker.brukertype" name="brukertype" class="form-control" id="inputBrukertype" placeholder="Brukertype" pattern="[0-3]{1}" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="NavnLabel"  class="col-lg-2 control-label">Navn</label>
                            <div class="col-lg-10">
                                <input path="bruker.navn" name="navn" class="form-control" id="InputNavn" placeholder="Navn" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="PassordLabel"  class="col-lg-2 control-label">Passord</label>
                            <div class="col-lg-10">
                                <input path="bruker.passord" name="passord" class="form-control" id="inputPassword" placeholder="Passord" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="PassordLabel2"  class="col-lg-2 control-label">Bekreft Passord</label>
                            <div class="col-lg-10">
                                <input name="passord2" class="form-control" id="inputPassword2" placeholder="Bekreft Passord" onfocus="validerPassord2(document.getElementById('inputPassword'), this);" oninput="validerPassord2(document.getElementById('inputPassword'), this);" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="MailLabel"  class="col-lg-2 control-label">E-Mail</label>
                            <div class="col-lg-10">
                                <input type="email" path="bruker.mail" name="mail" class="form-control" id="inputMail" placeholder="Mail" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="MailLabel2"  class="col-lg-2 control-label">Bekreft E-Mail</label>
                            <div class="col-lg-10">
                                <input type="email" name="mail2" class="form-control" id="inputMail2" onfocus="validerMail2(document.getElementById('inputMail'), this);" oninput="validerMail2(document.getElementById('inputMail'), this);" placeholder="Bekreft Mail" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-6 col-sm-offset-2">
                                <button type="submit" class="btn btn-primary">Send</button>
                            </div>
                        </div>  


                    </form:form>

                    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.1/js/bootstrap-datepicker.min.js"></script>

                    <script type="text/javascript">

            </body>
                    </html>