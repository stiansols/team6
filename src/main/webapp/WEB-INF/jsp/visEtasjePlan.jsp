<%-- 
    Document   : testEtasje
    Created on : Jan 14, 2016, 11:48:26 AM
    Author     : Seva
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="http://davidlynch.org/projects/maphilight/jquery.maphilight.js"></script>

<c:out value="${etasjeLink}" />

<html>

    <body>
        <img id="etasjePlan" src="<c:url value="${etasjeLink}" />" usemap="#rommap"/>
        
        <map name="rommap">
            <area shape="rect" coords="38,63,144,257" href="index" alt="Verksted">
            <area shape="rect" coords="150,63,265,257" href="index" alt="Verksted">
        </map>
    </body>
    
    <script>
        $('#etasjePlan').maphilight();
    </script>
</html>