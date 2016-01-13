<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<c:forEach items="${alleRom}" var="rom">
    ${rom}<br>
</c:forEach>
