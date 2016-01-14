<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
        
        <form id='valg' name="valgtEtasje" action='etasje' method='POST'>
        <span><img src="http://download1980.mediafire.com/kla7i51kskig/3y5wa1ysyaj5ty9/Etasje4.png" alt="Boks" id="4" class="midt" onclick='visEtasje(4)'></span>
        <br>
        <span><img src="http://download1651.mediafire.com/726vw3jv2kag/30fbjp257hyss80/Etasje3.png" alt="Boks" id="3" class="midt" onclick='visEtasje(3)'></span>
        <br>
        <span><img src="http://download1648.mediafire.com/81zwufh9cj7g/y952zf20j5rfb67/Etasje2.png" alt="Boks" id="2" class="midt" onclick='visEtasje(2)'></span>
        <br>
        <span><img src="http://download1644.mediafire.com/yxv09bkxpsyg/10bh6w8hz6gh3pu/Etasje1.png" alt="Boks" id="1" class="midt" onclick='visEtasje(1)'></span>
        <input type='hidden' name='etasje'>
        </form>
            
        <script>
            function visEtasje(int etasje) {
                window.alert("Du trykket på " + etasje);
                oFormObject.elements["valg"].value = etasje;
                document.forms["valg"].submit();
            }
        </script>
        
    </body>
</html>
