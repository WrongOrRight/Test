<%-- 
    Document   : index
    Created on : 26.12.2015, 18:52:17
    Author     : Aleks
--%>

<%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Сервис статистики</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
    </head>
    <style>
        body {
            background: #FFF;
            font: 20px Arial;
        }

        .dropzone {
            width: 300px;
            height: 300px;
            border: 2px dashed #aaa;
            color: #aaa;
            line-height: 280px;
            text-align: center;
            position: absolute;
            left: 50%;
            margin-left: -150px;
            top: 50%;
            margin-top: -150px;
        }

        .dropzone.dragover {
            color: green;
            border: 2px dashed #000;
        }

        form {
            width: 250px;
            position: relative;
            margin: auto;
            /* border: 1px gray solid; */
            font-size: 10pt;
            /* font-family: 'Impact'; */ 
            top: 20px;
        }
        
        #uploads {
    width: 400px;
    height: 600px;
    position: absolute;
    top: 20px;
    left: 20px;
    border: 1px gray dashed;
    overflow-y: scroll;
    font-size: 10pt;
        }
    </style>
    <body>
        <script>
            $(document).ready(function() {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>

    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>JSP Page</title>
        </head>
        <body> 
          
            <div id="uploads">
                <ul>

                </ul>
            </div>
            <div class="dropzone" id="dropzone">Перетащите файлы сюда</div>
            <script>
                (function() {
                    var dropzone = document.getElementById("dropzone");

                    dropzone.ondrop = function(e) {
                        this.className = 'dropzone';
                        this.innerHTML = 'Перетащите файлы сюда';
                        e.preventDefault();
                        upload(e.dataTransfer.files);
                    };

                    var displayUploads = function(data) {
                        var uploads = document.getElementById("uploads"),
                                anchor,
                                x;

                       
                            
                            uploads.innerHTML = data;
                      
                        
                    };

                    var upload = function(files) {
                        var formData = new FormData(),
                                xhr = new XMLHttpRequest(),
                                x;

                        for (x = 0; x < files.length; x++) {
                            formData.append('file', files[x]);
                        }

                        xhr.onload = function() {
                            var data = this.responseText;
                            displayUploads(data);
                            
                        };

                        xhr.open('post', 'http://localhost:8080/XLSLoader/uploadMultipleFile');
                        xhr.send(formData);
                    };

                    dropzone.ondragover = function() {
                        this.className = 'dropzone dragover';
                        this.innerHTML = 'Отпустите мышку';
                        return false;
                    };

                    dropzone.ondragleave = function() {
                        this.className = 'dropzone';
                        this.innerHTML = 'Перетащите файлы сюда';
                        return false;
                    };

                }());
            </script>
            <form method="POST" action='<c:url value="/uploadMultipleFile"/>' enctype="multipart/form-data">
                <input type="hidden" id="_csrf_entrance" name="_csrf" value="${_csrf.token}"/>
                <input type="file" name="file"><br /> 		
                <input type="submit" value="Upload"> Press here to upload the file!
            </form>
        </body>
    </html>
