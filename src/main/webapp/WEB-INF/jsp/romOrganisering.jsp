<%--
  Created by IntelliJ IDEA.
  User: Roger
  Date: 15.01.2016
  Time: 13.00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>4
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
                <ol class="tree">
                    <li>
                        <label for="folder1">1.Etasje</label> <input type="checkbox" id="folder1" />
                        <ol>
                            <c:forEach items="${romForste}" var="rom1">
                            <li class="file"><a href="#">${rom1.romnr}</a></li>
                            </c:forEach>
                        </ol>

                        <label for="folder2">2.Etasje</label> <input type="checkbox" id="folder2" />
                        <ol>
                            <c:forEach items="${romAndre}" var="rom2">
                            <li class="file"><a href="#">${rom2.romnr}</a></li>
                            </c:forEach>
                        </ol>

                        <label for="folder3">3.Etasje</label> <input type="checkbox" id="folder3" />
                        <ol>
                            <c:forEach items="${romTredje}" var="rom3">
                            <li class="file"><a href="#">${rom3.romnr}</a></li>
                            </c:forEach>
                        </ol>

                        <label for="folder4">4.Etasje</label> <input type="checkbox" id="folder4" />
                        <ol>
                            <c:forEach items="${romFjerde}" var="rom4">
                            <li class="file"><a href="#">${rom4.romnr}</a></li>
                            </c:forEach>
                        </ol>
                    </li>
                </ol>
            </div>
            <div class="col-sm-4">
                Something something søkefunksjon
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
</style>