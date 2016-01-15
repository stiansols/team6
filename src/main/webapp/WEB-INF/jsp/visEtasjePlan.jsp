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
            <c:forEach items="${alleRom}" var="rom">
                <area shape="${rom.getShape()}" class="romskisse" coords="${rom.getCoords()}" alt="${rom.getRomnr()}" onclick="onClickRom(rom)">
            </c:forEach>
            <area shape="rect" class="romskisse" coords="38,63,144,257" alt="Verksted" onclick="onClickRom()">
            <area shape="rect" class="romskisse" coords="150,63,265,257" href="index" alt="Verksted">
            <area shape="poly" class="romskisse" coords="270, 62, 286, 62, 287, 26, 575, 26, 575,57,594,58, 594,256,375,256,375, 177, 269, 177" href="index" alt="Lab122">
            <area shape="rect" class="romskisse" coords="308,535, 406,649" href="index" alt="112">
            <area shape="rect" class="romskisse" coords="491,535, 589,641" href="index" alt="113">
            <area shape="rect" class="romskisse" coords="587,542, 680, 640" href="index" alt="114">
            <area shape="rect" class="romskisse" coords="683,542, 769, 648" href="index" alt="115">
            <area shape="poly" class="romskisse" coords="597,183,755,183, 755,134, 658,134, 658,56, 597, 56" href="index" alt="Lab123">
            <area shape="rect" class="romskisse" coords="38,537,130,765" href="index" alt="119A">
            <area shape="rect" class="romskisse" coords="39,764,130,977" href="index" alt="109Kjøkken">
            <area shape="poly" class="romskisse" coords="1041,380,1216,420,1201,501,1021,464" href="index" alt="184Møterom">
            <area shape="rect" class="romskisse" coords="38, 267, 381, 532" href="index" alt="Dataundervisning119">
            <area shape="rect" class="romskisse" coords="131, 802, 219, 976" href="index" alt="Grupperom108">
            <area shape="rect" class="romskisse" coords="222, 802, 311, 976" href="index" alt="Grupperom107">
            <area shape="rect" class="romskisse" coords="313, 802, 402, 976" href="index" alt="Grupperom106">
            <area shape="rect" class="romskisse" coords="404, 802, 493, 976" href="index" alt="Grupperom105">
            <area shape="rect" class="romskisse" coords="495, 802, 584, 976" href="index" alt="Grupperom104">
            <area shape="rect" class="romskisse" coords="586, 802, 675, 976" href="index" alt="Grupperom103">
            <area shape="rect" class="romskisse" coords="677, 802, 766, 976" href="index" alt="Grupperom102">
            <area shape="poly" class="romskisse" coords="1420, 265, 1545, 292, 1518, 422, 1391, 395" href="index" alt="MoteromBR168">
        </map>

        <div class="container">
            <!-- Modal -->
            <div class="modal fade" id="visRomModal" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Rom XXX</h4>
                        </div>
                        <div class="modal-body">

                            <div class="row">
                                <label for="romnummerLabel" class="col-lg-4 control-label">Romnummer</label>
                                <div class="col-lg-8">
                                    <input type="text" name="romnr" id="romnr" value="" readonly/>
                                </div>
                            </div>

                            <div class="row">
                                <label for="etasjeLabel" class="col-lg-4 control-label">Etasje</label>
                                <div class="col-lg-8">
                                    <input type="text" name="etasje" id="etasje" value="" readonly/>
                                </div>
                            </div>

                            <div class="row">
                                <label for="navnLabel" class="col-lg-4 control-label">Plasser</label>
                                <div class="col-lg-8">
                                    <input type="text" name="plasser" id="plasser" value=""/>
                                </div>
                            </div>      

                            <div class="row">
                                <label for="passLabel" class="col-lg-4 control-label">Har Smartboard</label>
                                <div class="col-lg-8">
                                    <input type="checkbox" name="smartboard" id="smartboard" value=""/>
                                </div>
                            </div>

                            <div class="row">
                                <label for="mailLabel" class="col-lg-4 control-label">Har Dataskjerm</label>
                                <div class="col-lg-8">
                                    <input type="text" name="skjerm" id="skjerm" value=""/>
                                </div>
                            </div>



                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-default" formaction="oppdater">Book rom</button>
                            <button type="submit" class="btn btn-default" formaction="oppdater">Endre booking</button> 
                            <button type="submit" class="btn btn-default" formaction="slett">Slett booking</button>

                            <button type="button" class="btn btn-default" data-dismiss="modal">Lukk</button>
                        </div>

                    </div>

                </div>
            </div>

        </div>        


    </body>

    <script>
        $('#etasjePlan').maphilight();
    </script>
</html>

<script>
    function onClickRom(Rom rom) {
        alert(rom.getRomnr());
        $('#visRomModal').modal('show');

    }

</script>