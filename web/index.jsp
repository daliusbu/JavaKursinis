<%--
  Created by IntelliJ IDEA.
  User: dalius
  Date: 2017.10.17
  Time: 09:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Route Manager</title>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
          crossorigin="anonymous">
    <!-- Bootstrap stylesheet -->
    <link rel="stylesheet" type="text/css"
          href="clock/clockpicker-gh-pages/assets/css/bootstrap.min.css">
    <!-- ClockPicker Stylesheet -->
    <link rel="stylesheet" type="text/css"
          href="clock/clockpicker-gh-pages/dist/bootstrap-clockpicker.css">

    <link rel="stylesheet" href="css/main.css">

</head>
<body>
<header class="fullWidth">
    <img id="headingImg" src="img/ART-Tractor-Trailer-2.jpg" alt="Truck on road">
</header>
<div class="container-fluid pageBackground">



    <div class="row">
        <div class="col-sm-6 col-sm-offset-1">
            <h1 style="margin-bottom: 5px;">Prisijunkite prie TVS:</h1>
            <h3 style="color:red">
                <strong> ${message}</strong>
            </h3>
            <form id="myForm" action="/login" method="POST">
                <div class="form-group">
                    <label for="formGroupExampleInput">Vartotojo vardas</label>
                    <input type="text" class="form-control" name="username"
                           id="formGroupExampleInput">
                </div>
                <div class="form-group">
                    <label for="formGroupExampleInput2">Slaptazodis</label>
                    <input type="text" class="form-control" name="password"
                           id="formGroupExampleInput2">
                </div>
                <input type="submit" name="submit" value="Prisijungti">
            </form>
        </div>
    </div>

</div>


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

</body>
</html>

