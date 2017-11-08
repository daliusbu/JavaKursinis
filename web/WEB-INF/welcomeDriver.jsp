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
    <meta http-equiv='Content-Type' content='text/html'/>
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
</heading>

<div class="container-fluid pageBackground">
    <div class="row">
        <div class="col-sm-1"></div>

        <div class="col-sm-8">
            <br>
            <h3>Pasirinkite automobilį</h3>
            <hr>
            <form class="form-inline" action="/truckCheck" method="POST">
                <div class="form-group">
                    <select class="custom-select" name="truckLicense" required>
                        <option selected>Pasirinkite maršruto automobili</option>
                        <c:forEach items="${trucks}" var="truck">
                            <option value="${truck.license}">
                                    ${truck.brand}, ${truck.license}
                            </option>
                        </c:forEach>
                    </select>
                </div>
                <input type="submit" class="btn btn-primary" value="Pildyti maršutą"
                       style="margin-left:20px;">
            </form>
        </div>
    </div>
</div>
<footer>
    <h4 style="float: right">&copy 2017 BlaBlabla</h4>

</footer>

<%--ENTER naudojimas persokti per formos laukus vietoje Submit funkcijos--%>
<script type='text/javascript'>
    $(document).ready(function () {
        $('#myForm input').keydown(function (e) {
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

    document.form.dateEnd.value=displayfirst+"-"+displaysecond+"-"+displaythird
    // document.dform.date.value=displayfirst+"-"+displaysecond+"-"+displaythird
    document.form.dateStart.value=displayfirst+"-"+displaysecondBefore+"-"+displaythird
</script>


<%-- CIA BUS JUSU PUSLAPIO VISAS KODAS--%>
<%--js bibliotekos turi buti failo apacioje--%>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
        crossorigin="anonymous"></script>
</body>

