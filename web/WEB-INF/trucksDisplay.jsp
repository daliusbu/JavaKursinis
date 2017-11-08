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
                <a class="nav-link " href="/forWelcomeAdmin">Ataskaitos</a>
            </li>
            <li class="nav-item dropdown ">
                <a class="nav-link dropdown-toggle active" data-toggle="dropdown" href="#">Automobiliai
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
            <h4 style="margin: 20px;">Automobiliu sarasas</h4>
        </div>

    </div>

      <c:choose>
        <c:when test="${!(empty trucks)}">
            <table class="table table-striped table-sm">
                <thead>
                <tr>
                    <th>Pavadinimas</th>
                    <th>Valst. Nr.</th>
                    <th>Kuras laukiant</th>
                    <th>Kuras vaziuojant</th>
                    <th>Kuras kraunant</th>
                    <th>Redaguoti</th>
                </tr>
                </thead>
                <c:forEach items="${trucks}" var="truck">
                    <tr>
                        <td>${truck.brand}</td>
                        <td>${truck.license}</td>
                        <td>${truck.fuelStanding}</td>
                        <td>${truck.fuelDriving}</td>
                        <td>${truck.fuelLoading}</td>
                        <td>
                            <form action="/truckChange" method="get">
                                <button name="truckId" type="submit" value="${truck.id}">Redaguoti</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </c:when>
        <c:otherwise>
            <br>
            <h4>Sunkvezimius sarasas tuscias</h4>
        </c:otherwise>
    </c:choose>

    <div class="center">
        <a href="/forWelcomeAdmin">
            <button type="button" class="btn btn-success">Kita ataskaita</button>
        </a>
        <a href="/logout">
            <button type="button" class="btn btn-danger">Log out</button>
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
