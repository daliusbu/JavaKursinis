<%--
  Created by IntelliJ IDEA.
  User: dalius
  Date: 2017.10.19
  Time: 15:38
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">



    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
          crossorigin="anonymous">
    <!-- Bootstrap stylesheet -->
    <link rel="stylesheet" type="text/css"
          href="../clock/clockpicker-gh-pages/assets/css/bootstrap.min.css">
    <!-- ClockPicker Stylesheet -->
    <link rel="stylesheet" type="text/css"
          href="../clock/clockpicker-gh-pages/dist/bootstrap-clockpicker.css">

    <link rel="stylesheet" href="../css/main.css">

</head>

<body>

<header>
    <nav class="navbar navbar-light" style="background-color: #e3f2fd;">
        <!-- Navbar content -->

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
                <a class="nav-link" href="/forUserAdd">Pridėti vartotoją</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/logout">Atsijungti</a>
            </li>
        </ul>
        <span class="fr">Vartotojas: <b>${UserName}</b> (${UserRole})</span>
    </nav>
</header>

<div class="container-fluid pageBackgroundBrown">
    <div>
        <h3 class = "mainTitle">Pasirinkite ataskaitos duomenis</h3>
    </div>
    <form name = "dform" class="form-inline" action="/routesByDriverDate" method="POST">
        <div class="row terminal">
            <div class="bot_gap15 col-sm-12 col-md-6 col-lg-3">

                <div class="form-group">
                    <label>Vairuotojas</label>
                    <select class="custom-select" name="userId">
                        <option selected>Pasirinkite vairuotoja</option>
                        <c:forEach items="${drivers}" var="driver">
                            <option value="${driver.id}">
                                    ${driver.name}
                            </option>
                        </c:forEach>
                    </select>
                </div>
            </div>
        </div>

        <div class="row terminal">
            <div class="bot_gap15 col-sm-12 col-md-6 col-lg-3">
                <div class="form-group">
                    <label>Pradžios data</label>
                    <input type="date" class="form-control"
                           name="dateStart" placeholder="2017-01-01" required>
                </div>
            </div>
            <div class="bot_gap15 col-sm-12 col-md-6 col-lg-3">
                <div class="form-group">
                    <label>Pabaigos data</label>
                    <input type="date" class="form-control"
                           name="dateEnd" placeholder="2017-12-30" required>
                </div>
            </div>
        </div>
        <br>
        <div class="row terminal">
            <div class="col-sm-3"></div>
            <div class="col-sm-6">
                <button type="submit" class="btn btn-primary btn-large" id="btnSubmit">Gauti ataskaita
                </button>
            </div>
        </div>
    </form>
</div>

<footer>
    <h4 style="float: right">&copy 2017 BlaBlabla</h4>
</footer>

<%--ENTER naudojimas persokti per formos laukus vietoje Submit funkcijos--%>
<script type='text/javascript'>
    $(document).ready(function () {
        $('input').keydown(function (e) {
            if (e.keyCode == 13) {
                if ($(':input:eq(' + ($(':input').index(this) + 1) + ')').attr('type') == 'submit') {// check for submit button and submit form on enter press
                    return true;
                }
                $(':input:eq(' + ($(':input').index(this) + 1) + ')').focus();
                return false;
            }
        });
    });
</script>

<script>

    /*Current date in form credit:
    JavaScript Kit (www.javascriptkit.com)
    Over 200+ free scripts here!
    */

    var mydate=new Date()
    var theyear=mydate.getYear()
    if (theyear < 1000)
        theyear+=1900
    var theday=mydate.getDay()
    var themonth=mydate.getMonth()+1
    var themonthBefore=mydate.getMonth()
    if (themonth<10)
        themonth="0"+themonth
    if (themonthBefore<10)
        themonthBefore="0"+themonthBefore
    var theday=mydate.getDate()
    if (theday<10)
        theday="0"+theday

    var displayfirst=theyear
    var displaysecond=themonth
    var displaythird=theday
    var displaysecondBefore=themonthBefore

    document.dform.dateEnd.value=displayfirst+"-"+displaysecond+"-"+displaythird
    // document.dform.date.value=displayfirst+"-"+displaysecond+"-"+displaythird
    document.dform.dateStart.value=displayfirst+"-"+displaysecondBefore+"-"+displaythird
</script>


<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" crossorigin="anonymous"></script>
<script src="js/dateToForm.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
        crossorigin="anonymous"></script>
</body>

