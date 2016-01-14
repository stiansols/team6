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
        
        <form id='valg' name="valg" action='etasjeVis' method='POST'>
        <span><img src="http://www.mediafire.com/convkey/7341/3y5wa1ysyaj5ty9zg.jpg" alt="Boks" id="4" class="midt" onclick='visEtasje(4)'></span>
        <br>
        <span><img src="http://www.mediafire.com/convkey/6628/30fbjp257hyss80zg.jpg" alt="Boks" id="3" class="midt" onclick='visEtasje(3)'></span>
        <br>
        <span><img src="http://www.mediafire.com/convkey/4c13/y952zf20j5rfb67zg.jpg" alt="Boks" id="2" class="midt" onclick='visEtasje(2)'></span>
        <br>
        <span><img src="http://www.mediafire.com/convkey/1119/10bh6w8hz6gh3puzg.jpg" alt="Boks" id="1" class="midt" onclick='visEtasje(1)'></span>
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
