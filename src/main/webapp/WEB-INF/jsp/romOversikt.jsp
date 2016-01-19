<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<html>
    <head>
        <title>Planvisning</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.1/css/datepicker.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

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



            .results tr[visible='false'],
            .no-result{
                display:none;
            }

            .results tr[visible='true']{
                display:table-row;
            }

            .counter{
                padding:8px; 
                color:#ccc;
            }  
            .span3 {  
                height: 300px !important;
                width: 100%;
                overflow: auto;
            }

        </style>
    </head>
    
               
    
    <body>
        <div container>
            <div class="col-lg-6">
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

            </div>

            <div class="col-lg-3 col-lg-offset-3">
                <div class="form-group pull-right">
                    <input type="text" class="search form-control" placeholder="Søk...">
                </div>
                <span class="counter pull-right"></span>
                <div class="span3">
                    <table id="romTabell" class="table table-hover table-bordered results">

                        <thead>
                            <tr class="warning no-result">
                                <td colspan="4"><i class="fa fa-warning"></i> Fant ingen resultater</td>
                            </tr>
                            <tr>
                                <th>Romnr</th>
                                <th>Ledig</th>

                            </tr>

                            <tr class="warning no-result">
                                <td colspan="5"><i class="fa fa-warning"></i> Ingen resultater</td>
                            </tr>        

                        </thead>

                        <tbody>
                            <c:forEach items="${alleRom}" var="rom">                 
                                <tr>
                                    <td>${rom.getRomnr()}</td>
                                    <td></td>
                                </tr>  

                            </c:forEach>           
                        </tbody>


                    </table>
                </div>
                
                <div class="span3">
                        <div class="form-group input-daterange">
                            <label>Fra</label>

                            <input type="date" path="fratid" name = "datoFra" class="form-control"  id="datoFra"/>
                            <input type="text" name="tidFra" class="form-control" id="tidFra">

                            <label>Til</label>
                            <input type="text" name="tidTil" class="form-control" id="tidTil">
                            <input type="button" value="OK" class="form-control" onclick="onChangeDato()">
                        </div>
                </div>
            </div>


        </div>



        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.1/js/bootstrap-datepicker.min.js"></script>

        <script type="text/javascript">
            
            $('#datoFra').datepicker({
                    format: 'dd-mm-yyyy'
                });
            $('#datoTil').datepicker({
                    format: 'dd-mm-yyyy'
                });
        </script>

        <script>


            $(document).ready(function () {
                $(".search").keyup(function () {
                    var searchTerm = $(".search").val();
                    var listItem = $('.results tbody').children('tr');
                    var searchSplit = searchTerm.replace(/ /g, "'):containsi('");

                    $.extend($.expr[':'], {'containsi': function (elem, i, match, array) {
                            return (elem.textContent || elem.innerText || '').toLowerCase().indexOf((match[3] || "").toLowerCase()) >= 0;
                        }
                    });

                    $(".results tbody tr").not(":containsi('" + searchSplit + "')").each(function (e) {
                        $(this).attr('visible', 'false');
                    });

                    $(".results tbody tr:containsi('" + searchSplit + "')").each(function (e) {
                        $(this).attr('visible', 'true');
                    });

                    var jobCount = $('.results tbody tr[visible="true"]').length;
                    $('.counter').text(jobCount + ' elementer');

                    if (jobCount === '0') {
                        $('.no-result').show();
                    }
                    else {
                        $('.no-result').hide();
                    }
                });



            });

            function visEtasje(etasje) {
                document.forms["valg"]["etasje"].value = etasje;
                document.forms["valg"].submit();
            }


            function onClickRomtabell() {
                var table = document.getElementById("romTabell");
                var rows = table.getElementsByTagName("tr");
                for (i = 0; i < rows.length; i++) {
                    var currentRow = table.rows[i];
                    var createClickHandler =
                            function (row)
                            {
                                return function () {
                                    var cell = row.getElementsByTagName("td")[0];
                                    var cell2 = row.getElementsByTagName("td")[1];

                                    var romnr = cell.innerHTML;
                                    var etasje = cell2.innerHTML;

                                    visEtasje(etasje);

                                };
                            };

                    currentRow.onclick = createClickHandler(currentRow);
                }
            }
            
            function onChangeDato() {

                
                var table = document.getElementById("romTabell");
                var cells = table.getElementsByTagName("td");

                var datoFraInput = document.getElementById("datoFra");
                var tidFraInput = document.getElementById("tidFra");
                var datoTilInput = document.getElementById("datoTil");
                var tidTilInput = document.getElementById("tidTil");

                $.getJSON("getBig", {"dato": datoFraInput.value + "-" + tidFraInput.value + ":" + datoFraInput.value + "-" + tidTilInput.value}, function(d) {
                    alert(JSON.stringify(d));
                    var parsedData = JSON.parse(JSON.stringify(d));
                    for(i=3; i<cells.length; i+=2) {
                        for(j=0; j<parsedData.length; j++) {
                            
                            if(cells[i-1].innerHTML === parsedData[j]) {
                                cells[i].innerHTML = "Ikke ledig";
                                break;
                            }
                            else {
                                cells[i].innerHTML = "Ledig";
                            }
                        }
                        
                    }
                });
                
                             
                
                
            }
            
            window.onload = onClickRomtabell();



        </script>

    </body>
</html>