<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!--
<c:forEach items="${alleRom}" var="rom">
    ${rom}<br>
</c:forEach>
  -->  
    <!DOCTYPE html>

<html>
    <head>
        <title>Planvisning</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <style>
        .midt {
           width: 380px;
           display: block;
           margin-left: auto;
           margin-right: auto;
        }

        .midt:hover {
           width: 540px;
        }
        
        
        </style>
    </head>
    <body>
        
        <form name="valg" action='etasje' method='POST'>
        <span><img src="http://download1980.mediafire.com/pe3ymgz7hiig/3y5wa1ysyaj5ty9/Etasje4.png" alt="Boks" id="4" class="midt" onclick="visEtasje(4)"></span>
        <br>
        <span><img src="http://download1651.mediafire.com/02r19jtcm46g/30fbjp257hyss80/Etasje3.png" alt="Boks" id="3" class="midt" onclick="visEtasje(3)"></span>
        <br>
        <span><img src="http://download1648.mediafire.com/4o063jvqlh1g/y952zf20j5rfb67/Etasje2.png" alt="Boks" id="2" class="midt" onclick="visEtasje(2)"></span>
        <br>
        <span><img src="http://download1644.mediafire.com/53kupjncq5vg/10bh6w8hz6gh3pu/Etasje1.png" alt="Boks" id="1" class="midt" onclick="visEtasje(1)"></span>
        <input type='hidden' name='etasje'>
        </form>
            
        <script>
            function visEtasje(etasje) {
                window.alert("Du trykket på " + etasje);
                document.forms["valg"]["etasje"].value = etasje;
                document.forms["valg"].submit();
            }
        </script>
        
    </body>
</html>
