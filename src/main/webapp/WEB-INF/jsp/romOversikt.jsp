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
        <link rel="stylesheet" type="text/css" href="http://softwareambar.com/js/clockpicker/jquery-clockpicker.min.css">
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

        <style>


            .midt {
                position: relative;
                width: 380px;
                display: block;
                margin-left: auto;
                margin-right: auto;
                margin-bottom: -50px;
                /* box-shadow: 0px 2px; */
            }
            
            .midt:hover {
                width: 540px;
            }
            
            .results tr[visible='false'],
            .no-result{
                display:none;
            }
            
            #etasjer {
                margin-top: 50px;
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
            .vert-offset-top-2{
                margin-top: 2em;
            }

        </style>
    </head>
    
               
    
    <body>

        <div container>
            <div class="col-lg-6">
             <div id="etasjer">
                <form id='valg' name="valg" action='etasjeVis' method='POST'>

                <img src="https://lh4.googleusercontent.com/Dt1riBRKubFPFL2BkNCfh8KLR7qWYEoXeXzmomxgAAoXVdcoDKaqIfShwrjKevjJOL9utKSgXj1Ya5yZTFhGhierov8izPZuqyvuAxN7LRAgSa8_Y5rjyHW3MfxYAqYTXzhSAbxk" alt="Fjerde etasje" class="midt" onclick='visEtasje(4)' style="z-index: 4">
                <img src="https://lh6.googleusercontent.com/Cji2zg8UkeEAlwXv93EJAxz0ijoDK-ILewpzj6aggFV6yqOuyPhVvNpCcmC-TM1WlWSCICywv0gnV6BsPYa3f_4mtWSWElsjsKTDbWAUvg67CTB50YNUY4QWmRcfEBF3PLNuq2xK" alt="Tredje etasje" class="midt" onclick='visEtasje(3)' style="z-index: 3">
                <img src="https://lh5.googleusercontent.com/6nn6S9mpIFtSIAv-wt8LWKAsrJMIOqg0qOMgA1RS6f6ZIPwNTfnrwQA28lQQkyv_xUY6YUXB75ah188WCtpurDPHkP_nrfeMw5Wt3lSjiTOfnS9eKZByn7YfE2013SvKt7qRRb7t" alt="Andre etasje" class="midt" onclick='visEtasje(2)' style="z-index: 2">
                <img src="https://lh4.googleusercontent.com/ig-KqeaaaX_jQgXn8ktHGumUrtKS76gzBOsl1npsAaDbdYJtT2RaQdmiC6IYRb2yECD0D17EGh3zMQDgmsbROS-AxOAB9ML1PvYxUd8DGBbmEqZRynGsVg1MZb1AvuUgFyxFDWVZ" alt="FÃ¸rste etasje" class="midt" onclick='visEtasje(1)' style="z-index: 1">
                </div>
                <input type='hidden' name='etasje'>
                <input type='hidden' name='fradato'>
                <input type='hidden' name='fratid'>
                <input type='hidden' name='tiltid'>
                <input type='hidden' name='romnr'>
            </form>

        </div>

            <div class="col-lg-6 vert-offset-top-2">
                <div class="form-group">
                    <input type="text" class="search form-control" placeholder="Søk...">
                </div>
                <div id="checkboxes">
                    <label>Ledig <input type="checkbox" onclick="filter()" value="Ledig"></label> 
                    <label>Har Smartboard <input type="checkbox" onclick="filter()" value="Ja"></label> 
                    <label>Har Skjerm <input type="checkbox" onclick="filter()" value="Ja"></label> 
                    <label>Har Prosjektor <input type="checkbox" onclick="filter()" value="Ja"></label>
                </div>
                <span class="counter pull-right"></span>
                <div class="span3">
                    <table id="romTabell" class="table table-hover table-bordered results">

                        <thead>
                            <tr class="warning no-result">
                                <td colspan="4"><i class="fa fa-warning"></i> Fant ingen resultater</td>
                            </tr>
                            <tr>
                                <th onclick="sortBy()">Romnr</th>
                                <th>Ledig</th>
                                <th>Smartboard</th>
                                <th>Skjerm</th>
                                <th>Prosjektor</th>
                                <th>Antall Plasser</th>
                            </tr>

                            <tr class="warning no-result">
                                <td colspan="5"><i class="fa fa-warning"></i> Ingen resultater</td>
                            </tr>        

                        </thead>

                        <tbody id="romTbody">
                            <c:forEach items="${alleRom}" var="rom">                 
                                <tr>
                                    <td>${rom.getRomnr()}</td>
                                    <td></td>
                                    <td><c:if test="${rom.getHarSmartboard() == true}">Ja</c:if>
                                        <c:if test="${rom.getHarSmartboard() == false}">Nei</c:if>
                                    </td>
                                    <td><c:if test="${rom.getHarSkjerm() == true}">Ja</c:if>
                                        <c:if test="${rom.getHarSkjerm() == false}">Nei</c:if>
                                    </td>                                                                         
                                    <td><c:if test="${rom.getHarProsjektor() == true}">Ja</c:if>
                                        <c:if test="${rom.getHarProsjektor() == false}">Nei</c:if>
                                    </td>
                                    <td>${rom.getPlasser()}</td>
                                </tr>  

                            </c:forEach>           
                        </tbody>


                    </table>
                </div>
                
                <div class="span3">
                        <div class="form-group input-daterange">
                            <label>Dato</label>
                            <input type="date" path="fratid" name = "datoFra" class="form-control"  id="datoFra" value="20-01-2016"/>
                            <div class="form-inline">
                                <br>
                                <div class="input-group clockpicker">
                                    Fra <input type="text" name="tidFra" class="form-control" id="tidFra" value="09:00">
                                </div>
                                <div class="input-group clockpicker">
                                    Til <input type="text" name="tidTil" class="form-control" id="tidTil" value="15:00">
                                </div>
                                
                            </div>
                            <br>
                            <input type="button" value="OK" class="form-control" onclick="onChangeDato()">
                        </div>

                </div>
            </div>


        </div>
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.1/js/bootstrap-datepicker.min.js"></script>
        <script src="http://softwareambar.com/js/clockpicker/bootstrap-clockpicker.min.js"></script>


        
        <script type="text/javascript">
            $('.clockpicker').clockpicker({
                placement: 'top',
                default: 'now',
                donetext: 'Velg'
            });
        </script>
        
        <script type="text/javascript">
            
            $('#datoFra').datepicker({
                    format: 'dd-mm-yyyy'
                });
        </script>

        <script>
            $(document).ready(function () {
                var now = new Date();
                document.getElementById("datoFra").value = now.getDate() + "-" + now.getMonth() + 1 + "-" + now.getFullYear();
                onChangeDato();
                $('#example').DataTable();
                alert("ok");
                $(".collapse1").collapse('hide');
                
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
                document.forms["valg"]["fradato"].value = document.getElementById("datoFra").value;
                document.forms["valg"]["fratid"].value = document.getElementById("tidFra").value;
                document.forms["valg"]["tiltid"].value = document.getElementById("tidTil").value;

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
                                    var etasje = romnr.charAt(0);

                                    visEtasje(etasje);

                                };
                            };

                    currentRow.onclick = createClickHandler(currentRow);
                }
            }
            
            function onChangeDato() {
                
                var table = document.getElementById("romTabell");
                var tbody = document.getElementById("romTbody");
                var rows = tbody.getElementsByTagName("tr");
                
                var datoFraInput = document.getElementById("datoFra").value;
                var tidFraInput = document.getElementById("tidFra").value;
                var tidTilInput = document.getElementById("tidTil").value;
                tidFraInput = tidFraInput.replace(":", "-");
                tidTilInput = tidTilInput.replace(":", "-");
                var alleRomnr = "";
                $.getJSON("getBig", {"dato": datoFraInput + "-" + tidFraInput + ":" + datoFraInput + "-" + tidTilInput}, function(d) {
                    var parsedData = JSON.parse(JSON.stringify(d));
                    for(i=0; i<rows.length; i++) {
                        if(parsedData.length == 0) {
                            rows[i].cells[1].innerHTML = "Ledig";
                            continue;
                        }
                        for(j=0; j<parsedData.length; j++) {
                            if(rows[i].cells[0].innerHTML === parsedData[j]) {
                                rows[i].cells[1].innerHTML = "Ikke ledig";
                                break;
                            }
                            else {
                                rows[i].cells[1].innerHTML = "Ledig";
                            }
                        }
                    }
                    for(j=0; j<parsedData.length; j++) {
                        alleRomnr = alleRomnr + parsedData[j] + ",";
                    }
                    document.forms["valg"]["romnr"].value = alleRomnr;
                });  
            }
            
            function filter() {
                var table = document.getElementById("romTabell");
                var tbody = document.getElementById("romTbody");
                var rows = tbody.getElementsByTagName("tr");
                var checkboxes = document.getElementById("checkboxes").getElementsByTagName("input");
                
                for(i=0, j=0; i<rows.length; i++, j++) {
                    for(k=0; k<checkboxes.length; k++) {
                        var filterType = checkboxes[k].value;
                        if(rows[i].cells[1+k].innerHTML.trim() !== filterType) {
                            if(checkboxes[k].checked) {
                                rows[i].style.display = 'none';
                                break;
                            }
                            else {
                                rows[i].style.display = '';
                            }
                        }
                    }
                    
                }
            }
            
            window.onload = onClickRomtabell();



        </script>

    </body>
</html>
