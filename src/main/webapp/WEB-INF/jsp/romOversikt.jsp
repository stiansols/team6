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
        <span><img src="http://download856.mediafire.com/zsdeh0tge4jg/4s71wq8c0c8qlxk/Plan4+v3.png" alt="Boks" id="4" class="midt" onclick='visEtasje(4)'></span>
        <br>
        <span><img src="http://download1647.mediafire.com/n4k1duee2brg/upncd8fz6s5j6zw/Plan3+v4.png" alt="Boks" id="3" class="midt" onclick='visEtasje(3)'></span>
        <br>
        <span><img src="http://download1512.mediafire.com/wh720u7xgd4g/a73cqunc0yqhb3n/Plan2+v3.png" alt="Boks" id="2" class="midt" onclick='visEtasje(2)'></span>
        <br>
        <span><img src="http://download1496.mediafire.com/ya518443yv3g/3uw2zhibggzdnt1/Plan1+v5.png" alt="Boks" id="1" class="midt" onclick='visEtasje(1)'></span>
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
