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
                            <label>Romnummer</label>
                            <input path="romNummer" class="form-control" id="romnr" name ="romNummer" required/>
                        </div>
                        <div class="form-group input-daterange" >
                            <label>Fra</label>
                            <input path="fratid" name = "fratid" class="form-control"  id="datoFra"  required/>  
                            <select id ="fratidtimer" name="fratidtimer" required>
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
                            <select id ="fratidmin" name = "fratidmin" required>
                            <option value="00">00</option>
                            <option value="30">30</option>
                            
                            </select>
                            <label>Til</label>
                            <input type="date" path="tiltid" name = "tiltid" class="form-control"  id="datoTil" required/>
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
          <h4>Velg dato <input type="text" name = "dato" class="dato"  id="dato" onchange="minfunction(document.getElementById('dropdown').selectedIndex.text)"></h4>
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
        <td class="klokkeslett" id="i1">06.00-06.30</td>
        <td class="status" id="1"></td>
      </tr>
      <tr>
        <td class="klokkeslett" id="i2">06.30-07.00</td>
        <td class="status" id="2"></td>
      </tr>
      <tr>
        <td class="klokkeslett" id="i3">07.00-07.30</td>
        <td class="status" id="3"></td>
      </tr><tr>
        <td class="klokkeslett" id="i4">07.30-08.00</td>
        <td class="status" id="4"></td>
      </tr>
      <tr>
        <td class="klokkeslett" id="i5">08.00-08.30</td>
        <td class="status" id="5"></td>
      </tr>
      <tr>
      <td class="klokkeslett" id="i6">08.30-09.00</td>
      <td class="status" id="6"></td>
      </tr>
      <tr>
      <td class="klokkeslett" id="i7">09.00-09.30</td>
      <td class="status" id="7"></td>
      </tr>
      <tr>
      <td class="klokkeslett" id="i8">09.30-10.00</td>
      <td class="status" id="8"></td>
      </tr>
      <tr>
      <td class="klokkeslett" id="i9">10.00-10.30</td>
      <td class="status" id="9"></td>
      </tr>
      <tr>
      <td class="klokkeslett" id="i10">10.30-11.00</td>
      <td class="status" id="10"></td>
      </tr>
      <tr>
      <td class="klokkeslett" id="i11">11.00-11.30</td>
      <td class="status" id="11"></td>
      </tr>
      <tr>
      <td class="klokkeslett" id="i12">11.30-12.00</td>
      <td class="status" id="12"></td>
      </tr>
      <tr>
      <td class="klokkeslett" id="i13">12.00-12.30</td>
      <td class="status" id="13"></td>
      </tr>
      <tr>
      <td class="klokkeslett" id="i14">12.30-13.00</td>
      <td class="status" id="14"></td>
      </tr>
      <tr>
      <td class="klokkeslett" id="i15">13.00-13.30</td>
      <td class="status" id="15"></td>
      </tr>
      <tr>
      <td class="klokkeslett" id="i16">13.30-14.00</td>
      <td class="status" id="16"></td>
      </tr>
      <tr>
      <td class="klokkeslett" id="i17">14.00-14.30</td>
      <td class="status" id="17"></td>
      </tr>
      <tr>
      <td class="klokkeslett" id="i18">14.30-15.00</td>
      <td class="status" id="18"></td>
      </tr>
      <tr>
      <td class="klokkeslett" id="i19">15.00-15.30</td>
      <td class="status" id="19"></td>
      </tr>
      <tr>
      <td class="klokkeslett" id="i20">15.30-16.00</td>
      <td class="status" id="20"></td>
      </tr>
      
    </tbody>
 
 <script type="text/javascript">

function minfunction(romnummer){
    var dato = $('#dato').val();
    //alert (dato);
    var select = document.getElementById("dropdown");
    var selected = select.options[select.selectedIndex].text;
    var data = '{"romnr":"'+selected+'", "dato":"'+dato+'"}';
    
    $.get("books", {"data":data}, function(Response){
       // alert(JSON.stringify(Response));
        var obj = Response;
        obj.reverse();
        
        for(var i=1; i<21; i++){
            var x = obj.pop();
            var n = i.toString();
            document.getElementById(n).innerHTML = x;
        }
        
       
        oppdaterTabell();
            
      });
      
      
}

</script>

<script>
    function oppdaterTabell(){
    $('#dagtab td.status').each(function(){
        if ($(this).text() === 'Ledig') {
            $(this).css('background-color','green');
        }
        
        else{
            $(this).css('background-color','lightcoral');
        }
        
    });
}
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