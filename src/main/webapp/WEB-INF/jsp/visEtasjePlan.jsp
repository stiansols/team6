<%-- 
    Document   : testEtasje
    Created on : Jan 14, 2016, 11:48:26 AM
    Author     : Seva
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script src="//code.jquery.com/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.1/css/datepicker.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://davidlynch.org/projects/maphilight/jquery.maphilight.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<html>
    <style>
        .modal-backdrop {
            z-index: 1020;
        }
        .col-lg-8 > input {
            border: 0px solid;
            background-color: #FFFFFF;
        }
        
    </style>
    <body>
        <ul class="pager">
            <li><a href="/StudyEasy/romOversikt">Tilbake til etasjevisning</a></li>
        </ul>
        
        <form id="endreDato" class="form-inline" role="form" action="etasjeVis" method="POST" >
            <div class="form-group">
                <label for="datoFra">Dato:</label>
                <input path="fratid" name = "datoFra" class="form-control"  id="datoFra" for="datoFra" value="${etasjeLink[1]}"/>
            </div>
            <div class="form-group">
                <label for="tidFra">Fra:</label>
                <input type="text" name="tidFra" class="form-control" id="tidFra" value="${etasjeLink[2]}">
            </div>
            <div class="form-group">
                <label for="tidTil">Til:</label>
                <input type="text" name="tidTil" class="form-control" id="tidTil" value="${etasjeLink[3]}">
            </div>
            <button type="button" class="btn btn-default" onclick="onChangeDato()">OK</button>
            <input id="etasje" type='hidden' name='etasje' value="${etasjeLink[5]}">
            <input type='hidden' name='fradato'>
            <input type='hidden' name='fratid'>
            <input type='hidden' name='tiltid'>
            <input type='hidden' name='romnr'>
        </form>
        
        <img width="100%" id="img_ID" src="<c:url value="${etasjeLink[0]}" />" usemap="#rommap"/>


        <map name="rommap" id="map_ID">
            <c:forEach items="${alleRom}" var="rom">
                <c:if test="${etasjeLink[5] == rom.getEtasje()}">
                    <c:set var="mapData" value='{"fillColor":"00FF21"}'/>
                    <c:forEach items="${etasjeLink[4]}" var="romnummer">
                        <c:if test="${rom.getRomnr() == romnummer}">
                            <c:set var="mapData" value='{"fillColor":"ff0000"}'/>
                        </c:if>
                    </c:forEach>
                    
                    <area data-maphilight='${mapData}' shape="${rom.getShape()}" class="romskisse"  coords="${rom.getCoords()}" alt="'${rom.getRomnr()}'" onclick="onClickRom('${rom.getRomnr()}', ${rom.getEtasje()}, ${rom.getPlasser()}, ${rom.getHarSmartboard()}, ${rom.getHarSkjerm()}, ${rom.getHarProsjektor()},${rom.getTilgang()})">
                </c:if>
            </c:forEach>
        </map>

        <form:form method="POST" modelAttribute="booking" action="nyBooking">
        <div class="container">
            <!-- Modal -->
            <div class="modal fade" id="visRomModal" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Romoversikt</h4>
                        </div>
                        
                        <div class="modal-body">

                            <div class="row">
                                <label for="romnummerLabel" class="col-lg-4 control-label">Romnummer</label>
                                <div class="col-lg-8">
                                    <input type="text" name="romNummer1" id="romnr" value="" disabled/>
                                </div>
                            </div>

                            <div class="row">
                                <label for="etasjeLabel" class="col-lg-4 control-label">Etasje</label>
                                <div class="col-lg-8">
                                    <input type="text" name="etasje" id="etasje" value="" disabled/>
                                </div>
                            </div>

                            <div class="row">
                                <label for="navnLabel" class="col-lg-4 control-label">Plasser</label>
                                <div class="col-lg-8">
                                    <input type="text" name="plasser" id="plasser" value="" disabled/>
                                </div>
                            </div>      

                            <div class="row">
                                <label for="passLabel" class="col-lg-4 control-label">Har Smartboard</label>
                                <div class="col-lg-8">
                                    <input type="text" name="smartboard" id="smartboard" value="" disabled/>
                                </div>
                            </div>

                            <div class="row">
                                <label for="skjermLabel" class="col-lg-4 control-label">Har Dataskjerm</label>
                                <div class="col-lg-8">
                                    <input type="text" name="skjerm" id="skjerm" value="" disabled/>
                                </div>
                            </div>
                            
                            <div class="row">
                                <label for="proskeltorLabel" class="col-lg-4 control-label">Har Prosjektor</label>
                                <div class="col-lg-8">
                                    <input type="text" name="prosjektor" id="prosjektor" value="" disabled/>
                                </div>
                            </div>
                            
                            <div class="row">
                                <label for="tilgangLabel" class="col-lg-4 control-label">Romtype</label>
                                <div class="col-lg-8">
                                    <input type="text" name="tilgang" id="tilgang" value="" disabled/>
                                    <input type="text" name="brukertypene" id="brukertypene" value="${person.getBrukertype()}" style="display:none"/>
                                    <i><p id="sjekktilgang" style="color: crimson"></p></i>
                                    
                                </div>
                            </div>



                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary pull-left" data-toggle="collapse" data-target="#book" onclick="visRomplan()">Book rom</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Lukk</button>
                        </div>
                        
                        <div id="book" class="collapse1">
                            <div class="row">
                                <div class ="col-lg-10 col-lg-offset-1 well"> 
                                    <div id="romNummer" class="form-group" >
                                        <input path="romNummer" class="form-control" id="romnr1" name ="romNummer" required style="display:none"/>
                                    </div>
                                    <div class="form-group input-daterange" >
                                        <label>Dato</label>
                                        <input class="form-control" path="fratid" name = "fratid" id="datoFra1" onchange="visRomplan()"required/>
                                        <input class="form-control" type="date" path="tiltid" name = "tiltid" id="datoTil" style="display:none"/>
                                        <br>
                                        <div class="form-inline">
                                            <label>Fra</label>
                                            <select id ="fratidtimer" name="fratidtimer" required>
                                                <c:forEach items="${['06','07','08','09','10','11','12','13','14','15','16']}" var="k">
                                                    <c:if test="${fn:contains(etasjeLink[2], k)}">
                                                        <option selected="selected" value="${k}"><c:out value="${k}"/></option>
                                                    </c:if>
                                                    <c:if test="${!fn:contains(etasjeLink[2], k)}">
                                                        <option value="${k}"><c:out value="${k}"/></option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                            <select id ="fratidmin" name = "fratidmin" required>
                                                <option value="00">00</option>
                                                <option value="30">30</option>
                                            </select>

                                            <label>           Til</label>
                                            <select id ="tiltidtimer" name="tiltidtimer">
                                                <c:forEach items="${['06','07','08','09','10','11','12','13','14','15','16']}" var="k">
                                                    <c:if test="${fn:contains(etasjeLink[3], k)}">
                                                        <option selected="selected" value="${k}"><c:out value="${k}"/></option>
                                                    </c:if>
                                                    <c:if test="${!fn:contains(etasjeLink[3], k)}">
                                                        <option value="${k}"><c:out value="${k}"/></option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                            <select id ="tiltidmin" name ="tiltidmin" required>
                                                <option value="00">00</option>
                                                <option value="30">30</option>

                                            </select>
                                            <button type="submit" class="btn btn-success">Send inn</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    </form:form>
                           
                    <table class="table table-bordered table-hover pull-right" id="dagtab">
                    <tbody>
                    <tr>
                    <td class="klokkeslett" id="1">06.00-06.30</td>

                    <td class="klokkeslett" id="2">06.30-07.00</td>

                    <td class="klokkeslett" id="3">07.00-07.30</td>

                    <td class="klokkeslett" id="4">07.30-08.00</td>
        
                    <td class="klokkeslett" id="5">08.00-08.30</td>
                    </tr>
                    <tr>
                    <td class="klokkeslett" id="6">08.30-09.00</td>

                    <td class="klokkeslett" id="7">09.00-09.30</td>

                    <td class="klokkeslett" id="8">09.30-10.00</td>

                    <td class="klokkeslett" id="9">10.00-10.30</td>

                    <td class="klokkeslett" id="10">10.30-11.00</td>
                    </tr>
                    <tr>
                    <td class="klokkeslett" id="11">11.00-11.30</td>

                    <td class="klokkeslett" id="12">11.30-12.00</td>

                    <td class="klokkeslett" id="13">12.00-12.30</td>

                    <td class="klokkeslett" id="14">12.30-13.00</td>

                    <td class="klokkeslett" id="15">13.00-13.30</td>
                    </tr>
                    <tr>
                    <td class="klokkeslett" id="16">13.30-14.00</td>
 
                    <td class="klokkeslett" id="17">14.00-14.30</td>

                    <td class="klokkeslett" id="18">14.30-15.00</td>

                    <td class="klokkeslett" id="19">15.00-15.30</td>

                    <td class="klokkeslett" id="20">15.30-16.00</td>
                    </tr>
      
                    </tbody>
                    </table>
                            
                    </div>

                </div>

            </div>
        </div>

    </div>        


    </body>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.1/js/bootstrap-datepicker.min.js"></script>
    
    <script>
        $('document').ready(function(){
            $(".collapse1").collapse('hide'); 
        });
    </script>
    
    <script>
        $(".btn-primary").click(function(){
            document.getElementById('romnr1').value = document.getElementById('romnr').value;
            document.getElementById('romnr1').text = document.getElementById('romnr').text;       
        });
    </script>
   
     <script type="text/javascript">

function visRomplan(romnummer){
    var dato = $('#datoFra1').val();
    document.getElementById('romnr1').value = document.getElementById('romnr').value;
    document.getElementById('romnr1').text = document.getElementById('romnr').text;
      
    var selected = document.getElementById("romnr1").value;
    //alert (dato + " "+ selected);
    var data = '{"romnr":"'+selected+'", "dato":"'+dato+'"}';
    
    $.get("books", {"data":data}, function(Response){
        //alert(JSON.stringify(Response));
        var obj = Response;
        
        obj.reverse();
        
        for(var i=1; i<21; i++){
            if(obj.pop() === "Ledig"){
            document.getElementById("" + i).style.backgroundColor = "green";
            }
            else{
                document.getElementById("" + i).style.backgroundColor = "red";
            }
        }         
      });  
}
</script>


    <script type="text/javascript">

        $('#datoFra').datepicker({
                format: 'dd-mm-yyyy'
                
            });
            
            
    </script>
    
    <script type="text/javascript">
        $('.input-daterange input').each(function() {
            $(this).datepicker({
                format: 'dd-mm-yyyy'
            });
        });
    </script>
    
    <script>
    function visPanel(){
        $(".btn-primary").click(function(){
            $(".collapse1").collapse('toggle');
        });
    }
    </script>
    
    <script>
        $('#img_ID').maphilight();
    </script>
    <script>
        
        function onChangeDato() { 
            var datoFraInput = document.getElementById("datoFra").value;
            var tidFraInput = document.getElementById("tidFra").value;
            var tidTilInput = document.getElementById("tidTil").value;
            tidFraInput = tidFraInput.split(":")[0] + "-" + tidFraInput.split(":")[1];
            tidTilInput = tidTilInput.split(":")[0] + "-" + tidTilInput.split(":")[1];
            
            $.getJSON("getBig", {"dato": datoFraInput + "-" + tidFraInput + ":" + datoFraInput + "-" + tidTilInput}, function(d) {
                
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
    function onClickRom(romnr, etasje, plasser, smartboard, skjerm, prosjektor, tilgang) {
        $(".modal-body #sjekktilgang").text("");
        var brukertilgang = $(".modal-body #brukertypene").val();
        $(".modal-body #romnr").val(romnr);
        $(".modal-body #etasje").val(etasje);
        $(".modal-body #plasser").val(plasser);
        $(".modal-body #smartboard").val(smartboard ? "ja" : "nei");
        $(".modal-body #skjerm").val(skjerm? "ja" : "nei");
        $(".modal-body #prosjektor").val(prosjektor? "ja" : "nei");
        if(tilgang === 0){
           $(".modal-body #tilgang").val("Grupperom"); 
        }
        if(tilgang === 1){
           $(".modal-body #tilgang").val("Møterom");
           if(brukertilgang < 1){
               $(".modal-body #sjekktilgang").text("Du har ikke tilgang til å booke dette rommet");
           }
        }
        if(tilgang === 2){
           $(".modal-body #tilgang").val("Klasserom");
           if(brukertilgang < 2){
               $(".modal-body #sjekktilgang").text("Du har ikke tilgang til å booke dette rommet");
           }
        }
        
        $('#visRomModal').modal('show');
        $(".collapse1").collapse('hide');

        
        document.getElementById("datoFra1").value = document.getElementById("datoFra").value;
    }
    

</script>
