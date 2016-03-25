<%-- 
    Document   : tiket
    Created on : 03.11.2015, 22:11:46
    Author     : Татьяна Юрченко
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ru">
<html>
<head>
<meta charset="utf-8">
            <link href="<c:url value="/resources/css/reset.css"/>" rel="stylesheet">
            <link href="<c:url value="/resources/css/Tiket.css"/>" rel="stylesheet">
            <link href='https://fonts.googleapis.com/css?family=PT+Sans+Narrow&subset=latin,cyrillic' rel='stylesheet' type='text/css'>
            <script src="<c:url value="/resources/js/jquery-2.1.4.min.js"/>"></script>
            <script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script>
  
</script>
<title>Tiket</title>
</head>

<body>
  
		<div class="tiket-box">
                     
			<div class="top-text-1">
				<h1>
					НАЦИОНАЛЬНАЯ ЛОТЕРЕЯ ДНР
				</h1>
			</div>
			
			<div class="top-text-2">
				<p>
					100% ПОБЕДА
				</p>
			</div>
			
			<div class="white-rect"></div>
			
			<div class="qr-code">
				<img src="<c:url value="/resources/img/qr.png"/>" />
			</div>
			
			<div class="eagle">
				<img src="<c:url value="/resources/img/eagle.png"/>" />
			</div>
			
			<div class="data">
				<p>
					15.12.2015
				</p>
			</div>
			
			<div class="price">
				<h1>
					100 <h2>Р</h2>
				</h1>
			</div>
			  <img class="bg" src="<c:url value="/resources/img/bg.png"/>" />
                          <img class="tricolor" src="<c:url value="/resources/img/tricolor.png"/>" />
		</div>
  
</body>

</html>