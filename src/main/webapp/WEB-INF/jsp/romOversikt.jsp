<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

    <!DOCTYPE html>

<html>
    <head>
        <title>Planvisning</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        
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
        
            <table id="brukerTabell" class="table table-hover table-bordered results">
   
                    <thead>
                        <tr class="warning no-result">
                            <td colspan="4"><i class="fa fa-warning"></i> Fant ingen resultater</td>
                        </tr>
                        <tr>
                                <th>Romnr</th>
                                <th>Etasje</th>

                            </tr>
                            
                      <tr class="warning no-result">
                        <td colspan="5"><i class="fa fa-warning"></i> Ingen resultater</td>
                      </tr>        
                            
                    </thead>
                    
                        <tbody>
                           <c:forEach items="${alleRom}" var="rom">                 
                                <tr>
                                    <td>${rom.getRomnr()}</td>
                                    <td>${rom.getEtasje()}</td>
                                </tr>  

                            </c:forEach>           
                        </tbody>
            </table>
                
                
            </div>
            
            
        </div>
        
        
        
        
        
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
             
    
            
          });
          
          function visEtasje(etasje) {
                document.forms["valg"]["etasje"].value = etasje;
                document.forms["valg"].submit();
            }
        </script>
        
    </body>
</html>
