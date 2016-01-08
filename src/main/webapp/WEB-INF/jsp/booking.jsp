<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>




<form:form method="POST" modelAttribute="booking" action="nyBooking">
   <form:errors path="*" />
   <table>
       <tr>
               <td>Rom Nummer: </td>
               <td><form:input path="romNummer" /></td>
               <td><form:errors path="romNummer" /></td>
       </tr>
       <tr>
               <td>Fra: </td>
               <td><form:input path="fratid" /></td>
               <td><form:errors path="fratid" /></td>
       </tr>
       <tr>
               <td>Til: </td>
               <td><form:input path="tiltid" /></td>
               <td><form:errors path="tiltid" /></td>
       </tr> 

       <tr>
               <td> <input type='submit' value="SEND"> </td>
       </tr>
   </table>        

</form:form>