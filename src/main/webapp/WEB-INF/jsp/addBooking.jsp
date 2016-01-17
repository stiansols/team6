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
                width: 12.5%;
            }
            
            td{
                width: 12.5%;
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
                        <div class="form-group">
                            <label>Fra</label>
                            <input type="date" path="fratid" name = "fratid" class="form-control"  id="datoFra"/>
                            <label>Til</label>
                            <input type="date" path="tiltid" name = "tiltid" class="form-control"  id="datoTil"/>
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
  <div class="table-responsive" id="uke">          
  <table class="table table-bordered table-hover">
    <thead>
      <tr>
        <th>Klokkeslett</th>
        <th>Mandag</th>
        <th>Tirsdag</th>
        <th>Onsdag</th>
        <th>Torsdag</th>
        <th>Fredag</th>
        <th>Lørdag</th>
        <th>Søndag</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>08.00-08.30</td>
        <td class="success">-</td>
        <td class="danger">-</td>
        <td class="danger">-</td>
        <td class="success">-</td>
        <td class="danger">-</td>
        <td class="success">-</td>
        <td class="success">-</td>
      </tr>
      <tr>
      <td>08.30-09.00</td>
      <td>-</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
      </tr>
      <tr>
      <td>09.00-09.30</td>
      <td>-</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
      </tr>
      <tr>
      <td>09.30-10.00</td>
      <td>-</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
      </tr>
      <tr>
      <td>10.00-10.30</td>
      <td>-</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
      </tr>
      <tr>
      <td>10.30-11.00</td>
      <td>-</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
      </tr>
      <tr>
      <td>11.00-11.30</td>
      <td>-</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
      </tr>
      <tr>
      <td>11.30-12.00</td>
      <td>-</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
      </tr>
      <tr>
      <td>12.00-12.30</td>
      <td>-</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
      </tr>
      <tr>
      <td>12.30-13.00</td>
      <td>-</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
      </tr>
      <tr>
      <td>13.00-13.30</td>
      <td>-</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
      </tr>
      <tr>
      <td>13.30-14.00</td>
      <td>-</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
      </tr>
      
    </tbody>
  </table>
  </div>
 </div>

            
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