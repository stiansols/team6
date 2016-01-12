<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

   <!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
	
    </head>
    
    <body>

            <form class="form-horizontal">
              <div class="form-group">
                <label for="romnrlabel" class="col-sm-2 control-label">Romnummer</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control" id="romnrInput" placeholder="">
                </div>
              </div>
              <div class="form-group">
                <label for="fratidLabel" class="col-sm-2 control-label">Fratid</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control" id="fratidInput" placeholder="">
                </div>
              </div>
               <div class="form-group">
                <label for="tiltidLabel" class="col-sm-2 control-label">Tiltid</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control" id="tilTidInput" placeholder="">
                </div>
              </div>
              
              <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                  <button type="submit" class="btn btn-default">Send</button>
                </div>
              </div>
            </form>
        
        
                          <!-- Latest compiled and minified JavaScript -->
	<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        
           </body>
</html>
