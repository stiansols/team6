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