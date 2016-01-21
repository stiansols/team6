<%@ page import="Klasser.Rom" %>
<%--
  Created by IntelliJ IDEA.
  User: Roger
  Date: 15.01.2016
  Time: 13.00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
    <head>
        <title>RomOrganisering</title>
    </head>
    <body>
        <br>
        <br>
        <div class="row">
            <div class="col-sm-8">
                <div>
                    <fieldset class="ramme">
                        <legend class="ramme">Romoversikt:</legend>
                        <table id="romTabell" class="table table-hover table-bordered results">
                            <thead>
                            <tr>
                                <th>Romnummer</th>
                                <th>Etasje</th>
                                <th>Plasser</th>
                                <th>Har Smartboard</th>
                                <th>Har Skjerm</th>
                                <th>Har Prosjektor</th>
                                <th>Har tilgang</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${alleRom}" var="rom">
                                <tr>
                                    <td>${rom.romnr}</td>
                                    <td>${rom.etasje}</td>
                                    <td>${rom.plasser}</td>
                                    <td>${rom.harSmartboard}</td>
                                    <td>${rom.harSkjerm}</td>
                                    <td>${rom.harProsjektor}</td>
                                    <td>${rom.tilgang}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </fieldset>
                </div>
            </div>
            <div class="col-sm-4">
                <div>
                    <form>
                        <input type="text" size="30" placeholder="Søk romnr" onkeyup="showResult(this.value)">
                        <div id="livesearch"></div>
                    </form>
                    <br>
                    <h3>Antall plasser:</h3> <span id="range">0</span>
                    <input type="range" min="0" max="100" value="0" step="5" onchange="showValue(this.value)" />
                </div>
                <fieldset class="ramme">
                    <legend class="ramme">Utstyr</legend>
                    <div class="check-box"><label><input type="checkbox" value="">Skjerm</label></div>
                    <div class="check-box"><label><input type="checkbox" value="">Smartboard</label></div>
                    <div class="check-box"><label><input type="checkbox" value="">Prosjektor</label></div>
                </fieldset>
                <br>
                <br>
            </div>
        </div>
    </body>
</html>
<style>
    body { font-size: 2em; /* Sets base font size to 16px */ }
    ol.tree
    {
        padding: 0 0 0 30px;
        width: 300px;
    }
    li
    {
        position: relative;
        margin-left: -15px;
        list-style: none;
    }
    li.file
    {
        margin-left: -1px !important;
    }
    li.file a
    {
        background: url(http://bildr.no/image/YjFDVlJq.jpeg) 0 0 no-repeat;
        padding-left: 21px;
        text-decoration: none;
        display: block;
    }
    li.file a[href *= '.pdf']	{ background: url(http://bildr.no/image/YjFDVlJq.jpeg) 0 0 no-repeat; }
    li input
    {
        position: absolute;
        left: 0;
        margin-left: 0;
        opacity: 0;
        z-index: 2;
        cursor: pointer;
        height: 1em;
        width: 1em;
        top: 0;
    }
    li input + ol
    {
        background: url(http://bildr.no/image/VEM5aXB1.jpeg) 40px 0 no-repeat;
        margin: -0.938em 0 0 -44px; /* 15px */
        height: 1em;
    }
    li input + ol > li { display: none; margin-left: -14px !important; padding-left: 1px; }
    li label
    {
        background: url(http://bildr.no/image/aTVZTlB5.jpeg) 15px 1px no-repeat;
        cursor: pointer;
        display: block;
        padding-left: 37px;
    }

    li input:checked + ol
    {
        background: url(http://bildr.no/image/REpiZ096.jpeg) 40px 5px no-repeat;
        margin: -1.25em 0 0 -44px; /* 20px */
        padding: 1.563em 0 0 80px;
        height: auto;
    }
    li input:checked + ol > li { display: block; margin: 0 0 0.125em;  /* 2px */}
    li input:checked + ol > li:last-child { margin: 0 0 0.063em; /* 1px */ }

    fieldset.ramme {
        border: 1px groove #ddd !important;
        padding: 0 1.4em 1.4em 1.4em !important;
        margin: 0 0 1.5em 0 !important;
    }

    legend.ramme {
        width:inherit;
        padding:0 10px;
        border-bottom:none;
    }
</style>
<div class="container">
    <!-- Modal -->
    <div class="modal fade" id="oppdaterRom" role="dialog" style="z-index: 1500">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Endre Rom</h4>
                </div>
                <form:form method="post" modelAttribute="form" name="romForm" action="romOrganisering">
                    <div class="modal-body">
                        <div class="Row"><label class="control-label">Romnr:</label>
                            <input type="text" name="romnr" id="romnr" value="" readonly>
                        </div>
                        <div class="Row"><label class="control-label">Etasje:</label>
                            <input type="text" name="etasje" id="etasje" value="">
                        </div>
                        <div class="Row"><label class="control-label">Plasser:</label>
                            <input type="text" name="plasser" id="plasser" value="">
                        </div>
                        <div class="Row"><label class="control-label">Smartboard:
                            <input type="checkbox" name="harSmartboard" id="smartboard"></label>
                        </div>
                        <div class="Row"><label class="control-label">Skjerm:
                            <input type="checkbox" name="harSkjerm" id="skjerm"></label>
                        </div>
                        <div class="Row"><label class="control-label">Prosjektor:
                            <input type="checkbox" name="harProsjektor" id="prosjektor"></label>
                        </div>
                        <div class="Row"><label class="control-label">Tilgang: </label>
                            <input type="text" name="tilgang" id="tilgang" value="">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-default" formaction="oppdaterrom">Oppdater rom</button>
                        <button type="submit" class="btn btn-default" formaction="slettRom">Slett rom</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Lukk</button>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>
<script>
    function onClickEndreRom() {
        var table = document.getElementById("romTabell");
        var rows = table.getElementsByTagName("tr");
        for (i = 0; i < rows.length; i++) {
            var currentRow = table.rows[i];
            var createClickHandler = function (row) {
                    return function () {
                        var cell = row.getElementsByTagName("td")[0];
                        var cell2 = row.getElementsByTagName("td")[1];
                        var cell3 = row.getElementsByTagName("td")[2];
                        var cell4 = row.getElementsByTagName("td")[3];
                        var cell5 = row.getElementsByTagName("td")[4];
                        var cell6 = row.getElementsByTagName("td")[5];
                        var cell7 = row.getElementsByTagName("td")[6];


                        var romnr = cell.innerHTML;
                        var etasje = cell2.innerHTML;
                        var plasser = cell3.innerHTML;
                        var harSmartboard = cell4.innerHTML;
                        var harSkjerm = cell5.innerHTML;
                        var harProsjektor = cell6.innerHTML;
                        var tilgang = cell7.innerHTML;

                        if(harSmartboard == "true") {
                            document.getElementById("smartboard").checked = "checked";
                        }else {
                            document.getElementById("smartboard").removeAttribute("checked");
                        }

                        //alert("id:" + id);
                        $(".modal-body #romnr").val( romnr );
                        $(".modal-body #etasje").val( etasje );
                        $(".modal-body #plasser").val( plasser );
                        $(".modal-body #harSmartboard").val( harSmartboard );
                        $(".modal-body #harSkjerm").val( harSkjerm );
                        $(".modal-body #harProsjektor").val( harProsjektor );
                        $(".modal-body #tilgang").val( tilgang );
                        $('#oppdaterRom').modal('show');


                    };
                };

            currentRow.onclick = createClickHandler(currentRow);
        }
    }
    window.onload = onClickEndreRom();

    harSmartboard = $("#smartboard").is(":checked");                    //Sender verdi av checkboxen videre
    harSkjerm = $("#skjerm").is(":checked");
    harProsjektor = $("#prosjektor").is(":checked");

    function showValue(newValue) {
        document.getElementById("range").innerHTML=newValue;
    }

</script>