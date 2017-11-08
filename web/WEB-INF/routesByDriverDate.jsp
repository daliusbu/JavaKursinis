<%--
  Created by IntelliJ IDEA.
  User: dalius
  Date: 2017.10.22
  Time: 16:04
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
          crossorigin="anonymous">
    <link rel="stylesheet" href="../css/main.css">
    <style>html {
        font-family: Verdana;
    }</style>


</head>

<body onLoad="init()">

<header>
    <nav class="navbar navbar-light" style="background-color: #e3f2fd;">
        <ul class="nav nav-tabs">
            <li class="nav-item">
                <a class="nav-link active" href="/forWelcomeAdmin">Ataskaitos</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">Automobiliai
                </a>
                <ul class="dropdown-menu">
                    <li><a href="/forTruckAdd">Naujas automobilis</a></li>
                    <li><a href="/trucksDisplay">Redaguoti automobilius</a></li>
                </ul>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/forUserAdd">Prideti vartotoja</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/logout">Atsijungti</a>
            </li>
        </ul>
        <span class="fr">Vartotojas: <b>${UserName}</b> (${UserRole})</span>
    </nav>
</header>

<div class="container-fluid pageBackgroundBrown">
    <div class="row desaturated">
        <div class="col-sm-6">
            <h4 style="margin: 20px;">Vairuotojas: <b>${routes[0].driverName}</b></h4>
        </div>
        <div class="col-sm-6">
            <h5 style="margin: 20px; text-align: right;">${dateStart} / ${dateEnd}</h5>
        </div>
    </div>

    <c:set var="totalDistance" value="${0}"/>
    <c:set var="totalFuel" value="${0}"/>
    <c:set var="fuelPer100" value="${0}"/>

    <c:choose>
        <c:when test="${!(empty routes)}">
            <table class="table table-striped table-sm">
                <thead>
                <tr>
                    <th>Auto</th>
                    <th>Data</th>
                    <th>Tikslas</th>
                    <th>Isvyko</th>
                    <th>Odo.prad.</th>
                    <th>Atvyko</th>
                    <th>Krovesi</th>
                    <th>Isvyko</th>
                    <th>Grizo</th>
                    <th>Odo.pab.</th>
                    <th>Dist. km</th>
                    <th>Kuras L</th>
                </tr>
                </thead>
                <c:forEach items="${routes}" var="route">
                    <tr>
                        <td>${route.tLicense}</td>
                        <td>${route.date}</td>
                        <td>${route.destination}</td>
                        <td>${route.departTime}</td>
                        <td>${route.departOdo}</td>
                        <td>${route.arriveTime}</td>
                        <td>${route.loadTime}</td>
                        <td>${route.leaveTime}</td>
                        <td>${route.returnTime}</td>
                        <td>${route.returnOdo}</td>
                        <td>${route.distance}</td>
                        <td>${route.fuelUsed}</td>
                        <c:set var="totalDistance" value="${totalDistance + route.distance}"/>
                        <c:set var="totalFuel" value="${totalFuel+ route.fuelUsed}"/>
                    </tr>
                </c:forEach>
                <tr class="table-dark">
                    <td class="rght" colspan="10">TOTAL:</td>
                    <td>${totalDistance}</td>
                    <td>${totalFuel}</td>
                </tr>
            </table>
            <c:set var="fuelPer100" value="${totalFuel / totalDistance * 100}"/>
            <c:set var="fp100"><fmt:formatNumber type="number" minFractionDigits="2"
                                                 maxFractionDigits="2"
                                                 value="${fuelPer100}"/></c:set>
            <h4>Vidutines kuro sanaudos: <span  class="redFont">${fp100} L/100km</span></h4>
        </c:when>
        <c:otherwise>
            <br>
            <h4>Vairuotojas nurodytame laiko intervale marsrutu neturejo</h4>
        </c:otherwise>
    </c:choose>

    <div class="center">
        <a href="/forWelcomeAdmin">
            <button type="button" class="btn btn-success">Nauja ataskaita</button>
        </a>
        <a href="/logout">
            <button type="button" class="btn btn-danger">Log out</button>
        </a>
    </div>


    <div align="center">
        <h2>Kuro sanaudu ir nuvaziuoto atstumo koreliacija</h2>

        <canvas id="canvas" height="400" width="650">
        </canvas>
        <br>
        <!--Legends for Dataplot -->
        <span style="color:#FF0066"> Kuro sanaudos </span>  
        <span style="color:#9933FF"> Nuvaziuotas atstumas</span>  
        <span style="color:#000"> Kuras / 100 km </span>
    </div>


</div>


<footer>
    <h4 style="float: right">&copy 2017 Bla-Blabla</h4>
</footer>

<script type="text/javascript">
    var canvas;
    var context;
    var Val_max;
    var Val_min;
    var sections;
    var xScale;
    var yScale;
    // Values for the Data Plot, they can also be obtained from a external file
    var Apple = [100, 102, 87, , 100, 123, 100, 90, 87, 91, 93, 88];
    var Samsung = [30, 50, 70, 80, 90, 100, 95, 91, 85, 92, 99, 130];
    var Nokia = [20, -10, -20, -25, -40, 5, 10, 28, 30, 43, 65, 80];

    function init() {
        // set these values for your data
        sections = 12;
        Val_max = 130;
        Val_min = -40;
        var stepSize = 10;
        var columnSize = 50;
        var rowSize = 50;
        var margin = 10;
        var xAxis = [" ", "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        //

        canvas = document.getElementById("canvas");
        context = canvas.getContext("2d");
        context.fillStyle = "#0099ff"
        context.font = "20 pt Verdana"

        yScale = (canvas.height - columnSize - margin) / (Val_max - Val_min);
        xScale = (canvas.width - rowSize) / sections;

        context.strokeStyle = "#009933"; // color of grid lines
        context.beginPath();
        // print Parameters on X axis, and grid lines on the graph
        for (i = 1; i <= sections; i++) {
            var x = i * xScale;
            context.fillText(xAxis[i], x, columnSize - margin);
            context.moveTo(x, columnSize);
            context.lineTo(x, canvas.height - margin);
        }
        // print row header and draw horizontal grid lines
        var count = 0;
        for (scale = Val_max; scale >= Val_min; scale = scale - stepSize) {
            var y = columnSize + (yScale * count * stepSize);
            context.fillText(scale, margin, y + margin);
            context.moveTo(rowSize, y)
            context.lineTo(canvas.width, y)
            count++;
        }
        context.stroke();

        context.translate(rowSize, canvas.height + Val_min * yScale);
        context.scale(1, -1 * yScale);

        // Color of each dataplot items

        context.strokeStyle = "#FF0066";
        plotData(Apple);
        context.strokeStyle = "#9933FF";
        plotData(Samsung);
        context.strokeStyle = "#000";
        plotData(Nokia);
    }

    function plotData(dataSet) {
        context.beginPath();
        context.moveTo(0, dataSet[0]);
        for (i = 1; i < sections; i++) {
            context.lineTo(i * xScale, dataSet[i]);
        }
        context.stroke();
    }
</script>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
        crossorigin="anonymous"></script>
</body>

</html>
