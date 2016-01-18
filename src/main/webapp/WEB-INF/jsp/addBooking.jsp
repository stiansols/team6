<!DOCTYPE html>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
    <head>
        <script src="//code.jquery.com/jquery.min.js"></script>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.1/css/datepicker.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

    </head>
    <body>
        
             <style>
            tr{
                width: 50%;
            }
            
            td{
                width: 50%;
             
            }     
            
            #dagtab{
                width: 20%;
            }
            
            #klokkeslett{
                background-color: whitesmoke;
            }
            
            #status{
                
            }
        </style>
        
        <form:form method="POST" modelAttribute="booking" action="nyBooking">
           
        
            <div class="container">
                <div class="row">
                    <div class ="col-lg-4 col-lg-offset-0 well">
                        <div id="romNummer" class="form-group" >
                            <label>Rom Nummer</label>
                            <input path="romNummer" class="form-control" id="romnr" name ="romNummer"/>
                        </div>
                        <div class="form-group" >
                            <label>Fra</label>
                            <input type="date" path="fratid" name = "fratid" class="form-control"  id="datoFra" />  
                            <select id ="fratidtimer" name="fratidtimer">
                            <option value="06">06</option>
                            <option value="07">07</option>
                            <option value="08">08</option>
                            <option value="09">09</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">11</option>
                            <option value="13">13</option>
                            <option value="14">14</option>
                            <option value="15">15</option>
                            <option value="16">16</option>
                            </select>
                            <select id ="fratidmin" name = "fratidmin">
                            <option value="00">00</option>
                            <option value="30">30</option>
                            
                            </select>
                            <label>Til</label>
                            <input type="date" path="tiltid" name = "tiltid" class="form-control"  id="datoTil"/>
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
                            <select id ="tiltidmin" name ="tiltidmin">
                            <option value="00">00</option>
                            <option value="30">30</option>
                            
                            </select>
                        </div>

                        <div class="form-group">
                            <div class="col-xs-5 col-xs-offset-3">
                                <button type="submit" class="btn btn-primary">Send inn</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form:form>
        
                        
        
        
 <form:form class = "form-horizontal" method="POST" modelAttribute="personForm" name="innlogging" action="spam">
 <h3>${person.getBookingerTekst()}</h3>
            
  <div class="container">
  <h3>Oversikt for rom 
      <select>
        <c:forEach items="${alleRom}" var="rom">                 
            <option>${rom.getRomnr()}</option>  
        </c:forEach>           
      </select></h3> 
  <div class="table-responsive" id="dag">          
  <table class="table table-bordered table-hover" id="dagtab">
    <thead>
      <tr>
        <th>Klokkeslett</th>
        <th>Dato</th>
      </tr>
    </thead>
    <tbody>
       <tr>
        <td id="klokkeslett">06.00-06.30</td>
        <td class="status" id="status">Opptatt</td>
      </tr>
      <tr>
        <td id="klokkeslett">06.30-07.00</td>
        <td class="status" id="status">Opptatt</td>
      </tr>
      <tr>
        <td id="klokkeslett">07.00-07.30</td>
        <td class="status" id="status">Opptatt</td>
      </tr><tr>
        <td id="klokkeslett">07.30-08.00</td>
        <td class="status" id="status">Opptatt</td>
      </tr>
      <tr>
        <td id="klokkeslett">08.00-08.30</td>
        <td class="status" id="status">Opptatt</td>
      </tr>
      <tr>
      <td id="klokkeslett">08.30-09.00</td>
      <td class="status" id="status">Ledig</td>
      </tr>
      <tr>
      <td id="klokkeslett">09.00-09.30</td>
      <td class="status" id="status">Ledig</td>
      </tr>
      <tr>
      <td id="klokkeslett">09.30-10.00</td>
      <td class="status" id="status">Opptatt</td>
      </tr>
      <tr>
      <td id="klokkeslett">10.00-10.30</td>
      <td class="status" id="status">Opptatt</td>
      </tr>
      <tr>
      <td id="klokkeslett">10.30-11.00</td>
      <td class="status" id="status">Opptatt</td>
      </tr>
      <tr>
      <td id="klokkeslett">11.00-11.30</td>
      <td class="status" id="status">Ledig</td>
      </tr>
      <tr>
      <td id="klokkeslett">11.30-12.00</td>
      <td class="status" id="status">Ledig</td>
      </tr>
      <tr>
      <td id="klokkeslett">12.00-12.30</td>
      <td class="status" id="status">Ledig</td>
      </tr>
      <tr>
      <td id="klokkeslett">12.30-13.00</td>
      <td class="status" id="status">Opptatt</td>
      </tr>
      <tr>
      <td id="klokkeslett">13.00-13.30</td>
      <td class="status" id="status">Opptatt</td>
      </tr>
      <tr>
      <td id="klokkeslett">13.30-14.00</td>
      <td class="status" id="status">Ledig</td>
      </tr>
      <tr>
      <td id="klokkeslett">14.00-14.30</td>
      <td class="status" id="status">Ledig</td>
      </tr>
      <tr>
      <td id="klokkeslett">14.30-15.00</td>
      <td class="status" id="status">Ledig</td>
      </tr>
      <tr>
      <td id="klokkeslett">15.00-15.30</td>
      <td class="status" id="status">Ledig</td>
      </tr>
      <tr>
      <td id="klokkeslett">15.30-16.00</td>
      <td class="status" id="status">Ledig</td>
      </tr>
      
    </tbody>
  </table>
  </div>
 </div>
 
 <script type="text/javascript">
$(document).ready(function(){
    $('#dagtab td.status').each(function(){
        if ($(this).text() === 'Ledig') {
            $(this).css('background-color','green');
        }
        
        else{
            $(this).css('background-color','lightcoral');
        }
    });
});
</script>


            
        </form:form>
        
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.1/js/bootstrap-datepicker.min.js"></script>

        <script type="text/javascript">
            
            $('.input-daterange input').each(function() {
                $(this).datepicker({
                    format: 'yyyy-mm-dd'
                });
            });
            
        </script>    
    </body>
</html>