<%-- 
    Document   : askRequest
    Created on : 24.11.2015, 23:49:40
    Author     : Татьяна  Юрченко
--%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %><!--подключение тегов spring security -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!--подключение тегов spring core -->
<%@page contentType="text/html" pageEncoding="UTF-8"%><!--настройка кодировки страницы -->
<!DOCTYPE html><!-- тег, говорящий что данный документ является документов html5-->
<html><!--начало html документа-->
    <head><!--начало части объявлений html документа -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><!--классическая настройка кодировки веб документа -->
        <title>Потверждение оплаты</title><!--заголовок окна документа-->
        <link href="<c:url value="/resources/css/reset.css"/>" rel="stylesheet"><!--подключение файла сброса базовых параметров css. Файл расположен в локальных ресурсах проекта -->
        <link href="<c:url value="/resources/css/userRoomStyle.css"/>" rel="stylesheet"><!--подключение файла стилей данной страницы. Файл расположен в локальных ресурсах проекта -->
        <link href='https://fonts.googleapis.com/css?family=PT+Sans+Narrow&subset=latin,cyrillic' rel='stylesheet' type='text/css'><!--подключение файла шрифта. Файл расположен удаленно -->
        <script src="<c:url value="/resources/js/jquery-2.1.4.min.js"/>"></script><!--подключение файла библиотеки jQuery. Файл расположен в локальных ресурсах проекта -->
        <script src="https://code.jquery.com/jquery-1.11.3.min.js"></script><!--подключение файла библиотеки jQuery. Файл расположен удаленно -->
        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css"><!--подключение файла шрифтовых иконок. Файл расположен удаленно -->
    </head><!--окончание части объявлений html документа -->
    <body><!--начало тела документа -->
        <div class="shadow-box win-12"><!--класс-контейнер, содержащий в себе форму потверждения платежа -->
            <div class="window-1"><!--вложеный контейнер -->
                <h1>Вы потверждаете запрос на сумму:</h1>   <!--заголовок, оповещающий пользователя о сумме его перевода --> 
                <h1>${OutSum} р. ?</h1><!--заголовок, в котором содержится непосредственно сумма перевода-->
                <form action="${action}" method="POST"><!--форма, содержащя адресс, на который будет отправлен запрос для осуществления перевода, метод отправки запроса - post-->
                    <input type=hidden name=MrchLogin value="${MrchLogin}"><!--скрытый параметр, необходимый для получения платежа: логин продавца -->
                    <input type=hidden name=OutSum value="${OutSum}"><!--скрытый параметр, необходимый для получения платежа: вводимая сумма -->
                    <input type=hidden name=InvId value="${InvId}"><!--скрытый параметр, необходимый для получения платежа: номер клиента -->
                    <input type=hidden name=Desc value="${Desc}"><!--скрытый параметр, необходимый для получения платежа: логин продавца описание -->
                    <input type=hidden name=Shp_item value="${Shp_item}"><!--скрытый параметр, необходимый для получения платежа: товар -->
                    <input type=hidden name=IncCurrLabel value="${IncCurrLabel}"><!--скрытый параметр, необходимый для получения платежа: тип кошелька-->
                    <input type=hidden name=Culture value="${Culture}"><!--скрытый параметр, необходимый для получения платежа: язык -->
                    <input type=hidden name=Email value="${Email}"><!--скрытый параметр, необходимый для получения платежа: эл. почта пользователя -->
                    <input type=hidden name=ExpirationDate value="${ExpirationDate}"><!--скрытый параметр, необходимый для получения платежа: срок окончания запроса на ввод денег -->
                    <input type=hidden name=OutSumCurrency value="${OutSumCurrency}"><!--скрытый параметр, необходимый для получения платежа: валюта, в которой будет осуществлен ввод денег -->
                    <input type=submit class="button-1 w2" value='Подтвердить'><!--кнопка отправки потверждения запроса -->
                </form><!--тег, закрывающий работу с формой -->
            </div><!--тег, закрывающий внутренний контейнер -->
        </div> <!--тег, закрывающий внешний контейнер-->
    </body><!--тег, закрывающий тело документа -->
</html><!--тег, закрывающий сам html документ -->
