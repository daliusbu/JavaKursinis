<%--
  Created by IntelliJ IDEA.
  User: dalius
  Date: 2017.10.22
  Time: 16:04
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
          crossorigin="anonymous">
    <link rel="stylesheet" href="../css/main.css">
</head>
<body>

<heading>
    <nav class="navbar navbar-light" style="background-color: #e3f2fd;">
        <ul class="nav nav-tabs">
            <li class="nav-item">
                <a class="nav-link " href="/forWelcomeDriver">Pildyti marsruta</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="/forDriverSelectRoutes">Mano marsrutai</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/logout">Logout</a>
            </li>
        </ul>
        <span class="fr">Vartotojas: <b>${UserName}</b> (${UserRole})</span>
    </nav>
</heading>

<div class="container-fluid pageBackground">

    <c:choose>
        <c:when test="${updateResult}">
            <h4 class="redFont">Duomenys irasyti sekmingai</h4>
        </c:when>
        <c:otherwise>
            <h1>Duomenu irasymo klaida - bandykite kita karta</h1>
        </c:otherwise>
    </c:choose>

    <table class="table table-bordered">
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
        </tr>
        </thead>
        <tr>
            <td>${routeObject.tLicense}</td>
            <td>${routeObject.date}</td>
            <td>${routeObject.destination}</td>
            <td>${routeObject.departTime}</td>
            <td>${routeObject.departOdo}</td>
            <td>${routeObject.arriveTime}</td>
            <td>${routeObject.loadTime}</td>
            <td>${routeObject.leaveTime}</td>
            <td>${routeObject.returnTime}</td>
            <td>${routeObject.returnOdo}</td>
        </tr>
    </table>

    <a href="/forRouteAdd">Gristi i marsruto pildymo puslapi</a>
</div>

<footer>
    <h4 style="float: right">&copy 2017 Bla-Blabla</h4>
</footer>


<%--Scripts--%>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
        crossorigin="anonymous"></script>
</body>
</html>
