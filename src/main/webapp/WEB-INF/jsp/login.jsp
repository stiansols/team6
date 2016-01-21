<%-- 
    Document   : login
    Created on : 08.jan.2016, 09:42:34
    Author     : Archimedes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>StudyEasy - Logg inn</title>

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">

        <style>
            body {
                background: url('https://lh6.googleusercontent.com/e9YcgNIFBlE6fgrAezVJgv7rBfoojWkDKv-58hRDlw4uzVEnr3TPgjc9Uelrfx7BbQzGZYI_IJZNkiuddzxhWm9Rh3dK6U9k9im0CG80kqJrphASnnt1CCyRCUKuSN4fNEE2Vc4h') no-repeat center center fixed;
                background-size: cover
            } 
            .wrap {
                margin-top: 19%;
            }
            h1 {
                text-align: center;
                color: white;
                text-shadow: -2px 0 black, 0 2px black, 2px 0 black, 0 -2px black;
                font-family: "Tahoma", sans-serif;
                font-size: 300%;
                padding-bottom: 2%
            }
            #ntnu {
                margin-top: 20px;
                width: 10%;
            }
        </style>



    </head>
    <body>
        <img id="ntnu" src="https://lh5.googleusercontent.com/d6SKp32RCf5drN5IQ_XBxNUwMXQa6ut8VYqf96U7C9Y_ApdPXcMiyZlO7taGAjSr8p2AlVxvkvz6b21DpnDKTAbrLx8q3yCqAdB8b1KYosW3NoiTje2-cw1JKiX_z4AVhzYoQWEV"/>          

        <form:form class="form-horizontal" method="POST" modelAttribute="personForm" name="innlogging" action="spam" >
            <div class="container">

                <div class="wrap">
                    <h1>StudyEasy</h1>
                    <div class="row">
                        <div class ="col-lg-4 col-lg-offset-4 well">
                            <div class="form-group">
                                <label for="brukerLabel" class="col-lg-4 control-label">Brukernavn</label>
                                <div class="col-lg-6">
                                    <input type="brukernavn" path="bruker.brukernavn" name="brukernavn" class="form-control" id="inputEmail3" placeholder="Brukernavn" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="passLabel"  class="col-lg-4 control-label">Passord</label>
                                <div class="col-lg-6">
                                    <input type="password" path="bruker.passord" name="passord" class="form-control" id="inputPassword3" placeholder="Passord" required>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-lg-offset-4 col-sm-6">
                                    <button type="submit" class="btn btn-primary">Logg inn</button>
                                </div>
                            </div>  

                        </form:form> 
                    </div>
                </div>
            </div>
        </div>

        <div class="footer" >


        </div>

        <!-- Latest compiled and minified JavaScript -->
        <script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    </body>

</html>
