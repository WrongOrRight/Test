<%-- 
    Document   : uploadedFiles
    Created on : 26.12.2015, 20:43:48
    Author     : Aleks
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      
        <c:forEach  var="name" items="${list}" >
            ${name}<br>
            
          
        </c:forEach>
           ${buffer}
    </body>
</html>
