<%-- 
    Document   : testEtasje
    Created on : Jan 14, 2016, 11:48:26 AM
    Author     : Seva
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="http://davidlynch.org/projects/maphilight/jquery.maphilight.js"></script>


<c:if test="${etasjeLink[0] == 'http://www.mediafire.com/convkey/4033/d5amxa19msuu4x99g.jpg'}">
    <c:set var="etasje" value="1"/>
</c:if>
<c:if test="${etasjeLink[0] == 'http://www.mediafire.com/convkey/f168/lmwe83xtax53qdh9g.jpg'}">
    <c:set var="etasje" value="2"/>
</c:if>
<c:if test="${etasjeLink[0] == 'http://www.mediafire.com/convkey/6d08/5gaam91oken79zm9g.jpg'}">
    <c:set var="etasje" value="3"/>
</c:if>
<c:if test="${etasjeLink[0] == 'http://www.mediafire.com/convkey/d436/3cz4at4dbhuohpm9g.jpg'}">
    <c:set var="etasje" value="4"/>
</c:if>

<html>
    <style>
        .modal-backdrop {
            z-index: 1020;
        }
    </style>
    <body>
        <ul class="pager">
            <li><a href="/StudyEasy/romOversikt">Tilbake til etasjevisning</a></li>
        </ul>
        
        <form id="endreDato" class="form-inline" role="form" action="etasjeVis" method="POST" >
            <div class="form-group">
                <label for="datoFra">Fra:</label>
                <input type="date" path="fratid" name = "datoFra" class="form-control"  id="datoFra" value="${etasjeLink[1]}"/>
            </div>
            <div class="form-group">
                <label for="tidFra">Tid:</label>
                <input type="text" name="tidFra" class="form-control" id="tidFra" value="${etasjeLink[2]}">
            </div>
            <div class="form-group">
                <label for="tidTil">Tid:</label>
                <input type="text" name="tidTil" class="form-control" id="tidTil" value="${etasjeLink[3]}">
            </div>
            <button type="button" class="btn btn-default" onclick="onChangeDato()">OK</button>
            <input id="etasje" type='hidden' name='etasje' value="${etasje}">
            <input type='hidden' name='fradato'>
            <input type='hidden' name='fratid'>
            <input type='hidden' name='tiltid'>
            <input type='hidden' name='romnr'>
        </form>
        
        <img width="100%" id="img_ID" src="<c:url value="${etasjeLink[0]}" />" usemap="#rommap"/>


        <map name="rommap" id="map_ID">
            <c:forEach items="${alleRom}" var="rom">
                <c:if test="${etasje == rom.getEtasje()}">
                    <c:set var="mapData" value='{"fillColor":"00FF21"}'/>
                    <c:forEach items="${etasjeLink[4]}" var="romnummer">
                        <c:if test="${rom.getRomnr() == romnummer}">
                            <c:set var="mapData" value='{"fillColor":"ff0000"}'/>
                        </c:if>
                    </c:forEach>
                    
                    <area data-maphilight='${mapData}' shape="${rom.getShape()}" class="romskisse"  coords="${rom.getCoords()}" alt="${rom.getRomnr()}" onclick="onClickRom(${rom.getRomnr()}, ${rom.getEtasje()}, ${rom.getPlasser()}, ${rom.getHarSmartboard()}, ${rom.getHarSkjerm()})">
                </c:if>
            </c:forEach>
                    <area id="area120" shape="rect" class="romskisse" coords="800,370,900,470" data-maphilight='{"fillColor":"ff0000", "alwaysOn":false}'>
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

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.1/js/bootstrap-datepicker.min.js"></script>

    <script type="text/javascript">

        $('#datoFra').datepicker({
                format: 'dd-mm-yyyy'
            });
    </script>
    
    <script>
        $('#img_ID').maphilight();
    </script>
    <script>
        
        function onChangeDato() { 
            var datoFraInput = document.getElementById("datoFra");
            var tidFraInput = document.getElementById("tidFra");
            var tidTilInput = document.getElementById("tidTil");
            $.getJSON("getBig", {"dato": datoFraInput.value + "-" + tidFraInput.value + ":" + datoFraInput.value + "-" + tidTilInput.value}, function(d) {
                var parsedData = JSON.parse(JSON.stringify(d));

                var alleRomnr = "";
                for(j=0; j<parsedData.length; j++) {
                    alleRomnr = alleRomnr + parsedData[j] + ",";
                }
                document.forms["endreDato"]["romnr"].value = alleRomnr;
                document.forms["endreDato"]["etasje"].value = document.getElementById("etasje").value;
                document.forms["endreDato"]["fradato"].value = document.getElementById("datoFra").value;
                document.forms["endreDato"]["fratid"].value = document.getElementById("tidFra").value;
                document.forms["endreDato"]["tiltid"].value = document.getElementById("tidTil").value;
                document.forms["endreDato"].submit();
            });

        }

    </script>
    <script>

        window.onload = function () {
            var ImageMap = function (map, img) {
                var n,
                        areas = map.getElementsByTagName('area'),
                        len = areas.length,
                        coords = [],
                        previousWidth = 1920;
                for (n = 0; n < len; n++) {
                    coords[n] = areas[n].coords.split(',');
                }
                this.resize = function () {
                    var n, m, clen,
                            x = img.offsetWidth / previousWidth;
                    for (n = 0; n < len; n++) {
                        clen = coords[n].length;
                        for (m = 0; m < clen; m++) {
                            coords[n][m] *= x;
                        }
                        areas[n].coords = coords[n].join(',');
                    }
                    previousWidth = document.body.clientWidth;
                    return true;
                };

            },
                    imageMap = new ImageMap(document.getElementById('map_ID'), document.getElementById('img_ID'));
            imageMap.resize();
            return;
        };

    </script>
</html>

<script>
    function onClickRom(romnr, etasje, plasser, smartboard, skjerm) {
        $(".modal-body #romnr").val(romnr);
        $(".modal-body #etasje").val(etasje);
        $(".modal-body #plasser").val(plasser);
        $(".modal-body #smartboard").val(smartboard);
        $(".modal-body #skjerm").val(skjerm);
        $('#visRomModal').modal('show');
    }

</script>
