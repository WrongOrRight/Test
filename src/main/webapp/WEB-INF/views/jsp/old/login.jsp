<%-- 
    Document   : login
    Created on : 22.11.2015, 13:38:51
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
        <title>JSP Page</title>
        <link href="<c:url value="/resources/css/reset.css"/>" rel="stylesheet">
        <link href="<c:url value="/resources/css/mainPageStyle.css"/>" rel="stylesheet">
        <link href='https://fonts.googleapis.com/css?family=PT+Sans+Narrow&subset=latin,cyrillic' rel='stylesheet' type='text/css'>
        <script src="<c:url value="/resources/js/jquery-2.1.4.min.js"/>"></script>
        <script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
    </head>
    <body>
        <div class="window-2">
            <a href="<c:url value="/"/>"><img class="exit-modal" src="<c:url value="/resources/img/close.png"/>" /></a>
            <div class="window-top-title">
                <h1>
                    ВХОД
                </h1>
            </div>

            <form class="all-fields-2" action="<c:url value="/login"/>" method="post">
                <div class="field w2-login-mail">
                    <h1>
                        ЛОГИН/ЭЛЕКТРОННАЯ ПОЧТА
                    </h1>
                    <input type="text" placeholder="Введите логин или почту" value="" name="username" class="paint-field">
                </div>
                <div class="field w2-password">
                    <h1>
                        ПАРОЛЬ
                    </h1>
                    <input type="password" placeholder="Введите пароль" value="" name="password" class="paint-field">
                </div>

                <div class="check">
                    <input type="checkbox" class="checkbox" id="rememberMe"/>
                    <label for="rememberMe"><h1> ЗАПОМНИТЬ МЕНЯ</h1></label>                               
                </div>

                <a href="#rememberMe" class="remark-w2">
                    <h1>
                        ЗАБЫЛИ ПАРОЛЬ?
                    </h1>
                </a>
                <input class="button-1 w2" type="submit" value="ВОЙТИ"/>
                <input type="hidden" id="_csrf_entrance" name="_csrf" value="${_csrf.token}"/>
                <input id="token" type="hidden" value="${sessionScope.csrfToken}" />

            </form>

            <div class="after-form">
                <hr/>
                <h1>
                    ВХОД ЧЕРЕЗ СОЦИАЛЬНЫЕ СЕТИ
                </h1>
                <div class="all-img-w2">
                    <a href="<c:url value="/public/vk_connection_url"/>"><img src="<c:url value="/resources/img/vk.jpg"/>"/></a>
                    <a href="<c:url value="/public/tw_connection_url"/>"><img src="<c:url value="/resources/img/twi.jpg"/>"/></a>
                    <a href="<c:url value="/public/fb_connection_url"/>"><img src="<c:url value="/resources/img/fb.jpg"/>"/></a>
                    <a href="<c:url value="/public/ok_connection_url"/>"><img src="<c:url value="/resources/img/ok.jpg"/>"/></a>
                </div>
            </div>

        </div>
    </body>
</html>
