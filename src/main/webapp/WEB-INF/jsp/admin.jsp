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
        
        <style>
            body{
               
            padding:20px 20px;
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

        </style>
	<style type="text/css">
	.bs-example{
		margin: 20px;
	}
</style>
    </head>
    
    <body>
        
        
        <div class="bs-example">
    <ul class="nav nav-tabs" id="myTab">
        <li class="active"><a href="#brukerFane">Brukere</a></li>
        <li><a href="#fagFane">Fag</a></li>
        
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
        
     <a class="btn btn-default col-lg-6 col-xs-6 well" role="button" href="<c:url value="registrerBruker"/>">Registrer ny bruker</a>
        
        
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
        
        <table id="fagTabell" class="table table-striped table-bordered results">
   
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
        
   <!--  <a class="btn btn-default col-lg-6 col-xs-6" role="button" href="<c:url value="registrerBruker"/>">Legg til fag</a> -->
        
     <!-- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||-->   
        
        </div>
        
    </div>
        
        
                          <!-- Latest compiled and minified JavaScript -->
	<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
       
           </body>
</html>
<script>
    $(document).ready(function() {
  $(".search").keyup(function () {
    var searchTerm = $(".search").val();
    var listItem = $('.results tbody').children('tr');
    var searchSplit = searchTerm.replace(/ /g, "'):containsi('");
    
  $.extend($.expr[':'], {'containsi': function(elem, i, match, array){
        return (elem.textContent || elem.innerText || '').toLowerCase().indexOf((match[3] || "").toLowerCase()) >= 0;
    }
  });
    
  $(".results tbody tr").not(":containsi('" + searchSplit + "')").each(function(e){
    $(this).attr('visible','false');
  });

  $(".results tbody tr:containsi('" + searchSplit + "')").each(function(e){
    $(this).attr('visible','true');
  });

  var jobCount = $('.results tbody tr[visible="true"]').length;
    $('.counter').text(jobCount + ' elementer');

  if(jobCount === '0') {$('.no-result').show();}
    else {$('.no-result').hide();}
		  });
   
   //tab bytteren
   $("#myTab a").click(function(e){
    	e.preventDefault();
    	$(this).tab('show');
    });
                  
});
  
    
    function onClickBrukertabell() {
    var table = document.getElementById("brukerTabell");
    var rows = table.getElementsByTagName("tr");
    for (i = 0; i < rows.length; i++) {
        var currentRow = table.rows[i];
        var createClickHandler = 
            function(row) 
            {
                return function() { 
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
                                        $(".modal-body #brukernavn").val( id );
                                        $(".modal-body #brukertype").val( bType );
                                        $(".modal-body #navn").val( navn );
                                       // $(".modal-body #passord").val( passord );
                                        $(".modal-body #mail").val( mail );
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
            function(row) 
            {
                return function() { 
                                        var cell = row.getElementsByTagName("td")[0];
                                        var cell2 = row.getElementsByTagName("td")[1];
          
                                        var fagkode = cell.innerHTML;
                                        var navn = cell2.innerHTML;
   
   

                        /*                //alert("id:" + id);
                                        $(".modal-body #brukernavn").val( fagkode );
                                        $(".modal-body #brukertype").val( navn );
                                        
                                        $('#visFagModal').modal('show');
                          */              
                                        
                                 };
            };

        currentRow.onclick = createClickHandler(currentRow);
    }
}
 window.onload = onClickFagtabell();
 

 
</script>