<%-- 
    Document   : admin
    Created on : 30.11.2015, 5:57:37
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
        <title>Admin page</title>

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
    </head>
    <body>
        <div class="container">
            <div class="jumbotron">
                <h1>Административная панель</h1>
                <p>Расширение возможностей функционала</p>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" href="#home">Товар на складе</a></li>
                        <li><a data-toggle="tab" href="#menu1" disable>Пользователи</a></li>
                        <li><a data-toggle="tab" href="#menu2" disable>Корзины</a></li>
                    </ul>

                    <div class="tab-content" style="margin-top:20px;">
                        <div id="home" class="tab-pane fade in active">
                            <c:url value="/admin/stock" var="adminURL"/>
                            <form:form class="form-inline" modelAttribute="stock" method="POST" action="${adminURL}">  
                                <form:input type="text" placeholder="Введите название товара" path="prizes" class="form-control" value="" 
                                            name="prizes" required="true" pattern="^[a-zA-Z0-9]{6,}"/>   

                                <form:input type="text" placeholder="Введите категорию товара" path="category" class="form-control" value="" 
                                            name="category" required="true" pattern="^[a-zA-Z0-9]{3,}"/> 
                                
                                <a type="button" class="btn btn-default" href=""><i class="fa fa-camera-retro"></i></a>
                                <input class="btn btn-default" type="submit" value="ДОБАВИТЬ"/>                                
                                <input type="hidden" id="_csrf_entrance" name="_csrf" value="${_csrf.token}"/>
                                <input id="token" type="hidden" value="${sessionScope.csrfToken}" />
                            </form:form>


                            <table class="table" style="margin-top:20px;">
                                <tr>
                                    <td>Выбор</td>
                                    <td>Id</td>
                                    <td>Prizes</td>
                                    <td>Catergory</td>
                                    <td>ComingDate</td>
                                    <td>Sold</td>
                                    <td>Rent</td>
                                    <td>Действие</td>
                                </tr>

                                <c:forEach items="${stockList}" var="current">
                                    <tr>
                                        <td><input type="checkbox" id="st_check${current.id}"></td>
                                        <td><c:out value="${current.id}"/></td>
                                        <td><c:out value="${current.prizes}"/></td>
                                        <td><c:out value="${current.category}"/></td>
                                        <td><c:out value="20/11/2015 14:55"/></td>
                                        <td><input type="checkbox" value="<c:out value="${current.rented}"/>" disabled="true"></td>
                                        <td><input type="checkbox" value="<c:out value="${current.sold}" />" disabled="true"></td>
                                        <td> 
                                            <a type="button" class="btn btn-default" href=""><i class="glyphicon glyphicon-pencil"></i></a>
                                            <a type="button" class="btn btn-default" href=""><i class="glyphicon glyphicon-remove"></i></a>  
                                            <a type="button" class="btn btn-default" href=""><i class="fa fa-eye"></i></a>
                                        </td>
                                    </tr>
                                </c:forEach>    
                            </table>   
                        </div>
                        <div id="menu1" class="tab-pane fade">
                            <%--
                            <c:url value="/admin/user" var="userURL"/>
                            <form:form class="form-inline" modelAttribute="userForm" method="POST" action="${userURL}">                                 

                                <form:input type="text" placeholder="Введите логин" path="username" value="" 
                                            name="login" class="form-control" required="true" pattern="^[a-zA-Z0-9]{6,}"/>    

                                <form:input type="email" placeholder="Введите e-mail" path="email" value=""
                                            name="email" class="form-control" required="true"/>

                                <form:input type="text" placeholder="Введите фамилию" path="sname" value=""
                                            name="surname" class="form-control" required="true" pattern="^[А-Яа-яЁё\s]+$"/>

                                <form:input type="text" placeholder="Введите имя" value=""
                                            path="fname" name="name" class="form-control" required="true" pattern="^[А-Яа-яЁё\s]+$"/>

                                <form:input type="text" placeholder="Введите отчество" path="tname" value=""
                                            name="thirdname" class="form-control" pattern="^[А-Яа-яЁё\s]+$"/>

                                <form:input type="password" placeholder="Введите пароль" value=""
                                            path="password" name="password" class="form-control" required="true" pattern="[A-Za-z0-9]{6,}"/>

                                <form:input type="password" placeholder="Повторите пароль" value=""
                                            path="confirmPassword" name="passwordtrue" class="form-control" required="true" pattern="[A-Za-z0-9]{6,}"/>

                                <input class="btn btn-default" type="submit" value="ДОБАВИТЬ"/>
                                <input type="hidden" id="_csrf_entrance" name="_csrf" value="${_csrf.token}"/>
                                <input id="token" type="hidden" value="${sessionScope.csrfToken}" />
                            </form:form>


                            <table class="table" style="margin-top:20px;">
                                <tr>
                                    <td>Id</td>
                                    <td>FIO</td>
                                    <td>Adress</td>
                                    <td>Telephone</td>
                                    <td>email</td>
                                    <td>password</td>
                                    <td>age</td>
                                    <td>numberoftikets</td>
                                    <td>discount</td>
                                    <td>regdate</td>
                                    <td>lastonline</td>
                                    <td>verifiedAccount</td>
                                    <td>summaryCash</td>
                                    <td>login</td>
                                    <td>userType</td>
                                    <td>accountExpired</td>
                                    <td>accountLocked</td>
                                    <td>enabled</td>
                                </tr>

                                <c:forEach items="${userList}" var="current">
                                    <tr>
                                        <td><c:out value="${user.id}"/><p></td>
                                        <td><c:out value="${user.fio}"/><p></td>
                                        <td><c:out value="${user.adress}"/><p></td>
                                        <td><c:out value="${user.telephone}"/><p></td>
                                        <td><c:out value="${user.email}"/><p></td>
                                        <td><c:out value="${user.password}"/><p></td>
                                        <td><c:out value="${user.age}"/><p></td>
                                        <td><c:out value="${user.numberoftikets}"/><p></td>
                                        <td><c:out value="${user.discount}"/><p></td>
                                        <td><c:out value="${user.regdate}"/><p></td>
                                        <td><c:out value="${user.lastonline}"/><p></td>
                                        <td><c:out value="${user.verifiedAccount}"/><p></td>
                                        <td><c:out value="${user.summaryCash}"/><p></td>
                                        <td><c:out value="${user.login}"/><p></td>
                                        <td><c:out value="${user.userType.TypeName}"/><p></td>
                                        <td><c:out value="${user.accountExpired}"/><p></td>
                                        <td><c:out value="${user.accountLocked}"/><p></td>
                                        <td><c:out value="${user.enabled}"/><p></td>
                                    </tr>
                                </c:forEach>    
                            </table>  
                            --%>
                        </div>
                        <div id="menu2" class="tab-pane fade">
                            <h3>Menu 2</h3>
                            <p>Some content in menu 2.</p>
                        </div>
                    </div>


                </div>
            </div>
        </div>

    </body>
</html>
