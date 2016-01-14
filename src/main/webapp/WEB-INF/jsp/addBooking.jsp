<!DOCTYPE html>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
    <head>
        <script src="//code.jquery.com/jquery.min.js"></script>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.1/css/datepicker.css" rel="stylesheet" type="text/css" />

    </head>
    <body>
        <form:form method="POST" modelAttribute="booking" action="nyBooking">
            <div class="container">
                <div class="row">
                    <div class ="col-lg-4 col-lg-offset-4 well">
                        <div id="romNummer" class="form-group">
                            <label>Rom Nummer</label>
                            <input path="romNummer" class="form-control" id="romnr" name ="romnr"/>
                        </div>
                        <div class="form-group">
                            <label>Fra</label>
                            <input type="text" path="fratid" name = "fratid" class="form-control"  id="datoFra"/>
                            <span class="input-group-addon">to</span>
                            <label>Til</label>
                            <input type="text" path="tiltid" name = "tiltid" class="form-control"  id="datoTil"/>
                        </div>

                        <div class="form-group">
                            <div class="col-xs-5 col-xs-offset-3">
                                <button type="submit" class="btn btn-primary">Validate</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form:form>
        
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.1/js/bootstrap-datepicker.min.js"></script>

        <script type="text/javascript">
            
            $('.input-daterange input').each(function() {
                $(this).datepicker({
                    format: 'yyyy-mm-dd'
                });
            });
            
        </script>
    </body>
</html>