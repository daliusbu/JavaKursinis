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
    <!-- Bootstrap stylesheet -->
    <link rel="stylesheet" type="text/css"
          href="../clock/clockpicker-gh-pages/assets/css/bootstrap.min.css">
    <!-- ClockPicker Stylesheet -->
    <link rel="stylesheet" type="text/css"
          href="../clock/clockpicker-gh-pages/dist/bootstrap-clockpicker.css">
    <link rel="stylesheet" type="text/css" href="../css/main.css">
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
    <section>
        <h3 class="mainTitle">Kelionės duomenų įvedimas</h3>

        <form name = "dform"  class="form-inline" action="/routeInput" method="POST">
            <div class="row rowBlue1">
                <input type="hidden" class="form-control"
                       name="userId" value="${UserId}">
                <h4 class="col-sm-12">Pradiniai duomenys</h4>
                <div class="bot_gap15 col-sm-12 col-md-6 col-lg-4">
                    <div class="form-group">
                        <label>Vairuotojas</label>
                        <input type="text" class="form-control"
                               name="userName" value="${UserName}" readonly>
                    </div>
                </div>
                <div class="bot_gap15 col-sm-12 col-md-6 col-lg-4">
                    <div class="form-group">
                        <label>Automobilis</label>
                        <input type="text" class="form-control"
                               name="tName" value="${tName}" readonly>
                    </div>
                </div>
                <div class="bot_gap15 col-sm-12 col-md-6 col-lg-4">
                    <div class="form-group">
                        <label>Reg. Nr.</label>
                        <input type="text" class="form-control"
                               name="tLicense" value="${tLicense}" readonly>
                    </div>
                </div>
            </div>

            <div class="row rowGreen1">
                <h4 class="col-sm-12">Isvykimas</h4>

                <div class="bot_gap15 col-sm-12 col-md-6 col-lg-3">
                    <label class="lft">Isvykimo laikas</label>
                    <div class="input-group clockpicker" data-placement="right" data-align="top"
                         data-autoclose="true" style="width:100px;">
                        <input type="text" class="form-control " placeholder="09:32"
                               name="departTime" required>
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-time"></span>
                            </span>
                    </div>
                </div>
                <div class="bot_gap15 col-sm-12 col-md-6 col-lg-3">
                    <div class="form-group">
                        <label>Odometro parodymai</label>
                        <input type="text" class="form-control" name="departOdo"
                               placeholder="123456" required>
                    </div>
                </div>
                <div class="bot_gap15 col-sm-12 col-md-6 col-lg-3">
                    <div class="form-group">
                        <label>Paskirties objektas</label>
                        <input type="text" class="form-control" name="destination"
                               placeholder="Viciunai, Kaunas" required>
                    </div>
                </div>
                <div class="bot_gap15 col-sm-12 col-md-6 col-lg-3">
                    <div class="form-group">
                        <label>Keliones data</label>
                        <input type="date" class="form-control"
                               name="date" required>
                    </div>
                </div>
            </div>

            <div class="row rowBlue1">
                <h4 class="col-sm-12">Paskirties objektas</h4>
                <div class="bot_gap15 col-sm-12 col-md-4 col-lg-3">
                    <label class="lft">Atvykimo laikas</label>
                    <div class="input-group clockpicker" data-placement="right" data-align="top"
                         data-autoclose="true" style="width:100px;">
                        <input type="text" class="form-control " placeholder="09:32"
                               name="arriveTime" required>
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-time"></span>
                            </span>
                    </div>
                </div>
                <div class="bot_gap15 col-sm-12 col-md-4 col-lg-3">
                    <label class="lft">Krovimo trukme</label>
                    <div class="input-group clockpicker" data-placement="right" data-align="top"
                         data-autoclose="true" style="width:100px;">
                        <input type="text" class="form-control " placeholder="09:32"
                               name="loadTime" required>
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-time"></span>
                            </span>
                    </div>
                </div>
                <div class="bot_gap15 col-sm-12 col-md-4 col-lg-3">
                    <label class="lft">Isvykimo laikas</label>
                    <div class="input-group clockpicker" data-placement="right"
                         data-align="top"
                         data-autoclose="true" style="width:100px;">
                        <input type="text" class="form-control " placeholder="09:32"
                               name="leaveTime" required>
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-time"></span>
                            </span>
                    </div>
                </div>
            </div>

            <div class="row rowGreen1">
                <h4 class="col-sm-12">Grizimas</h4>
                <div class="bot_gap15 col-sm-12 col-md-6 col-lg-3">
                    <label class="lft">Grizimo laikas</label>
                    <div class="input-group clockpicker" data-placement="right"
                         data-align="top"
                         data-autoclose="true" style="width:100px;">
                        <input type="text" class="form-control " placeholder="09:32"
                               name="returnTime" required>
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-time"></span>
                            </span>
                    </div>
                </div>
                <div class="bot_gap15 col-sm-12 col-md-6 col-lg-3">
                    <div class="form-group">
                        <label>Odometro parodymai</label>
                        <input type="text" class="form-control" name="returnOdo"
                               placeholder="234567" required>
                    </div>
                </div>
            </div>
            <br>
            <div class="row rowGreen1">
                <div class="col-sm-6 col-sm-offset-3">
                    <button type="submit" class="btn btn-primary btn-large" id="btnSubmit">Siusti
                        duomenis
                    </button>
                </div>
            </div>
        </form>
    </section>
</div>

<footer>
    <h4 style="float: right">&copy 2017 BlaBlabla</h4>

</footer>

<!-- jQuery and Bootstrap scripts -->
<script type="text/javascript" src="../clock/clockpicker-gh-pages/assets/js/jquery.min.js"></script>
<script type="text/javascript" src="../clock/clockpicker-gh-pages/assets/js/bootstrap.min.js"></script>

<!-- ClockPicker script -->
<script type="text/javascript"
        src="../clock/clockpicker-gh-pages/dist/bootstrap-clockpicker.min.js"></script>

<script type="text/javascript">
    $('.clockpicker').clockpicker()
        .find('input').change(function () {
        // TODO: time changed
        console.log(this.value);
    });
    $('#demo-input').clockpicker({
        autoclose: true
    });

    if (something) {
        // Manual operations (after clockpicker is initialized).
        $('#demo-input').clockpicker('show') // Or hide, remove ...
            .clockpicker('toggleView', 'minutes');
    }
</script>


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

document.dform.date.value=displayfirst+"-"+displaysecond+"-"+displaythird
</script>

<%-- CIA BUS JUSU PUSLAPIO VISAS KODAS--%>
<%--js bibliotekos turi buti failo apacioje--%>


<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
        crossorigin="anonymous"></script>
<script src="js/dateToForm.js"></script>
</body>
</html>
