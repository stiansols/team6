<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
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
            #header {
                max-width: 100%;
                max-height: 100px;
                min-width: 100%;

            }
        </style> 

    </head>
    <body>
        <a href="<c:url value="index"/>"><img id="header" src="http://imageshack.com/a/img908/3876/vwWGkb.png"/></a>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-2">
                    <div class="well col-lg-12"><tiles:insertAttribute name="menu" /></div>
                </div> 

                <div class="col-lg-9">

                    <tiles:insertAttribute name="body" />

                </div>

            </div>


        </div>
        <!-- Latest compiled and minified JavaScript -->
        <script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    </body>
</html>
