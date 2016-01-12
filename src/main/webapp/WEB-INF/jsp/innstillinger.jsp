<%--
  Created by IntelliJ IDEA.
  User: Roger
  Date: 12.01.2016
  Time: 10.19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<html>
    <head>
        <title><tiles:insertAttribute name="title" ignore="true" /></title>
    </head>
    <body>
    <div class="jumbotron vertical-center">
        <div class="panel panel-default">
            <div class="panel-body">Kalender
                <button type="button" class="btn btn-default col-lg-12 col-xs-12">Endre farge</button>
                <button type="button" class="btn btn-default col-lg-12 col-xs-12">Endre oppsett</button>
            </div>
        </div>
        <br>
        <div class="panel panel-default">
            <div class="panel-body">Booking
                <button type="button" class="btn btn-default col-lg-12 col-xs-12">...</button>
            </div>
        </div>
        <br>
        <div class="panel panel-default">
            <div class="panel-body">Bruker
                <button type="button" class="btn btn-default col-lg-12 col-xs-12">...</button>
            </div>
        </div>
        <br>
        <div class="panel panel-default">
            <div class="panel-body">Generelt
                <button type="button" class="btn btn-default col-lg-12 col-xs-12">Skift språk</button>
            </div>
        </div>
    </div>
    </body>
</html>