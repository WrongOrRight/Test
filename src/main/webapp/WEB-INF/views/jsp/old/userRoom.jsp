<%-- 
    Document   : index1
    Created on : 03.11.2015, 16:45:41
    Author     : Татьяна Юрченко
--%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ru">
    <head>
        <meta charset="utf-8">

        <link href="<c:url value="/resources/css/reset.css"/>" rel="stylesheet">
        <link href="<c:url value="/resources/css/userRoomStyle.css"/>" rel="stylesheet">
        <link href='https://fonts.googleapis.com/css?family=PT+Sans+Narrow&subset=latin,cyrillic' rel='stylesheet' type='text/css'>

        <script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
        <title>User Room</title>
    </head>
    <script>
        $(document).ready(function() {
            $('.dilers-active').click(function() {
                $('.dilers').css({"display": "block"});
                $('.tikets').css({"display": "none"});
                $('.left-menu').css({"left": "30px"});
                $('.dilers-active').addClass('btn-3-active');
                $('.tikets-active').removeClass('btn-3-active');
            });
            $('.tikets-active').click(function() {
                $('.tikets').css({"display": "block"});
                $('.dilers').css({"display": "none"});
                $('.left-menu').css({"left": "145px"});
                $('.tikets-active').addClass('btn-3-active');
                $('.dilers-active').removeClass('btn-3-active');
            });
            $(".select-all").click(function() {
                $("input[type='checkbox']").each(function(a1, a2) {
                    // alert(a1+" "+a2);

                    $(this).prop({"checked": "true"});
                    //$(a2).attr({"checked":"true"});
                });
            });
            $('.print-all').click(function() {
                var myWin = open("./tiket", "displayWindow",
                        "width=450,height=250,status=no,toolbar=no,menubar=no");
                setTimeout(function() {
                    myWin.print();
                }, 2000);
            });
            $(".poach-open").click(function() {
                var csrf = $("#_csrf").val();

                $.post("./getUserPayment", {_csrf: csrf}, function(data, status) {

                    if (status == "success") {
                        var info = jQuery.parseJSON(data);
                        var count = info.paymentCount;
                        var scrollPoach = "";
                        for (var i = 0; i < count; i++)
                        {
                            scrollPoach += '<div class="pouch-item"><div class="sub">';
                            switch (info.payment[i].paymentType) {
                                case 1:
                                    scrollPoach += '<img class="qiwi-money" src="<c:url value="/resources/img/qiwi.png"/>"/>';
                                    break;
                                case 2:
                                    scrollPoach += '<img class="web-money" src="<c:url value="/resources/img/webmoney.png"/>"/>';
                                    break;
                                case 3:
                                    scrollPoach += '<img class="yandex-money" src="<c:url value="/resources/img/yandex-money.png"/>"/>';
                                    break;

                            }
                            scrollPoach += '</div><img class="del-pouch-item" src="<c:url value="/resources/img/close.png"/>"/>';
                            scrollPoach += '<h1>' + info.payment[i].paymentNum + '</h1>';
                            scrollPoach += '<h2>' + info.payment[i].balance + '</h2>';
                            scrollPoach += '</div>';

                        }

                    }
                    $(".pouch-scroll").html(scrollPoach);
                });
                $(".win-1").css({"display": "block"});
            });
            $(".send-tickets").click(function() {
                $(".win-2").css({"display": "block"});
            });
            $(".exit-modal").click(function() {
                $(".shadow-box").css({"display": "none"});
            });
            $(".promo-print").click(function() {
                $(".win-3").css({"display": "block"});
            });
            $(".ticket-styled").click(function() {
                $(".win-4").css({"display": "block"});
            });
            $(".change-price").click(function() {
                $(".win-5").css({"display": "block"});
            });
            $(".statistic").click(function() {
                $(".win-6").css({"display": "block"});
            });
            $(".promo-edit").click(function() {
                $(".win-7").css({"display": "block"});
            });


            $(".referal-prog").click(function() {
                $(".win-8").css({"display": "block"});
            });

            $(".open-lottery").click(function() {
                var myWin = open("./lottery", "Lottery Window",
                        "width=700,height=550,status=no,toolbar=no,menubar=no");
            });

            $(".w-pay").click(function() {
                var csrf = $("#_csrf").val();
                var myWin = null;
                if ($("#moneyBagId").val().length > 0)
                    myWin = open("./pay?money=" + $("#moneyBagId").val() + "&paymentType=" + $("#paymentSystem").val() + "&_csrf=" + csrf, "PaymentWindow",
                            "width=700,height=550");
            });

            getUserInfo();
        });
        var getUserInfo = function() {

            var balance = $(".balance");
            var discont = $(".discont");
            var ticketCount = $(".ticket-count");
            var allTicketCount = $(".all-ticket-count");
            var fio = $(".fio");
            var age = $(".age");
            var tel = $(".tel");
            var email = $(".email");
            var csrf = $("#_csrf").val();
            $.post("./getUserInfo", {_csrf: csrf}, function(data, status) {
                if (status == "success") {
                    var info = jQuery.parseJSON(data);
                    balance.html(info.balance);
                    discont.html(info.discont);
                    ticketCount.html(info.ticketCount);
                    allTicketCount.html(info.allTicketCount);
                    fio.html(info.fio);
                    age.html(info.age);
                    tel.html(info.tel);
                    email.html(info.email);
                }
            });
        };


    </script>
    <body>
        <sec:authentication var="user" property="principal" />
        <sec:authorize access="hasRole('ROLE_USER')">
            <div class="online-block">
                <input type="hidden" id="isAutorized" value="true"/>
                <p>Добрый день, <i>${user.username}!</i><br/></p>
                <a href="<c:url value="/"/>">Перейти на главную</a><br/>
                <a href="<c:url value="/j_spring_security_logout"/>">Выход</a>                    
            </div>
        </sec:authorize>

        <div class="general-background">
            <div class="wrapper">
                <div class="room-top-title">
                    <h1>
                        ЛИЧНЫЙ КАБИНЕТ
                    </h1>
                </div>               

                <div class="left-menu">
                    <div class="btn-3 tikets-active">
                        <p>БИЛЕТЫ</p>
                    </div>

                    <div class="btn-3 dilers-active btn-3-active">
                        <p>ДЛЯ ДИЛЕРА</p>
                    </div>
                </div>

                <div class="tikets">
                    <div class="clear-background">
                        <div class="all-actions-tikets">
                            <div class="button-action select-all">
                                <img class="select" src="<c:url value="/resources/img/select-all.png"/>"/>
                                <h1 class="select-h">
                                    ВЫДЕЛИТЬ ВСЕ
                                </h1>
                            </div>
                            <div class="button-action print-all">
                                <img class="print" src="<c:url value="/resources/img/print.png"/>"/>
                                <h1 class="print-h">
                                    ПЕЧАТАТЬ
                                </h1>
                            </div>
                            <div class="button-action send-tickets">
                                <img class="send" src="<c:url value="/resources/img/Send.png"/>"/>
                                <h1 class="send-h">
                                    ОТПРАВИТЬ
                                </h1>
                            </div>
                            <div class="button-action">
                                <img class="open" src="<c:url value="/resources/img/open.png"/>"/>
                                <h1 class="open-h">
                                    ОТКРЫТЬ
                                </h1>
                            </div>
                            <div class="button-action">
                                <img class="long" src="<c:url value="/resources/img/long.png"/>"/>
                                <h1 class="long-h">
                                    ПРОДЛИТЬ
                                </h1>
                            </div>
                            <div class="button-action">
                                <img class="delete" src="<c:url value="/resources/img/delete.png"/>"/>
                                <h1>
                                    УДАЛИТЬ
                                </h1>
                            </div>
                        </div>

                        <div class="tikets-background">
                            <div class="second-title">
                                <h1>
                                    ВАШИ БИЛЕТЫ
                                </h1>
                            </div>

                            <div class="visible-block">				
                                <ul>														
                                    <li>
                                        <div class="checkbox">
                                            <input id="check1" type="checkbox" name="check" value="check1">
                                            <label for="check1">   
                                                <input type="hidden" value="" class="tid"/>
                                                <input type="hidden" value="" class="tname"/>
                                                <input type="hidden" value="" class="ttitle"/>
                                                <input type="hidden" value="" class="tprice"/>
                                                <input type="hidden" value="" class="tadddate"/>
                                                <input type="hidden" value="" class="tenddate"/>
                                                <input type="hidden" value="" class="tisOpend"/>
                                                <img src="<c:url value="/resources/img/Tiket.jpg"/>"/>
                                            </label>
                                           
                                        </div>
                                    </li>
                                    <li>
                                        <div class="checkbox">
                                            <input id="check2" type="checkbox" name="check" value="check1">
                                            <label for="check2">
                                                <input type="hidden" value="" class="tid"/>
                                                <input type="hidden" value="" class="tname"/>
                                                <input type="hidden" value="" class="ttitle"/>
                                                <input type="hidden" value="" class="tprice"/>
                                                <input type="hidden" value="" class="tadddate"/>
                                                <input type="hidden" value="" class="tenddate"/>
                                                <input type="hidden" value="" class="tisOpend"/>
                                                <img src="<c:url value="/resources/img/Tiket.jpg"/>"/>
                                            </label>

                                        </div>
                                    </li>
                                    <li>
                                        <div class="checkbox">
                                            <input id="check3" type="checkbox" name="check" value="check1">
                                            <label for="check3">
                                                <input type="hidden" value="" class="tid"/>
                                                <input type="hidden" value="" class="tname"/>
                                                <input type="hidden" value="" class="ttitle"/>
                                                <input type="hidden" value="" class="tprice"/>
                                                <input type="hidden" value="" class="tadddate"/>
                                                <input type="hidden" value="" class="tenddate"/>
                                                <input type="hidden" value="" class="tisOpend"/>
                                                <img src="<c:url value="/resources/img/Tiket.jpg"/>"/>
                                            </label>	
                                        </div>

                                    </li>

                                    <li>
                                        <div class="checkbox">
                                            <input id="check4" type="checkbox" name="check" value="check1">
                                            <label for="check4">
                                                <img src="<c:url value="/resources/img/Tiket.jpg"/>"/>
                                            </label>	
                                        </div>

                                    </li>

                                    <li>
                                        <div class="checkbox">
                                            <input id="check5" type="checkbox" name="check" value="check1">
                                            <label for="check5">
                                                <input type="hidden" value="" class="tid"/>
                                                <input type="hidden" value="" class="tname"/>
                                                <input type="hidden" value="" class="ttitle"/>
                                                <input type="hidden" value="" class="tprice"/>
                                                <input type="hidden" value="" class="tadddate"/>
                                                <input type="hidden" value="" class="tenddate"/>
                                                <input type="hidden" value="" class="tisOpend"/>
                                                <img src="<c:url value="/resources/img/Tiket.jpg"/>"/>
                                            </label>
                                            
                                        </div>

                                    </li>

                                    <li>
                                        <div class="checkbox">
                                            <input id="check6" type="checkbox" name="check" value="check1">
                                            <label for="check6">
                                                <img src="<c:url value="/resources/img/Tiket.jpg"/>"/>
                                            </label>	
                                        </div>

                                    </li>


                                    <li>
                                        <div class="checkbox">
                                            <input id="check7" type="checkbox" name="check" value="check1">
                                            <label for="check7">
                                                <input type="hidden" value="" class="tid"/>
                                                <input type="hidden" value="" class="tname"/>
                                                <input type="hidden" value="" class="ttitle"/>
                                                <input type="hidden" value="" class="tprice"/>
                                                <input type="hidden" value="" class="tadddate"/>
                                                <input type="hidden" value="" class="tenddate"/>
                                                <input type="hidden" value="" class="tisOpend"/>
                                                <img src="<c:url value="/resources/img/Tiket.jpg"/>"/>
                                            </label>	
                                        </div>

                                    </li>


                                    <li>
                                        <div class="checkbox">
                                            <input id="check8" type="checkbox" name="check" value="check1">
                                            <label for="check8">
                                                <input type="hidden" value="" class="tid"/>
                                                <input type="hidden" value="" class="tname"/>
                                                <input type="hidden" value="" class="ttitle"/>
                                                <input type="hidden" value="" class="tprice"/>
                                                <input type="hidden" value="" class="tadddate"/>
                                                <input type="hidden" value="" class="tenddate"/>
                                                <input type="hidden" value="" class="tisOpend"/>
                                                <img src="<c:url value="/resources/img/Tiket.jpg"/>"/>
                                            </label>	
                                        </div>

                                    </li>
                                </ul>
                            </div>

                            <div class="page-scroll">
                                <div class="page-number">
                                    <h1>
                                        <<
                                    </h1>
                                </div>
                                <div class="page-number">
                                    <h1>
                                        1
                                    </h1>
                                </div>
                                <div class="page-number">
                                    <h1>
                                        2
                                    </h1>
                                </div>
                                <div class="page-number">
                                    <h1>
                                        3
                                    </h1>
                                </div>
                                <div class="page-number">
                                    <h1 class="points">
                                        . . .
                                    </h1>
                                </div>
                                <div class="page-number">
                                    <h1>
                                        >>
                                    </h1>
                                </div>						
                            </div>

                        </div>
                    </div>


                </div>

                <div class="dilers">
                    <div class="clear-background">
                        <div class="bg">
                            <img src="<c:url value="/getUserPhoto"/>" class="userPhoto" alt="*">
                            <h1>Информация о пользователя</h1>
                            <div class="lotery">
                                <p>БАЛАНС:</p><p class="balance">2000р</p><br/>
                                <p>ДИСКОНТ:</p><b class="discont">30%</b><p class="user-type">ДИЛЛЕР</p><br/>
                                <p>КОЛИЧЕСТВО БИЛЛЕТОВ:</p><p class="ticket-count">1000шт</p><br/>
                                <p>ВСЕГО БИЛЛЕТОВ:</p><p class="all-ticket-count">1560шт</p><br/>
                                <a href="#lotteryOpen" class="btn open-lottery">ЛОТЕРЕЯ</a>
                            </div>

                            <div class="pouch">
                                <p>ФИО:</p><p class="fio">2000р</p><br/>
                                <p>ВОЗРАСТ:</p><p class="age">30 ЛЕТ</p><br/>
                                <p>ТЕЛЕФОН:</p><p class="tel">8-800-500-0-500</p><br/>
                                <p>E-MAIL:</p><p class="email">IVANOV@GMAIL.COM</p><br/>
                                <a href="#poach" class="btn poach-open">КОШЕЛЬКИ</a>
                            </div>

                            <div class="btn-group">
                                <a href="#" class="btn-2 promo-print"><img src="<c:url value="/resources/img/ic-1.png"/>"></a>
                                <a href="#" class="btn-2 ticket-styled"><img src="<c:url value="/resources/img/ic-2.png"/>"></a>
                                <a href="#" class="btn-2 change-price"><img src="<c:url value="/resources/img/ic-3.png"/>"></a>
                                <a href="#" class="btn-2 statistic"><img src="<c:url value="/resources/img/ic-4.png"/>"></a>
                                <a href="#" class="btn-2 promo-edit"><img src="<c:url value="/resources/img/ic-5.png"/>"></a>
                                <a href="#" class="btn-2 referal-prog"><img src="<c:url value="/resources/img/ic-6.png"/>"></a>
                            </div>

                            <canvas class="diagram">

                            </canvas>
                        </div>				
                    </div>
                </div>
            </div>
        </div>
        <div class="shadow-box win-1" style="display:none"  >
            <div class="window-1">
                <img class="exit-modal" src="<c:url value="/resources/img/close.png"/>"/>
                <h1>КОШЕЛЬКИ</h1>
                <p>Всего денег: <b>2550руб</b></p>
                <select name="paymantSystem" class="paymentSystem" id="paymentSystem" >
                    <option value="1">Qiwi Wallet</option>
                    <option value="2">Yandex Деньги</option>
                    <option value="3">WebMoney</option>
                </select>                
                <input type="text" value="" name="moneyBag" id="moneyBagId" placeholder="Вносимая сумма..." pattern="[0-9]{,10}"/>
                <input type="button" class="button-1 w1 w-pay" value="ВНЕСТИ">
                <div class="pouch-scroll">

                    <div class="pouch-item">                        
                        <div class="sub">
                            <img class="qiwi-money" src="<c:url value="/resources/img/qiwi.png"/>"/>                            
                        </div>
                        <img class="del-pouch-item" src="<c:url value="/resources/img/close.png"/>"/>
                        <h1>Номер кошелька:123456789012346</h1>
                        <h2>Дата добавления: 12.05.2015</h2>
                        <h2>Баланс: 230р 00 коп.</h2>
                    </div>

                    <div class="pouch-item">

                        <div class="sub">
                            <img class="web-money" src="<c:url value="/resources/img/webmoney.png"/>"/>                            
                        </div>
                        <img class="del-pouch-item" src="<c:url value="/resources/img/close.png"/>"/>
                        <h1>Номер кошелька:123456789012346</h1>
                        <h2>Баланс: 230р 00 коп.</h2>
                    </div>


                    <div class="pouch-item">                        
                        <div class="sub">
                            <img class="yandex-money" src="<c:url value="/resources/img/yandex-money.png"/>"/>                            
                        </div>
                        <img class="del-pouch-item" src="<c:url value="/resources/img/close.png"/>"/>
                        <h1>Номер кошелька:123456789012346</h1>
                        <h2>Баланс: 230р 00 коп.</h2>
                    </div>

                    <div class="pouch-item">                        
                        <div class="sub">
                            <img class="yandex-money" src="<c:url value="/resources/img/yandex-money.png"/>"/>                            
                        </div>
                        <img class="del-pouch-item" src="<c:url value="/resources/img/close.png"/>"/>
                        <h1>Номер кошелька:123456789012346</h1>
                        <h2>Баланс: 230р 00 коп.</h2>
                    </div>
                </div>
            </div>
        </div>  

        <div class="shadow-box win-2" style="display:none"  >
            <div class="window-1">
                <img class="exit-modal" src="<c:url value="/resources/img/close.png"/>"/>
                <h1>ОТПРАВИТЬ БИЛЕТЫ</h1>
                <p>Выбрано билетов: <b>2</b> шт.</p>
                <input type="search" placeholder="Найти пользователя" name="search" value=""/>
                <input type="button" class="button-1 w2" value="ОТПРАВИТЬ">
            </div>
        </div>

        <div class="shadow-box win-3" style="display:none"  >
            <div class="window-1">
                <img class="exit-modal" src="<c:url value="/resources/img/close.png"/>"/>
                <h1>ПЕЧАТЬ РЕКЛАМНОЙ ПРОДУКЦИИ</h1>
            </div>
        </div>

        <div class="shadow-box win-4" style="display:none"  >
            <div class="window-1">
                <img class="exit-modal" src="<c:url value="/resources/img/close.png"/>"/>
                <h1>СТИЛИЗАЦИЯ БИЛЕТА</h1>
            </div>
        </div>

        <div class="shadow-box win-5" style="display:none"  >
            <div class="window-1">
                <img class="exit-modal" src="<c:url value="/resources/img/close.png"/>"/>
                <h1>ИЗМЕНЕНИЕ ЦЕНЫ БИЛЕТА</h1>
            </div>
        </div>

        <div class="shadow-box win-6" style="display:none"  >
            <div class="window-1">
                <img class="exit-modal" src="<c:url value="/resources/img/close.png"/>"/>
                <h1>СТАТИСТИКА ПРОДАЖ</h1>
            </div>
        </div>

        <div class="shadow-box win-7" style="display:none"  >
            <div class="window-1">
                <img class="exit-modal" src="<c:url value="/resources/img/close.png"/>"/>
                <h1>РЕДАКТОР РЕКЛАМНОЙ ПРОДУКЦИИ</h1>
            </div>
        </div>

        <div class="shadow-box win-8" style="display:none"  >
            <div class="window-1">
                <img class="exit-modal" src="<c:url value="/resources/img/close.png"/>"/>
                <h1>РЕФЕРАЛЬНАЯ ПРОГРАММА</h1>               
            </div>
        </div>     

        <div class="shadow-box win-error" style="display:none"  >
            <div class="window-error">
                <img class="exit-modal" src="<c:url value="/resources/img/close.png"/>"/>
                <h1>СООБЩЕНИЕ ОБ ОШИБКЕ</h1>
                <p>404 Сообщение об ошибке</p>
                <input type="button" class="button-1 w2" value="ПОЛУЧИТЬ">
            </div>
        </div>
        <input type="hidden" id="_csrf" name="_csrf" value="${_csrf.token}"/>
    </body>


    <script src="<c:url value="/resources/js/jquery-2.1.4.min.js"/>"></script>
</html>
