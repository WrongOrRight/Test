<%-- 
    Document   : prize
    Created on : 01.12.2015, 23:10:54
    Author     : Aleks
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Your Prize</title>
        <link href="<c:url value="/resources/css/reset.css"/>" rel="stylesheet">
        <link href="<c:url value="/resources/css/mainPageStyle.css"/>" rel="stylesheet">
        <link href='https://fonts.googleapis.com/css?family=PT+Sans+Narrow&subset=latin,cyrillic' rel='stylesheet' type='text/css'>
        <script src="<c:url value="/resources/js/jquery-2.1.4.min.js"/>"></script>
        <script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
    </head>
    <body>
        <div class="shadow-box win-1">
            <div class="window-1">
                <h1 class="greatings">Поздравляем с победой!</h1>
                <h1 class="prize-num">Номер выигрыша: <b>№00000001</b></h1>
                <img class="prize" src="<c:url value="/resources/img/prize.jpg"/>">                
            </div>
        </div>
    </body>
</html>
