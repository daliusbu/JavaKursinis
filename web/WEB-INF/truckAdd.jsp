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
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>
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
<header>
    <nav class="navbar navbar-light" style="background-color: #e3f2fd;">
        <ul class="nav nav-tabs">
            <li class="nav-item">
                <a class="nav-link " href="/forWelcomeAdmin">Ataskaitos</a>
            </li>
            <li class="nav-item dropdown active">
                <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">Automobiliai
                </a>
                <ul class="dropdown-menu">
                    <li><a href="/forTruckAdd">Naujas automobilis</a></li>
                    <li><a href="/trucksDisplay">Redaguoti automobilius</a></li>

                </ul>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/forUserAdd">Pridėti vartotoja</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/logout">Atsijungti</a>
            </li>
        </ul>
        <span class="fr">Vartotojas: <b>${UserName}</b> (${UserRole})</span>
    </nav>
</header>

<div class="container-fluid pageBackgroundBrown">
    <section>
        <h3 class="mainTitle">Naujo automobilio duomenų įvedimas</h3>

        <div id="alertSuccess" style="display: none"
             class="alert alert-success alert-dismissable fade in">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <strong>${message}</strong>
        </div>

        <form class="form-inline" action="/truckAdd" method="POST">

            <div class="row terminal">
                <h4 class="col-sm-12">Duomenys</h4>
                <div class="bot_gap15 col-sm-12 col-md-6 col-lg-3">
                    <div class="form-group">
                        <label>Pavadinimas (modelis)</label>
                        <input type="text" class="form-control" name="brand"
                               placeholder="Mercedes 123" required>
                    </div>
                </div>
                <div class="bot_gap15 col-sm-12 col-md-6 col-lg-3">
                    <div class="form-group">
                        <label>Valstybinis numeris</label>
                        <input type="text" class="form-control" name="license"
                               placeholder="ABC 123" required>
                    </div>
                </div>

            </div>

            <div class="row terminal">
                <h4 class="col-sm-12">Kuro sąnaudos</h4>

                <div class="bot_gap15 col-sm-12 col-md-6 col-lg-3">
                    <div class="form-group">
                        <label>Sąnaudos vaziuojant (L / h)</label>
                        <input type="text" class="form-control" name="fuelDriving"
                               placeholder="20.75" required>
                    </div>
                </div>
                <div class="bot_gap15 col-sm-12 col-md-6 col-lg-3">
                    <div class="form-group">
                        <label>Sąnaudos kraunant (L / h)</label>
                        <input type="text" class="form-control" name="fuelLoading"
                               placeholder="12.25" required>
                    </div>
                </div>
                <div class="bot_gap15 col-sm-12 col-md-6 col-lg-3">
                    <div class="form-group">
                        <label>Sąnaudos laukiant (L / h)</label>
                        <input type="text" class="form-control" name="fuelStanding"
                               placeholder="5.00" required>
                    </div>
                </div>
            </div>
            <div class="row terminal">
                <div class="col-sm-3"></div>
                <div class="col-sm-6">
                    <button type="submit" class="btn btn-primary btn-large" id="btnSubmit">Siųsti
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
<script type="text/javascript"
        src="../clock/clockpicker-gh-pages/assets/js/bootstrap.min.js"></script>

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
    var success = '${message}';
    if (success) {
        document.getElementById('alertSuccess').style.display = 'block';
    }
</script>

<%-- CIA BUS JUSU PUSLAPIO VISAS KODAS--%>
<%--js bibliotekos turi buti failo apacioje--%>


<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
        crossorigin="anonymous"></script>
</body>
</html>
