<%-- 
    Document   : testEtasje
    Created on : Jan 14, 2016, 11:48:26 AM
    Author     : Seva
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="http://davidlynch.org/projects/maphilight/jquery.maphilight.js"></script>


<c:if test="${etasjeLink == 'http://www.mediafire.com/convkey/9236/736fif9tr2s21zczg.jpg'}">
    <c:set var="etasje" value="1"/>
</c:if>
<c:if test="${etasjeLink == 'http://www.mediafire.com/convkey/1183/670c89ehc1w9b2ozg.jpg'}">
    <c:set var="etasje" value="2"/>
</c:if>
<c:if test="${etasjeLink == 'http://www.mediafire.com/convkey/64b7/ate3wife1pm8yskzg.jpg'}">
    <c:set var="etasje" value="3"/>
</c:if>
<c:if test="${etasjeLink == 'http://www.mediafire.com/convkey/6543/kbjzj4ijm88nlv4zg.jpg'}">
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
        
        <img width="100%" id="img_ID" src="<c:url value="${etasjeLink}" />" usemap="#rommap"/>
        
        
        <map name="rommap" id="map_ID">
            <c:forEach items="${alleRom}" var="rom">
                <c:if test="${etasje == rom.getEtasje()}">
                    <area shape="${rom.getShape()}" class="romskisse" coords="${rom.getCoords()}" alt="${rom.getRomnr()}" onclick="onClickRom(${rom.getRomnr()}, ${rom.getEtasje()}, ${rom.getPlasser()}, ${rom.getHarSmartboard()}, ${rom.getHarSkjerm()})">
                </c:if>
            </c:forEach>
            
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
    
    $('#img_ID').maphilight();
    
            
    
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
        $(".modal-body #romnr").val( romnr );
        $(".modal-body #etasje").val( etasje );
        $(".modal-body #plasser").val( plasser );
        $(".modal-body #smartboard").val( smartboard );
        $(".modal-body #skjerm").val( skjerm );
        $('#visRomModal').modal('show');
    }

</script>