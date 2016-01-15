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
            <area shape="poly" coords="270, 62, 286, 62, 287, 26, 575, 26, 575,57,594,58, 594,256,375,256,375, 177, 269, 177" href="index" alt="Lab122">
            <area shape="rect" coords="308,535, 406,649" href="index" alt="112">
            <area shape="rect" coords="491,535, 589,641" href="index" alt="113">
            <area shape="rect" coords="587,542, 680, 640" href="index" alt="114">
            <area shape="rect" coords="683,542, 769, 648" href="index" alt="115">
            <area shape="poly" coords="597,183,755,183, 755,134, 658,134, 658,56, 597, 56" href="index" alt="Lab123">
            <area shape="rect" coords="38,537,130,765" href="index" alt="119A">
            <area shape="rect" coords="39,764,130,977" href="index" alt="109Kjøkken">
            <area shape="poly" coords="1041,380,1216,420,1201,501,1021,464" href="index" alt="184Møterom">
            <area shape="rect" coords="38, 267, 381, 532" href="index" alt="Dataundervisning119">
            <area shape="rect" coords="131, 802, 219, 976" href="index" alt="Grupperom108">
            <area shape="rect" coords="222, 802, 311, 976" href="index" alt="Grupperom107">
            <area shape="rect" coords="313, 802, 402, 976" href="index" alt="Grupperom106">
            <area shape="rect" coords="404, 802, 493, 976" href="index" alt="Grupperom105">
            <area shape="rect" coords="495, 802, 584, 976" href="index" alt="Grupperom104">
            <area shape="rect" coords="586, 802, 675, 976" href="index" alt="Grupperom103">
            <area shape="rect" coords="677, 802, 766, 976" href="index" alt="Grupperom102">
            <area shape="poly" coords="1420, 265, 1545, 292, 1518, 422, 1391, 395" href="index" alt="MoteromBR168">
        </map>
    </body>
    
    <script>
        $('#etasjePlan').maphilight();
    </script>
</html>