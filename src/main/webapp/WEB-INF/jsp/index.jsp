<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%--
    Document   : index
    Created on : 06.jan.2016, 22:36:21
    Author     : Benjamin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <script src="//code.jquery.com/jquery.min.js"></script>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.1/css/datepicker.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="http://davidlynch.org/projects/maphilight/jquery.maphilight.js"></script>
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <!-- Optional theme -->
        
        <link href="http://cdn.alloyui.com/3.0.1/aui-css/css/bootstrap.min.css" rel="stylesheet"/>
        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">     
          <script src="http://cdn.alloyui.com/3.0.1/aui/aui-min.js"></script>
  
       
        <title>Hjem</title>
    </head>
    <body>
        <form:form class = "form-horizontal" method="POST" modelAttribute="personForm" name="innlogging" action="IndexHandlerSupreme">
            <h2>Velkommen ${person.getNavn()}</h2>
            <br>
            <div class="row">
                <div class="col-sm-8">
                    <h4>${person.printBrukerType()} NTNU</h4>
                    <br>
                    <br>
                    <h2>Her er dine fremtidige bookinger</h2>
                    <table id="brukerTabell" class="table table-hover table-bordered results">

                        <thead>
                            <tr class="warning no-result">
                            </tr>
                            <tr>
                                <th><h3>Romnr</h3></th>
                                <th><h3>Fratid</h3></th>
                                <th><h3>Tiltid</h3></th>

                            </tr>

                            <tr class="warning no-result">
                            </tr>        

                        </thead>

                        <tbody id="bookingTabell">

                            <c:forEach items="${brukerBookinger}" var="brukere">                 
                                <tr>
                                    <td><b>${brukere.getRomNummer()}</b></td>
                                    <td><b>${brukere.getFratid()}</b></td>
                                    <td><b>${brukere.getTiltid()}</b></td>

                            <div class="btn-group" role="group" aria-label="...">
                                <td><button class="btn btn-success" type="submit" disabled value="${brukere.getBookingId()}" name="buttonSupreme" formaction="sjekkInn">Sjekk Inn</button></td>

                                <td><button type="button" class="btn btn-warning" onclick="onClickEndre(${brukere.getBookingId()})">Endre</button></td>
                                <td class="deleterow"><button type="button" class="btn btn-danger" id="${brukere.getBookingId()}" onclick="onClickSlett(${brukere.getBookingId()})">Slett</button></td>
                            </div>

                            </tr>  

                        </c:forEach>

                        </tbody>
                    </table>   
        
                </div>
                <div class="col-sm-4">
                    <br>
                    <fieldset style="outline: 1px solid black">
                        <h2 style="vertical-align: middle" class="text-center">Timeplan</h2>
                    </fieldset>
                    <div>Her <br> skal <br> det <br> være <br> en <br> liste <br> over <br> abonnement</div>
                    <div>           
                        <button>Legg til hendelse</button>
                        <button>Endre abonnementer</button>
                    </div>
                    <br>
                    <h2>StudyEasy</h2>
                </div>
            </div>
        </form:form>
         <div class="row">
                <button type="button" class="btn btn-primary col-sm-offset-1" onclick="regBookingModal()">Registrer ny booking</button>
            </div>
            <br>
        <form:form method="POST" modelAttribute="booking" action="nyBooking">    
        <div class="container">
            <!-- Modal -->
            <div class="modal fade" id="regBookingModal" role="dialog">
                <div class="modal-dialog">
                  
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Registrer ny booking</h4>
                        </div>

                        <div class="modal-body">
                            <div class="form-group">
                                <div class="row">
                                    
                                    <label for="Romnr" class="col-lg-6 control-label">Romnr</label>

                                    <div class="col-lg-6">
                                        <select id ="romNrSelect" name="romNrSelect" onchange="visRomplan()" required>
                                            <c:forEach items="${alleRom}" var="rom">   
                                                     <option>${rom.getRomnr()}</option>
                                            </c:forEach>
                                            
                                        </select>
                                    </div>
                                </div>
                                
                                
                            </div>

                           
                         <div class="form-group input-daterange col-lg-4" >
                                <label>Dato</label>
                                <input type="text" class="form-control" name = "fratid" id="datoFra1" onchange="visRomplan()"required/>
                                <div class="row">
                                
                                    <label>Fra</label>
                                    <select id ="fratidtimer" name="fratidtimer" required>
                                        <option value="06">06</option>
                                        <option value="07">07</option>
                                        <option value="08">08</option>
                                        <option value="09">09</option>
                                        <option value="10">10</option>
                                        <option value="11">11</option>
                                        <option value="12">12</option>
                                        <option value="13">13</option>
                                        <option value="14">14</option>
                                        <option value="15">15</option>
                                        <option value="16">16</option>
                                    </select>
                                    <select id ="fratidmin" name = "fratidmin" required>
                                        <option value="00">00</option>
                                        <option value="30">30</option>
                                    </select>
                                </div>
                                <div class="row">
                                    <label>Til </label>
                                    <select id ="tiltidtimer" name="tiltidtimer">
                                        <option value="06">06</option>
                                        <option value="07">07</option>
                                        <option value="08">08</option>
                                        <option value="09">09</option>
                                        <option value="10">10</option>
                                        <option value="11">11</option>
                                        <option value="12">12</option>
                                        <option value="13">13</option>
                                        <option value="14">14</option>
                                        <option value="15">15</option>
                                        <option value="16">16</option>
                                    </select>
                                    <select id ="tiltidmin" name ="tiltidmin" required>
                                        <option value="00">00</option>
                                        <option value="30">30</option>

                                    </select>
                                </div>
                            </div>

                            <div class="row">
                                <table class="table table-bordered table-hover pull-right" id="dagtab">
                                    <tbody>
                                        <tr>
                                            <td class="klokkeslett" id="1">06.00-06.30</td>

                                            <td class="klokkeslett" id="2">06.30-07.00</td>

                                            <td class="klokkeslett" id="3">07.00-07.30</td>

                                            <td class="klokkeslett" id="4">07.30-08.00</td>

                                            <td class="klokkeslett" id="5">08.00-08.30</td>
                                        </tr>
                                        <tr>
                                            <td class="klokkeslett" id="6">08.30-09.00</td>

                                            <td class="klokkeslett" id="7">09.00-09.30</td>

                                            <td class="klokkeslett" id="8">09.30-10.00</td>

                                            <td class="klokkeslett" id="9">10.00-10.30</td>

                                            <td class="klokkeslett" id="10">10.30-11.00</td>
                                        </tr>
                                        <tr>
                                            <td class="klokkeslett" id="11">11.00-11.30</td>

                                            <td class="klokkeslett" id="12">11.30-12.00</td>

                                            <td class="klokkeslett" id="13">12.00-12.30</td>

                                            <td class="klokkeslett" id="14">12.30-13.00</td>

                                            <td class="klokkeslett" id="15">13.00-13.30</td>
                                        </tr>
                                        <tr>
                                            <td class="klokkeslett" id="16">13.30-14.00</td>

                                            <td class="klokkeslett" id="17">14.00-14.30</td>

                                            <td class="klokkeslett" id="18">14.30-15.00</td>

                                            <td class="klokkeslett" id="19">15.00-15.30</td>

                                            <td class="klokkeslett" id="20">15.30-16.00</td>
                                        </tr>

                                    </tbody>
                                </table>
                            </div>    
                        </div>

                        <div class="modal-footer">
                            <div class="btn-group" role="group" aria-label="...">
                                <button type="submit" class="btn btn-success" >Registrer booking</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Lukk</button>
                            </div>
                        </div>
                        
                    </div>
                    
                   
                </div>
                </form:form>
            </div>
        </div>
                     
                     
            <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.1/js/bootstrap-datepicker.min.js"></script>
            <script type="text/javascript">
 
     
        $('#datoFra1').datepicker({
                format: 'dd-mm-yyyy'
                
            });
            
        
            
              </script>

    <script type="text/javascript">
        $('.input-daterange input').each(function() {
            $(this).datepicker({
                format: 'dd-mm-yyyy'
            });
        });
    </script>   
      
            <div id="wrapper">
  <div id="myScheduler"></div>
</div>
            <script>
YUI().use(
  'aui-scheduler',
  function(Y) {
    var events = [
         {
        content: 'Sondre',
        endDate: new Date(2016, 1, 22, 5),
        startDate: new Date(2016, 1, 22, 1)
      }
    ];
     var agendaView = new Y.SchedulerAgendaView();
    var dayView = new Y.SchedulerDayView();
    var weekView = new Y.SchedulerWeekView();
    var monthView = new Y.SchedulerMonthView();

    new Y.Scheduler(
      {
        activeView: weekView,
        boundingBox: '#myScheduler',
        date: new Date(2016, 1, 22),
        items: events,
        render: true,
        views: [dayView, weekView, monthView, agendaView]
      }
    );
  }
);
            </script>
            
            <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.1/js/bootstrap-datepicker.min.js"></script>
            <script type="text/javascript">
 
     
        $('#datoFra1').datepicker({
                format: 'dd-mm-yyyy'
                
            });
            
        
            
              </script>

    <script type="text/javascript">
        $('.input-daterange input').each(function() {
            $(this).datepicker({
                format: 'dd-mm-yyyy'
            });
        });
    </script>
            
            
        <script>
            
            window.onload = function () {

                var currentdate = new Date();
                var rows = document.getElementById("bookingTabell").getElementsByTagName("tr");
                var fratid;

                for (i = 0; i < rows.length; i++) {
                    fratid = rows[i].getElementsByTagName("td")[1].getElementsByTagName("b")[0].innerHTML;

                    if ("" + currentdate.getDate() === fratid.split("-")[0] &&
                            "0" + (currentdate.getMonth() + 1) === fratid.split("-")[1] &&
                            "" + currentdate.getFullYear() === fratid.split("-")[2] &&
                            "" + currentdate.getHours() === fratid.split("-")[3] &&
                            currentdate.getMinutes() >= parseInt(fratid.split("-")[4])) {
                        var knapp = rows[i].getElementsByTagName("td")[3].getElementsByTagName("button")[0];
                        knapp.disabled = false;
                    }

                }


            };
        </script>

        <script>
            function onClickSlett(bookingid) {

                $.get("slettbooking", {"data": bookingid});

                $(".deleterow").on("click", function () {
                    var $killrow = $(this).parent('tr');
                    $killrow.addClass("danger");
                    $killrow.fadeOut(2000, function () {
                        $(this).remove();
                    });
                });

            }


            function regBookingModal(){    
              var now = new Date();
                 $('#datoFra1').val(now.getDate() + "-" + now.getMonth() + 1 + "-" + now.getFullYear());
                $('#regBookingModal').modal('show');
                 visRomplan();
            
            }

 function visRomplan(){
           
            var dato = document.getElementById("datoFra1").value;
            var romnr = document.getElementById("romNrSelect").value;

            var data = '{"romnr":"'+romnr+'", "dato":"'+dato+'"}';

            $.get("books", {"data":data}, function(Response){
                //alert(JSON.stringify(Response));
                var obj = Response;

                obj.reverse();

                for(var i=1; i<21; i++){
                    if(obj.pop() === "Ledig"){
                    document.getElementById("" + i).style.backgroundColor = "green";
                    }
                    else{
                        document.getElementById("" + i).style.backgroundColor = "red";
                    }
                }         
              });  
}
            

        </script>    
    </body>
</html>
