<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title><tiles:insertAttribute name="title" ignore="true" /></title>
            
            <!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
	
            <style>
            .grey{
                    background-color: #CCC;
                    padding: 20px;
            }
            div#header {
                width: 100%;
                height: 100px;
                background: no-repeat 0 0;
                
            }
            </style> 
            
    </head>
    <body>
        <div class="header">
            <img src="http://download1650.mediafire.com/66e0zq6jtwug/s6y1bxm3a3wbijb/StudyEasy.png"/>
            
        </div>
          <div class="container">
			<div class="row">
				<div class="col-lg-3">
                                    <div class="well col-lg-12"><tiles:insertAttribute name="menu" /></div>
				</div> 
                                
                         <div class="col-lg-8 col-lg-offset-1">
                                        
				<tiles:insertAttribute name="body" />
				
                                    </div>
                                
                        </div>
                             
                
          </div>
                            <!-- Latest compiled and minified JavaScript -->
	<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    </body>
</html>
