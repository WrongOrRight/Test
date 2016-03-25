<%-- 
    Document   : error
    Created on : 10.11.2015, 21:59:26
    Author     : Aleks
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href='https://fonts.googleapis.com/css?family=PT+Sans+Narrow&subset=latin,cyrillic' rel='stylesheet' type='text/css'>
    </head>
    <style>
        body {
            background: rgba(25,25,25,1);
            font-family: 'PT Sans Narrow';
        }
        .center {
            width: 1000px;
            height: 600px;
            position: relative;
            margin: 0 auto;
            top: 50px;       
        }

        .scene {

            width: 405px;
            height: 250px;
            margin-left: 10px;
            overflow: hidden;
            position: absolute;
            margin-left: 0px;
        }
        /*----------------------*/
        .eagle
        {
            width: 100px;
            height: 100px;
            margin-top: 30px;
            margin-left: 15px;
            position: relative;
            z-index: 2;
            -webkit-animation: eagle 30s infinite;
        }

        @-webkit-keyframes eagle{
            0%,100% {
                transform:translate(0px,0px);
            }
            25% {
                transform:translate(200px,30px);
            }
            50% {
                transform:translate(10px,130px);
            }
            75% {
                transform:translate(310px,20px);
            }
        }


        @-webkit-keyframes right{
            0%,100% {
                transform:rotate(0deg);
            }

            50% {
                transform:rotate(60deg);
            }

        }

        @-webkit-keyframes left{
            0%,100% {
                transform:rotate(0deg);
            }

            50% {
                transform:rotate(-60deg);
            }

        }
        .eagle-body 
        {
            width: 50px;
            height: 75px;
            background: url('../resources/img/body.png') no-repeat center;
            position: absolute;
            background-size: cover;
            z-index: 2;
        }

        .eagle-left 
        {
            width: 50px;
            height: 50px;
            background: url('../resources/img/left.png') no-repeat center;
            position: absolute;
            background-size: cover;
            left: -25px;
            z-index: 1;
            top: 5px;
            transform: rotateZ(-96deg);
            -webkit-transform-origin: 70% 60%;
            -moz-transform-origin: 70% 60%;
            -ms-transform-origin: 70% 60%;
            -o-transform-origin: 70% 60%;
            transform-origin: 70% 60%;
            -webkit-animation: left 3s infinite;
        }

        .eagle-right 
        {
            width: 50px;
            height: 50px;
            background: url('../resources/img/right.png') no-repeat center;
            position: absolute;
            background-size: cover;
            left: 25px;
            top: 5px;
            z-index: 1;
            transform: rotateZ(96deg);
            -webkit-transform-origin: 30% 60%;
            -moz-transform-origin: 30% 60%;
            -ms-transform-origin: 30% 60%;
            -o-transform-origin: 30% 60%;
            transform-origin: 30% 60%;
            -webkit-animation: right 3s infinite;
        }

        .error-num {
            position:absolute;
            width:400px;
            height:400px;
            font-size: 200pt;
            color:white;
        }
        .error-text {
            width: 450px;
            height: 650px;
            overflow-y: scroll;
            overflow-x: hidden;
            padding: 15px;
            position: absolute;
            margin-left: 500px;
            /* border: 1px solid white; */
            border-top: 5px dashed white;
            color:white;
            font-size:10pt;
        }

        .error-text::-webkit-scrollbar {
            width: 10px;
            height:10px;
        }

        .error-text::-webkit-scrollbar-track {
            border-radius: 0px;
        }

        .error-text::-webkit-scrollbar-thumb {
            border-radius: 0px;
            background-color:RGB(145,31,31);
        }

        .error-text::-webkit-scrollbar-thumb:hover {
            background-color:#9D212B;
        }
        
        .error-text p {
            width:410px;
            padding:10px;
           
        }

    </style>
    <body>
        <div class="center">
            <div class="scene">
                <div class="eagle">
                    <div class="eagle-body"></div>
                    <div class="eagle-left"></div>
                    <div class="eagle-right"></div>
                </div>
            </div>
            <div class="error-num">
                <p>${errorNum}</p>
            </div>
            <div class="error-text">
                <p>
${message}
                </p>
            </div>
        </div>
    </body>
</html>
