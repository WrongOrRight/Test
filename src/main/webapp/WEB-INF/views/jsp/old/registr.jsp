<%-- 
    Document   : registr
    Created on : 22.11.2015, 13:39:02
    Author     : Aleks
--%>
<%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>
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
        <div class="window-1">
            <a href="<c:url value="/"/>"><img class="exit-modal" src="<c:url value="/resources/img/close.png"/>"/></a>
            <div class="window-top-title">
                <h1>
                    РЕГИСТРАЦИЯ НОВОГО ПОЛЬЗОВАТЕЛЯ
                </h1>
            </div>
            <c:url value="/public/signup_confirm" var="regUrl"/>

            <form:form modelAttribute="user" method="POST" action="${regUrl}" class="all-fields">    
                <div class="field w1-login">
                    <h1>
                        ЛОГИН<b>*</b><br/>
                        <p>(не менее 6 символов)</p>
                    </h1>
                    <form:input type="text" placeholder="Введите логин" path="username" value="" 
                                name="login" class="paint-field" required="true" pattern="^[a-zA-Z0-9]{6,}"/>    
                </div>
                <div class="field w1-email">
                    <h1>
                        АДРЕС ЭЛЕКТРОННОЙ ПОЧТЫ<b>*</b><br/>
                        <p>(example@example.com)</p>
                    </h1>
                    <form:input type="email" placeholder="Введите e-mail" path="email" value=""
                                name="email" class="paint-field" required="true"/>
                </div>
                <div class="field w1-surname">
                    <h1>
                        ФАМИЛИЯ<b>*</b><br/>
                        <p>(только на русском)</p>

                    </h1>
                    <form:input type="text" placeholder="Введите фамилию" path="sname" value=""
                                name="surname" class="paint-field" required="true" pattern="^[А-Яа-яЁё\s]+$"/>
                </div>
                <div class="field w1-name">
                    <h1>
                        ИМЯ<b>*</b><br/>
                        <p>(только на русском)</p>
                    </h1>
                    <form:input type="text" placeholder="Введите имя" value=""
                                path="fname" name="name" class="paint-field" required="true" pattern="^[А-Яа-яЁё\s]+$"/>
                </div>
                <div class="field w1-third-name">
                    <h1>
                        ОТЧЕСТВО<br/>
                        <p>(только на русском)</p>
                    </h1>
                    <form:input type="text" placeholder="Введите отчество" path="tname" value=""
                                name="thirdname" class="paint-field" pattern="^[А-Яа-яЁё\s]+$"/>
                </div>
                <div class="field w1-password">
                    <h1>
                        ПАРОЛЬ<b>*</b><br/>
                        <p>(не менее 6 символов)</p>
                    </h1>
                    <form:input type="password" placeholder="Введите пароль" value=""
                                path="password" name="password" class="paint-field" required="true" pattern="[A-Za-z0-9]{6,}"/>
                </div>
                <div class="field w1-password-true">
                    <h1>
                        ПОДТВЕРЖДЕНИЕ ПАРОЛЯ<b>*</b><br/>
                        <p>(не менее 6 символов)</p>
                    </h1>
                    <form:input type="password" placeholder="Повторите пароль" value=""
                                path="confirmPassword" name="passwordtrue" class="paint-field" required="true" pattern="[A-Za-z0-9]{6,}"/>
                </div>
                <div class="capcha">
                    <%
                        ReCaptcha c = ReCaptchaFactory.newReCaptcha("6LePpQoTAAAAALfpVXPBsMAb_WB3LaW3lLP9MPAV", "6LePpQoTAAAAAPuvxMIXlWYbWScYOGXSC9dJR20M", false);
                        out.print(c.createRecaptchaHtml(null, null));
                    %>
                </div>
                <div class="remark">
                    <h1>
                        ПОЛЯ, ОТМЕЧЕННЫЕ ЗВЕЗДОЧКОЙ<b>*</b> - ОБЯЗАТЕЛЬНЫ ДЛЯ ЗАПОЛНЕНИЯ
                    </h1>
                </div>
                <input class="button-1 w2" type="submit" value="ВОЙТИ"/>
                <input id="token" type="hidden" value="${sessionScope.csrfToken}" />
            </form:form>

        </div>
    </body>
</html>
