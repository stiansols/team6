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
                        <div class="form-group input-daterange" >
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
 
            
  <div class="container">
  <h4>Oversikt for rom 
      <select id ="dropdown" onchange="minfunction(this.options[this.selectedIndex].text)">
        <c:forEach items="${alleRom}" var="rom">                 
            <option >${rom.getRomnr()}</option>  
        </c:forEach>           
      </select>
  </h4> 
  <form:form method="POST" value="fuckingsdato">
      <div class="form group input-daterange">
          <h4>Velg dato <input type="text" name = "dato" class="dato"  id="dato"/></h4>
      </div> 
   </form:form>
      
  <div class="table-responsive" id="dag">          
  <table class="table table-bordered table-hover" id="dagtab">
    <thead>
      <tr>
        <th>Klokkeslett</th>
        <th>Status</th>
      </tr>
    </thead>
    <tbody>
       <tr>
        <td class="klokkeslett" id="1">06.00-06.30</td>
        <td class="status" id="status"></td>
      </tr>
      <tr>
        <td class="klokkeslett" id="2">06.30-07.00</td>
        <td class="status" id="status"></td>
      </tr>
      <tr>
        <td class="klokkeslett" id="3">07.00-07.30</td>
        <td class="status" id="status"></td>
      </tr><tr>
        <td class="klokkeslett" id="4">07.30-08.00</td>
        <td class="status" id="status"></td>
      </tr>
      <tr>
        <td class="klokkeslett" id="5">08.00-08.30</td>
        <td class="status" id="status"></td>
      </tr>
      <tr>
      <td class="klokkeslett" id="6">08.30-09.00</td>
      <td class="status" id="status"></td>
      </tr>
      <tr>
      <td class="klokkeslett" id="7">09.00-09.30</td>
      <td class="status" id="status"></td>
      </tr>
      <tr>
      <td class="klokkeslett" id="8">09.30-10.00</td>
      <td class="status" id="status"></td>
      </tr>
      <tr>
      <td class="klokkeslett" id="9">10.00-10.30</td>
      <td class="status" id="status"></td>
      </tr>
      <tr>
      <td class="klokkeslett" id="10">10.30-11.00</td>
      <td class="status" id="status"></td>
      </tr>
      <tr>
      <td class="klokkeslett" id="11">11.00-11.30</td>
      <td class="status" id="status"></td>
      </tr>
      <tr>
      <td class="klokkeslett" id="12">11.30-12.00</td>
      <td class="status" id="status"></td>
      </tr>
      <tr>
      <td class="klokkeslett" id="13">12.00-12.30</td>
      <td class="status" id="status"></td>
      </tr>
      <tr>
      <td class="klokkeslett" id="14">12.30-13.00</td>
      <td class="status" id="status"></td>
      </tr>
      <tr>
      <td class="klokkeslett" id="15">13.00-13.30</td>
      <td class="status" id="status"></td>
      </tr>
      <tr>
      <td class="klokkeslett" id="16">13.30-14.00</td>
      <td class="status" id="status"></td>
      </tr>
      <tr>
      <td class="klokkeslett" id="17">14.00-14.30</td>
      <td class="status" id="status"></td>
      </tr>
      <tr>
      <td class="klokkeslett" id="18">14.30-15.00</td>
      <td class="status" id="status"></td>
      </tr>
      <tr>
      <td class="klokkeslett" id="19">15.00-15.30</td>
      <td class="status" id="status"></td>
      </tr>
      <tr>
      <td class="klokkeslett" id="20">15.30-16.00</td>
      <td class="status" id="status"></td>
      </tr>
      
    </tbody>
 
 <script type="text/javascript">



function minfunction(romnummer){
    var dato = $('#dato').val();
    alert (dato);
    var select = document.getElementById("dropdown");
    var selected = select.options[select.selectedIndex].text;
    var data = '{"romnr":"'+selected+'", "dato":"'+dato+'"}';
    
    
    alert(dato);
    $.get("books", {"data":data}, function(Response){
        alert(JSON.stringify(Response));
  
      });
      
      
}

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
        <script>
  
        </script>
    </body>
</html>