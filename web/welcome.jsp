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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" crossorigin="anonymous">

</head>
<body>

<h1>Welcome ${name}</h1>
<h1>Welcome test</h1>

<h3>Pasirinkite automobili duomenu suvedimui</h3>

<form name="truckSelection" action="/truckInput" method="POST">
    <div class="form-group">
        <label for="formGroupExampleInput">Automobilio pavadinimas</label>
        <input type="text" name="tName" class="form-control" id="formGroupExampleInput" placeholder="Example input">
    </div>
    <div class="form-group">
        <label for="formGroupExampleInput2">Registracijos Nr</label>
        <input type="text" name="tLicense" class="form-control" id="formGroupExampleInput2" placeholder="Another input">
    </div>
    <button type="submit" class="btn btn-primary">Pradeti pildyti</button>

</form>

<%-- CIA BUS JUSU PUSLAPIO VISAS KODAS--%>
<%--js bibliotekos turi buti failo apacioje--%>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"  crossorigin="anonymous"></script>
</body>

