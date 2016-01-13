<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Etasje</title>
        <style>
            
            
        </style>
    </head>
    <body>
        
        <img id='eta' src="${etasjeLink}" style="width: 70%" />
        
        
        <canvas id="romstatus">
        
            
        </canvas> 
        
        <script> 
            var img = document.getElementById('eta'); var w = img.clientWidth; var h = img.clientHeight;
            window.onload = function() {
                document.getElementById('romstatus').width = "w"; document.getElementById('romstatus').height = "h";
            }
            window.onresize = function() {
                var img = document.getElementById('eta'); var w = img.clientWidth; var h = img.clientHeight;
                document.getElementById('romstatus').width = "w"; document.getElementById('romstatus').height = "h"
            }
        
        </script>
    </body>
</html>
