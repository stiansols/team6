<%@ page import="Klasser.Bruker" %><%--
  Created by IntelliJ IDEA.
  User: Roger
  Date: 12.01.2016
  Time: 14.34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
    <head>
        <title><tiles:insertAttribute name="title" ignore="true" /></title>
        <style>
            .panel-group {
                margin-left: 20%;
                text-align: left;                
            }
            button {
                margin-top: 5px;
            }
            #passTab td {
                padding-right: 10px;
            }
        </style>
    </head>
    <body>
        <div class="jumbotron vertical-center">
            <div class=" container text-center">
                <img src="http://bildr.no/image/Tkt2ckNa.jpeg"/>
                <br>
                <br>
                <br>
                <div>Navn: ${person.getNavn()}</div>
                <div>Brukernavn: ${person.getBrukernavn()} </div>
                <div>E-post: ${person.getMail()} </div>
                <div>Brukertype: ${person.printBrukerType()}</div>
                <div hidden="true">Passord:<input type="password" disabled="true" placeholder="*************"></div>
                <br>
                <br>
                <div class="panel-group">
                    <button href="#" id="ab" class="btn btn-default">  Mine abonnementer  </button>
                    <br/>
                    <button href="#" id="bok" class="btn btn-default">  Mine Bookinger  </button>
                </div>
            </div>
        </div>
    </body>
</html>
