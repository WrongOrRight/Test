<%-- 
    Document   : playLottery
    Created on : 20.11.2015, 23:01:40
    Author     : Aleks
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>

        <meta charset="utf-8" />

        <meta name='HandheldFriendly' content='True' />
        <meta name='viewport' content='width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0' />

        <title>Lottery Game</title>

        <style>

            html, body { height: 100%; }

            body {
                background-color: #CCC;
                color: white;
                margin: 0px;
                padding: 0px;
                overflow: hidden;
                //transform:scale(0.5,0.5);
                background: #222222;
                background: -webkit-gradient(radial, 50% 80%, 500, 50% 80%, 59, from(#111111), to(#444444))
            }


            .wrapper {
                width:900px;
                height:600px;
                overflow:hidden;
                border:1px green solid;
            }
            #debug {
                color: #FFF;
                position: absolute;
                bottom: 0px;
                left: 0px;
                width: 100%;
                text-align: center;
                font-family: courier;
            }

            .box {
                width: 450px;
                height: 250px;
                overflow: hidden;
                background: white url("./resources/img/Tiket.jpg") center;
                background-size:100% 100%;
            }

            .insideBox {
                display: block;
                position: relative;
                top: -80px;
                left: 0px;
                font-family: "Lucida Grande", Geneva, Verdana, Arial, sans-serif;
                font-weight: bold;
                border-bottom: 10px solid black;
                letter-spacing: -0.1em;
                font-size: 320px;
                color: black;
                opacity: .4;
            }

        </style>

        <!-- =========================================================== -->		
        <!-- JAVASCRIPT SECTION ======================================== -->
        <!-- =========================================================== -->

        <!-- Paul Irish's cross-browser RequestAnimationFrame technique -->
        <script type="text/javascript" src="<c:url value="/resources/js/RequestAnimationFrame.js"/>"></script>

        <!-- Grant Skinner's Tween engine -->
        <script type="text/javascript" src="<c:url value="/resources/js/Tween.js"/>"></script>

        <!-- Robert Penner's easing equations -->
        <script type="text/javascript" src="<c:url value="/resources/js/Easing.js"/>"></script>

        <!-- boblemarin's Sprite3D utility class -->
        <script src="<c:url value="/resources/js/Sprite3D.js"/>" type="text/javascript"></script>

        <script type="text/javascript">

            var debug,
                    t = 0,
                    stage,
                    container,
                    lastTime,
                    targets,
                    numTargets = 25,
                    currentTarget = -1;

            function init() {
                debug = document.getElementById("debug");

                // create a centered 3D stage
                stage = Sprite3D.createCenteredContainer();

                container = stage.addChild(new Sprite3D().setRotateFirst(true));

                targets = [];
                var target, img;

                for (var i = 0; i < numTargets; i++)
                {
                    // create a sprite3D 
                    target = new Sprite3D()
                            .setClassName("box")
                            .setInnerHTML('<span class="insideBox">' + i + '</span>')
                            .setRegistrationPoint(225, 100, 0)
                            .setPosition(rnd(4000), rnd(4000), rnd(4000))
                            .setRotation(rnd(360), rnd(360), 0)
                            .setRotateFirst(false)
                            .update();
                    container.addChild(target);
                    targets.push(target);

                }

                //msg( numTargets + ' tweening png objects');


                // keep track of the time to tick the tween engine
                lastTime = new Date().getTime();

                document.addEventListener("touchstart", onTouchStart);

                moveAgain();

                animate();
            }

            function rnd(n) {
                return Math.random() * n - (n >> 1);
            }

            function onTouchStart(event) {
                // prevent user from scrolling the page
                event.preventDefault();
            }

            function moveAgain() {
                // choose next target
                currentTarget = ++currentTarget % numTargets;

                // then tween the container to the opposite position
                Tween.get(container, false).to({
                    x: -targets[currentTarget].x,
                    y: -targets[currentTarget].y,
                    z: -targets[currentTarget].z,
                    rotationX: -targets[currentTarget].rotationX,
                    rotationY: -targets[currentTarget].rotationY,
                    rotationZ: -targets[currentTarget].rotationZ
                }, 1200, Easing.Quadratic.EaseInOut).wait(3000).call(moveAgain);
            }

            function animate() {
                requestAnimationFrame(animate);
                update();
            }

            function update()
            {
                // manually compute the elapsed time since last screen refresh,
                // achieving time-based rather than frame-based animation 
                var newTime = new Date().getTime();
                Tween.tick(newTime - lastTime);
                lastTime = newTime;

                // update container's position
                container.update();

                stats.update();
            }

            function msg(t)
            {
                debug.innerHTML = t;
            }



        </script>
    </head>

    <style>
        :focus {
            outline:none;
        }
        .lotteryForm {
            position:fixed;
            left:0px;
            top:0px;
            border-radius:0px 0px 10px 0px;
            width:540px;
            height:70px;
            background: rgba(25,25,25,1);
            z-index:100000000;
        }


        #selector {
            width: 100px;
            padding: 15px 15px 15px 15px;
            margin-left: 10px;
            float: left;
            margin-top: 10px;
        }


        .button-1
        {
            float: left;
            width: 402px;
            height: 50px;
            margin-top: 10px;
            background: #901e1e;
            cursor: pointer;
            transition: 1s;
            border: none;
            color: white;
            font-size: 16pt;
            font-family: 'PT Sans Narrow';
        }


        .button-1:hover
        {
            background: white;
            transition: 1s;
            color: red;
        }

        .w2 {
            margin-left: 10px;
            width:405px;
        }


    </style>
    <body onload="init();">
        <form class="lotteryForm" action="" method="post">

            <select id="selector">
                <option var="1">1</option>
                <option var="2">2</option>
                <option var="5">5</option>
                <option var="10">10</option>
                <option var="20">20</option>
                <option var="50">50</option>
                <option var="100">100</option>
                <option var="1000">1000</option>
                <option var="5000">5000</option>
            </select>
            <input type="button" class="button-1 w2" value="ПОЛУЧИТЬ">
        </form>
        <div id="debug"></div>


    </body>
</html>
