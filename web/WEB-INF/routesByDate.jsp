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
</head>

<body>
<header>
    <nav class="navbar navbar-light" style="background-color: #e3f2fd;">
        <ul class="nav nav-tabs">
            <li class="nav-item">
                <a class="nav-link active" href="/forWelcomeDriver">Pildyti marsruta</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/forDriverSelectRoutes">Mano marsrutai</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/logout">Logout</a>
            </li>
        </ul>
        <span class="fr">Vartotojas: <b>${UserName}</b> (${UserRole})</span>
    </nav>
</header>

<div class="container-fluid pageBackground">
    <div class="row desaturated">
        <div class="col-sm-6">
            <h4 style="margin: 20px;">Vairuotojas: <b>${routes[0].driverName}</b></h4>
        </div>
        <div class="col-sm-6">
            <h5 style="margin: 20px; text-align: right;">Nuo ${dateStart} iki ${dateEnd}</h5>
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
            <h5 class="redFont rght">Vidutines kuro sanaudos 100 km: ${fp100}</h5>
        </c:when>
        <c:otherwise>
            <br>
            <h4>Vairuotojas nurodytame laiko intervale marsrutu neturejo</h4>
        </c:otherwise>
    </c:choose>

    <div class="center">
        <a href="/forDriverSelectRoutes">
            <button type="button" class="btn btn-primary">Kita ataskaita</button>
        </a>
        <a href="/forWelcomeDriver">
            <button type="button" class="btn btn-default">Pildyti marsruta</button>
        </a>

    </div>
</div>

<footer>
    <h4 style="float: right">&copy 2017 Bla-Blabla</h4>
</footer>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
        crossorigin="anonymous"></script>
</body>

</html>
