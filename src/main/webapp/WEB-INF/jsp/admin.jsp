<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

        <script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
        <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>



        <style>
            #adminBody {
                padding: 20px 20px;
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

            .table-striped tbody tr.highlight td { background-color: #0066cc }


            .dual-list .list-group {
                margin-top: 8px;
            }

            .list-left li, .list-right li {
                cursor: pointer;
            }

            .list-arrows {
                padding-top: 5px;
            }

            .list-arrows button {
                margin-bottom: 20px;
            }

            .top-buffer { margin-top:10px;}

        </style>
        <style type="text/css">
            .bs-example{
                margin: 20px;
            }
        </style>
    </head>

    <body>

        <div id="adminBody">
            <div class="bs-example">
                <ul class="nav nav-tabs" id="myTab">
                    <li class="active"><a href="#brukerFane">Brukere</a></li>
                    <li><a href="#fagFane">Fag</a></li>
                    <li><a href="#studiumFane">Studium</a></li>
                    <li><a href="#fagStudFane">Oversikt</a></li>

                </ul>
                <div class="tab-content">
                    <div id="brukerFane" class="tab-pane fade in active">
                        <!-- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||-->

                        <div class="form-group pull-right">
                            <input type="text" class="search form-control" placeholder="Søk...">
                        </div>
                        <span class="counter pull-right"></span>

                        <table id="brukerTabell" class="table table-hover table-bordered results">

                            <thead>
                                <tr class="warning no-result">
                                    <td colspan="4"><i class="fa fa-warning"></i> Fant ingen resultater</td>
                                </tr>
                                <tr>
                                    <th>Brukernavn</th>
                                    <th>Brukertype</th>
                                    <th>Navn</th>
                                    <th>Passord</th> 
                                    <th>Email</th>
                                </tr>

                                <tr class="warning no-result">
                                    <td colspan="5"><i class="fa fa-warning"></i> Ingen resultater</td>
                                </tr>        

                            </thead>

                            <tbody>

                                <c:forEach items="${alleBrukere}" var="brukere">                 
                                    <tr>
                                        <td>${brukere.getBrukernavn()}</td>
                                        <td>${brukere.getBrukertype()}</td>
                                        <td>${brukere.getNavn()}</td>
                                        <td>${brukere.getPassord()}</td> 
                                        <td>${brukere.getMail()}</td>
                                    </tr>  

                                </c:forEach>

                            </tbody>
                        </table>

                        <a class="btn btn-default col-lg-6 col-xs-6" role="button" href="<c:url value="registrerBruker"/>">Registrer ny bruker</a>


                        <div class="container">
                            <!-- Modal -->
                            <div class="modal fade" id="visBrukerModal" role="dialog">
                                <div class="modal-dialog">

                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Endre bruker</h4>
                                        </div>
                                        <div class="modal-body">

                                            <form:form class = "form-horizontal" method="POST" modelAttribute="brukerForm" name="oppdaterBruker" action="admin">
                                                <div class="row">
                                                    <label for="brukerLabel" class="col-lg-4 control-label">Brukernavn</label>
                                                    <div class="col-lg-8">
                                                        <input type="text" name="brukernavn" id="brukernavn" value="" readonly/>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <label for="bTypeLabel" class="col-lg-4 control-label">Brukertype</label>
                                                    <div class="col-lg-8">
                                                        <input type="text" name="brukertype" id="brukertype" value=""/>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <label for="navnLabel" class="col-lg-4 control-label">Navn</label>
                                                    <div class="col-lg-8">
                                                        <input type="text" name="navn" id="navn" value=""/>
                                                    </div>
                                                </div>      

                                                <div class="row">
                                                    <label for="passLabel" class="col-lg-4 control-label">Nytt passord</label>
                                                    <div class="col-lg-8">
                                                        <input type="password" name="passord" id="passord" value=""/>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <label for="mailLabel" class="col-lg-4 control-label">Mail</label>
                                                    <div class="col-lg-8">
                                                        <input type="text" name="mail" id="mail" value=""/>
                                                    </div>
                                                </div>



                                            </div>
                                            <div class="modal-footer">
                                                <button type="submit" class="btn btn-default" formaction="oppdater">Oppdater bruker</button> 
                                                <button type="submit" class="btn btn-default" formaction="slett">Slett bruker</button>

                                                <button type="button" class="btn btn-default" data-dismiss="modal">Lukk</button>
                                            </div>

                                        </form:form> 
                                    </div>

                                </div>
                            </div>

                        </div>

                        <!-- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||-->

                    </div>
                    <div id="fagFane" class="tab-pane fade">

                        <!-- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||-->  
                        <div container>
                            <table id="fagTabell" class="table table-hover table-bordered results col-lg-12">

                                <thead>
                                    <tr>
                                        <th>Fagkode</th>
                                        <th>navn</th>
                                    </tr>

                                </thead>

                                <tbody>

                                    <c:forEach items="${alleFag}" var="fag">                 
                                        <tr>
                                            <td>${fag.getFagkode()}</td>
                                            <td>${fag.getNavn()}</td>
                                        </tr>  

                                    </c:forEach>

                                </tbody>
                            </table>
                        </div>


                        <button class="btn btn-default col-lg-6 col-xs-6" onclick="visLeggTilFagModal()">Legg til fag</button>


                    </div>

                    <div id="studiumFane" class="tab-pane fade">

                        <div class="container">

                            <div class="row col-lg-4">
                                <fieldset class="form-group">
                                    <label for="velgStudieLabel">Studium</label>
                                    <select class="form-control" id="selectStudium">

                                        <c:forEach items="${alleStudier}" var="studie">                 
                                            <option>${studie.getStudiekode()} - ${studie.getStudienavn()}</option>

                                        </c:forEach>

                                    </select>
                                </fieldset>

                                <button type="submit" class="btn btn-primary col-lg-4" onclick="velgStudium()">Velg studium</button>
                                <button class="btn btn-primary col-lg-4 col-lg-offset-4" onclick="lagreStudent()">Lagre endringer</button>

                            </div>





                            <div class="row top-buffer col-lg-12">

                                <div class="dual-list list-left col-md-4">
                                    <div class="well text-left">
                                        <h5><b>Tar studium</b></h5>
                                        <div class="row">
                                            <div class="col-md-10">
                                                <div class="input-group">  
                                                    <span class="input-group-addon glyphicon glyphicon-search"></span>
                                                    <input type="text" id="SearchDualListId" name="SearchDualList" class="form-control" placeholder="Søk" />

                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="btn-group">
                                                    <a class="btn btn-default selector" title="velg alle"><i class="glyphicon glyphicon-unchecked"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                        <ul id="tarStudieListe" class="list-group">

                                            <!--               <c:forEach items="${alleStud}" var="stud">                 
                                                              <li class="list-group-item">${stud.getBrukernavn()}</li>
                                                                      
                                            </c:forEach>
                              
                                            -->
                                        </ul>

                                    </div>
                                </div>

                                <div class="list-arrows col-md-1 text-center">
                                    <button class="btn btn-default btn-sm move-left">
                                        <span class="glyphicon glyphicon-chevron-left"></span>
                                    </button>

                                    <button class="btn btn-default btn-sm move-right">
                                        <span class="glyphicon glyphicon-chevron-right"></span>
                                    </button>
                                </div>

                                <div class="dual-list list-right col-md-4">
                                    <div class="well text-left">
                                        <h5><b>Tar ikke studium</b></h5>
                                        <div class="row">
                                            <div class="col-md-2">
                                                <div class="btn-group">
                                                    <a class="btn btn-default selector" title="velg alle"><i class="glyphicon glyphicon-unchecked"></i></a>
                                                </div>
                                            </div>
                                            <div class="col-md-10">
                                                <div class="input-group">
                                                    <input type="text" name="SearchDualList" class="form-control" placeholder="søk" />
                                                    <span class="input-group-addon glyphicon glyphicon-search"></span>
                                                </div>
                                            </div>
                                        </div>
                                        <ul id="tarIkkeStudieListe" class="list-group">


                                        </ul>
                                    </div>
                                </div>

                            </div>
                        </div>






                        <!-- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||-->   

                    </div>

                    <div id="fagStudFane" class="tab-pane fade">
                        <h1>Oversikt</h1>


                    </div>

                </div>


                <div class="container">
                    <!-- Modal -->
                    <div class="modal fade" id="leggTilFagModal" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Legg til nytt fag</h4>
                                </div>
                                <div class="modal-body">

                                    <form:form class = "form-horizontal" method="POST" modelAttribute="nyttFagForm" name="leggTilFag" action="admin">
                                        <div class="row">
                                            <label for="fagkodeLabel" class="col-lg-4 control-label">Fagkode</label>
                                            <div class="col-lg-8">
                                                <input type="text" name="fagkode" id="fagkode" value=""/>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <label for="navnLabel" class="col-lg-4 control-label">Navn</label>
                                            <div class="col-lg-8">
                                                <input type="text" name="navn" id="navn" value=""/>
                                            </div>
                                        </div>


                                    </div>
                                    <div class="modal-footer">
                                        <button type="submit" class="btn btn-default" formaction="leggTil">Legg til fag</button> 
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Lukk</button>
                                    </div>

                                </form:form> 
                            </div>

                        </div>
                    </div>

                </div>


                <div class="container">
                    <!-- Modal -->
                    <div class="modal fade" id="slettFagModal" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Slett fag</h4>
                                </div>
                                <div class="modal-body">

                                    <form:form class = "form-horizontal" method="POST" modelAttribute="slettFagForm" name="slettFag" action="admin">
                                        <div class="row">
                                            <label for="fagkodeLabel" class="col-lg-4 control-label">Fagkode</label>
                                            <div class="col-lg-8">
                                                <input type="text" name="fagkode" id="fagkode" value="" readonly/>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <label for="navnLabel" class="col-lg-4 control-label">Navn</label>
                                            <div class="col-lg-8">
                                                <input type="text" name="navn" id="navn" value="" readonly/>
                                            </div>
                                        </div>


                                    </div>
                                    <div class="modal-footer">
                                        <button type="submit" class="btn btn-default" formaction="slettFag">Slett fag</button> 
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Lukk</button>
                                    </div>

                                </form:form> 
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>


        <!-- Latest compiled and minified JavaScript -->
        <script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

    </body>
</html>
<script>
                                    $(document).ready(function () {
                                        /*   $.get("test2", {"data":"TDAT-1000"}, function(Response){
                                         alert(JSON.stringify(Response));
                                         
                                         });
                                         */

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
                                            } else {
                                                $('.no-result').hide();
                                            }
                                        });

                                        $('body').on('click', '.list-group .list-group-item', function () {
                                            $(this).toggleClass('active');
                                        });
                                        $('.list-arrows button').click(function () {
                                            var $button = $(this), actives = '';
                                            if ($button.hasClass('move-left')) {
                                                actives = $('.list-right ul li.active');
                                                actives.clone().appendTo('.list-left ul');
                                                actives.remove();
                                            } else if ($button.hasClass('move-right')) {
                                                actives = $('.list-left ul li.active');
                                                actives.clone().appendTo('.list-right ul');
                                                actives.remove();
                                            }
                                        });
                                        $('.dual-list .selector').click(function () {
                                            var $checkBox = $(this);
                                            if (!$checkBox.hasClass('selected')) {
                                                $checkBox.addClass('selected').closest('.well').find('ul li:not(.active)').addClass('active');
                                                $checkBox.children('i').removeClass('glyphicon-unchecked').addClass('glyphicon-check');
                                            } else {
                                                $checkBox.removeClass('selected').closest('.well').find('ul li.active').removeClass('active');
                                                $checkBox.children('i').removeClass('glyphicon-check').addClass('glyphicon-unchecked');
                                            }
                                        });
                                        $('[name="SearchDualList"]').keyup(function (e) {
                                            var code = e.keyCode || e.which;
                                            if (code === '9')
                                                return;
                                            if (code === '27')
                                                $(this).val(null);
                                            var $rows = $(this).closest('.dual-list').find('.list-group li');
                                            var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();
                                            $rows.show().filter(function () {
                                                var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
                                                return !~text.indexOf(val);
                                            }).hide();
                                        });




//tab bytteren
                                        $("#myTab a").click(function (e) {
                                            e.preventDefault();
                                            $(this).tab('show');
                                        });



                                    });
                                    var valgteStud;
                                    var studiekode;
                                    var studienavn;

                                    function lagreStudent() {
                                        var data = '{ ';

                                        var liste1 = document.getElementById("tarIkkeStudieListe").getElementsByTagName("li");
                                        for (var i = 0; i < liste1.length; i++) {
                                            data += '"slettbruker' + i + '":' + '"' + liste1[i].innerHTML + '",';
                                        }
                                        if (liste1.length > 0) {
                                            data += '"lengde1":' + liste1.length + ',';

                                        }

                                        var liste2 = document.getElementById("tarStudieListe").getElementsByTagName("li");
                                        //    var data2 = '{"brukernavn0": "nybruker","studiekode0": "studiekode0", "studienavn0": "studienavn0",  "brukernavn1": "Nybruker2","studiekode1": "studiekode1", "studienavn1": "studienavn1", "lengde": 2}';
                                        for (var i = 0; i < liste2.length; i++) {
                                            data += '"brukernavn' + i + '":' + '"' + liste2[i].innerHTML + '","studiekode": "' + studiekode + '", "studienavn' + i + '": "' + studienavn + '", ';
                                        }
                                        if (liste2.length === 0) {
                                            data += '"studiekode": "' + studiekode + '",';
                                        }
                                        data += '"lengde2":' + liste2.length + '}';

                                        $.get("lagreStud", {"data": data}, function (Response) {
                                            //alert(JSON.stringify(Response));

                                        });

                                    }

                                    function velgStudium() {

//{"data":$('#selectStudium').val()}
                                        var selectString = $('#selectStudium').val();
                                        var firstIndex = selectString.indexOf("-") + 2;
                                        var lastIndex = selectString.lastIndexOf("");

                                        studienavn = selectString.substring(firstIndex, lastIndex);
                                        lastIndex = selectString.lastIndexOf("-") - 1;
                                        studiekode = selectString.substring(0, lastIndex);

                                        $.get("studStudium", {"data": studienavn}, function (Response) {
                                            //  alert(JSON.stringify(Response));
                                            // alert()
                                            var ul = document.getElementById("tarStudieListe");
                                            $('#tarStudieListe').empty();
                                            valgteStud = $(JSON.parse(JSON.stringify(Response)));

                                            for (var i = 0; i < valgteStud.length; i++) {
                                                // alert(myArr[i]);
                                                /*   var li = document.createElement("li");
                                                 li.className = li.className + " list-group";
                                                 li.appendChild(document.createTextNode(valgteStud[i]));
                                                 ul.appendChild(li);
                                                 */

                                                $("#tarStudieListe").append('<li class="list-group-item">' + valgteStud[i] + '</li>');
                                            }
                                            var myArr;

                                            $.get("alleStud", {"data": "0"}, function (Response) {
                                                //  alert(JSON.stringify(Response));
                                                // alert()
                                                var ul = document.getElementById("tarIkkeStudieListe");
                                                $('#tarIkkeStudieListe').empty();
                                                myArr = $(JSON.parse(JSON.stringify(Response)));


                                                for (var i = 0; i < valgteStud.length; i++) {

                                                    for (var j = 0; j < myArr.length; j++) {

                                                        if (myArr[j] === valgteStud[i]) {
                                                            myArr.splice(j, 1);
                                                        }

                                                    }

                                                }

                                                for (var i = 0; i < myArr.length; i++) {
                                                    /* var li = document.createElement("li");
                                                     li.className = li.className + " list-group";
                                                     li.appendChild(document.createTextNode(myArr[i]));
                                                     ul.appendChild(li);
                                                     */
                                                    $("#tarIkkeStudieListe").append('<li class="list-group-item">' + myArr[i] + '</li>');
                                                }

                                            });

                                        });

                                    }

                                    function sendData() {
                                        var liste = document.getElementById("tarStudieListe").getElementsByTagName("li");

                                        for (var i = 0; i < liste.length; i++) {
                                            alert(liste[i].innerHTML);
                                        }
                                    }


                                    function visLeggTilFagModal() {
                                        $('#leggTilFagModal').modal('show');

                                    }

                                    function byttTab() {
                                        $('#myTab a[href="#fagFane"]').tab('show');
                                    }

                                    function onClickBrukertabell() {
                                        var table = document.getElementById("brukerTabell");
                                        var rows = table.getElementsByTagName("tr");
                                        for (i = 0; i < rows.length; i++) {
                                            var currentRow = table.rows[i];
                                            var createClickHandler =
                                                    function (row)
                                                    {
                                                        return function () {
                                                            var cell = row.getElementsByTagName("td")[0];
                                                            var cell2 = row.getElementsByTagName("td")[1];
                                                            var cell3 = row.getElementsByTagName("td")[2];
                                                            // var cell4 = row.getElementsByTagName("td")[3];
                                                            var cell5 = row.getElementsByTagName("td")[4];


                                                            var id = cell.innerHTML;
                                                            var bType = cell2.innerHTML;
                                                            var navn = cell3.innerHTML;
                                                            // var passord = cell4.innerHTML;
                                                            var mail = cell5.innerHTML;

                                                            //alert("id:" + id);
                                                            $(".modal-body #brukernavn").val(id);
                                                            $(".modal-body #brukertype").val(bType);
                                                            $(".modal-body #navn").val(navn);
                                                            // $(".modal-body #passord").val( passord );
                                                            $(".modal-body #mail").val(mail);
                                                            $('#visBrukerModal').modal('show');


                                                        };
                                                    };

                                            currentRow.onclick = createClickHandler(currentRow);
                                        }
                                    }
                                    window.onload = onClickBrukertabell();


                                    function onClickFagtabell() {
                                        var table = document.getElementById("fagTabell");
                                        var rows = table.getElementsByTagName("tr");
                                        for (i = 0; i < rows.length; i++) {
                                            var currentRow = table.rows[i];
                                            var createClickHandler =
                                                    function (row)
                                                    {
                                                        return function () {
                                                            var cell = row.getElementsByTagName("td")[0];
                                                            var cell2 = row.getElementsByTagName("td")[1];

                                                            var fagkode = cell.innerHTML;
                                                            var navn = cell2.innerHTML;

                                                            $(".modal-body #fagkode").val(fagkode);
                                                            $(".modal-body #navn").val(navn);

                                                            $('#slettFagModal').modal('show');


                                                        };
                                                    };

                                            currentRow.onclick = createClickHandler(currentRow);
                                        }
                                    }
                                    window.onload = onClickFagtabell();




                                    function onClickFagtabell2() {
                                        var table = document.getElementById("fagTabell2");
                                        var rows = table.getElementsByTagName("tr");
                                        for (i = 0; i < rows.length; i++) {
                                            var currentRow = table.rows[i];
                                            var createClickHandler =
                                                    function (row)
                                                    {
                                                        return function () {
                                                            var cell = row.getElementsByTagName("td")[0];

                                                            var fagkode = cell.innerHTML;
                                                            $('#SearchDualList').val("Stians");
                                                            //   alert(fagkode);



                                                        };
                                                    };

                                            currentRow.onclick = createClickHandler(currentRow);
                                        }
                                    }
                                    window.onload = onClickFagtabell2();


                                    function sendNyStudListe() {
                                        /*  var unorderedList = document.getElementById('tarFagListe'); 
                                         var ListItems = unorderedList.getElementsByTagName('li');  
                                         
                                         for(var i = 0; i < ListItems.length; i++){
                                         var test = ListItems[i].innerHTML;
                                         alert(test);
                                         */
                                        var date = new Date();
                                        // for(var i=0; i< 20; i++){
                                        date.setHours(6);
                                        date.setMinutes(61);

                                        alert(date);
                                        //sjekker fag i selecten

                                        // }


                                    }

                                    function onClickTest() {

                                        //  $('.search').val("Stians");
                                        $('#SearchDualListId').val("Stians");
                                        //   $('#SearchDualListId').focus();
                                        /*    var e = $.Event('keypress');
                                         e.which = 13; // 
                                         $('#SearchDualListId').trigger(e);
                                         */

                                        /*   $('#SearchDualListId').keyup();
                                         $('#SearchDualListId').focus();
                                         // $('#SearchDualListId').click();
                                         var e = $.Event( "keypress", { which: 13 } );
                                         $("#SearchDualListId").trigger(e);
                                         */



                                    }
                                    window.onload = onClickTest();


</script>