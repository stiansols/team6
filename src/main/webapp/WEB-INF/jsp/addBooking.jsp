<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>




<form:form method="POST" modelAttribute="booking" action="nyBooking">
   <table>
       <tr>
               <td>id: </td>
               <td><form:input path="bookingId" /></td>
       </tr>
       <tr>
               <td>Brukernavn: </td>
               <td><form:input path="brukernavn" /></td>
       </tr>
       <tr>
               <td>Rom Nummer: </td>
               <td><form:input path="romNummer" /></td>
       </tr>
       <tr>
               <td>Fra: </td>
               <td><form:input path="fratid" /></td>
       </tr>
       <tr>
               <td>Til: </td>
               <td><form:input path="tiltid" /></td>
       </tr> 

       <tr>
               <td> <input type='SUBMIT' value="SEND"> </td>
       </tr>
   </table>        

</form:form>