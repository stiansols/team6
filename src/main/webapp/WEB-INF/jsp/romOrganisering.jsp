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
<html>
    <head>
        <title>RomOrganisering</title>
    </head>
    <body>
        <br>
        <br>
        <div class="row">
            <div class="col-sm-8">
                <fieldset class="ramme">
                    <legend class="ramme">Romliste</legend>
                    <ol class="tree">
                        <li>
                            <label for="folder1">1.Etasje</label> <input type="checkbox" id="folder1" />
                            <ol>
                                <c:forEach items="${romForste}" var="rom1">
                                    <li class="file">
                                        <button data-toggle="collapse" data-target="#${rom1.romnr}"><a href="#">${rom1.romnr}</a></button>
                                        <div id="${rom1.romnr}" class="collapse">
                                                ${rom1.plasser}, ${rom1.harSmartboard}, ${rom1.harSkjerm}, ${rom1.harProsjektor}, ${rom1.tilgang}
                                        </div>
                                    </li>
                                </c:forEach>
                            </ol>

                            <label for="folder2">2.Etasje</label> <input type="checkbox" id="folder2" />
                            <ol>
                                <c:forEach items="${romAndre}" var="rom2">
                                    <li class="file">
                                        <button data-toggle="collapse" data-target="#${rom2.romnr}"><a href="#">${rom2.romnr}</a></button>
                                        <div id="${rom2.romnr}" class="collapse">
                                                ${rom2.plasser}, ${rom2.harSmartboard}, ${rom2.harSkjerm}, ${rom2.harProsjektor}, ${rom2.tilgang}
                                        </div>
                                    </li>
                                </c:forEach>
                            </ol>

                            <label for="folder3">3.Etasje</label> <input type="checkbox" id="folder3" />
                            <ol>
                                <c:forEach items="${romTredje}" var="rom3">
                                    <li class="file">
                                        <button data-toggle="collapse" data-target="#${rom3.romnr}"><a href="#">${rom3.romnr}</a></button>
                                        <div id="${rom3.romnr}" class="collapse">
                                                ${rom3.plasser}, ${rom3.harSmartboard}, ${rom3.harSkjerm}, ${rom3.harProsjektor}, ${rom3.tilgang}
                                        </div>
                                    </li>
                                </c:forEach>
                            </ol>

                            <label for="folder4">4.Etasje</label> <input type="checkbox" id="folder4" />
                            <ol>
                                <c:forEach items="${romFjerde}" var="rom4">
                                    <li class="file">
                                        <button data-toggle="collapse" data-target="#${rom4.romnr}"><a href="#">${rom4.romnr}</a></button>
                                        <div id="${rom4.romnr}" class="collapse">
                                                ${rom4.plasser}, ${rom4.harSmartboard}, ${rom4.harSkjerm}, ${rom4.harProsjektor}, ${rom4.tilgang}
                                        </div>
                                    </li>
                                </c:forEach>
                            </ol>
                        </li>
                    </ol>
                </fieldset>
            </div>
            <div class="col-sm-4">
                <div>
                    <input type="search" placeholder="Søk romnr">
                    <input type="search" placeholder="Søk utstyr">
                    <br>
                    <h3>Antall plasser:</h3> <span id="range">0</span>
                    <input type="range" min="0" max="100" value="0" step="5" onchange="showValue(this.value)" />
                    <script type="text/javascript">
                        function showValue(newValue)
                        {
                            document.getElementById("range").innerHTML=newValue;
                        }
                    </script>
                </div>
                <fieldset class="ramme">
                    <legend class="ramme">Utstyr</legend>
                    <div class="check-box"><label><input type="checkbox" value="">Skjerm</label></div>
                    <div class="check-box"><label><input type="checkbox" value="">Smartboard</label></div>
                    <div class="check-box"><label><input type="checkbox" value="">Prosjektor</label></div>
                </fieldset>
                <br>
                <br>
                <fieldset class="ramme">
                    <legend class="ramme">Romoversikt:</legend>
                    <c:forEach items="${romValgt}" var="rom">
                        <p>Romnummer: ${rom.romnr}</p>
                        <p>Plasser: ${rom.plasser}</p>
                        <p>Smartboard: ${rom.harSmartboard}</p>
                        <p>Skjerm: ${rom.harSkjerm}</p>
                        <p>Prosjektor: ${rom.harProsjektor}</p>
                        <p>Tilgang: ${rom.tilgang}</p>
                    </c:forEach>
                    <p>Romnummer: </p>
                    <p>Plasser: </p>
                    <p>Smartboard: </p>
                    <p>Skjerm: </p>
                    <p>Prosjektor: </p>
                    <p>Tilgang:</p>
                </fieldset>
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