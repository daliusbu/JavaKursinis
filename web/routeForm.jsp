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
    <link rel="stylesheet" type="text/css" href="css/main.css">
</head>


<body>

<p>Belekoks testavimo tekstas</p>

<div class="container-fluid">

    <header>
        <h3>Truck ${tName}</h3>
        <h3>License number ${tLicense}</h3>
    </header>

    <article>

        <div class="container-fluid">
            <div class="row">
                <div class="row no-gutters">
                    <div class="col-12">
                        <h6>Marsruto duomenys</h6>
                    </div>

                    <div class="col-12" style="background-color:pink">

                        <form class="form-inline" action="/routeInput" method="POST">

                            <div class="row">
                                <div class="col-sm-12 col-md-6 col-lg-3" >
                                    <div class="form-group">
                                        <label style="margin:10px" for="formGroupExampleInput">Example label</label>
                                        <input type="text" class="form-control"
                                               id="formGroupExampleInput"
                                               placeholder="Example input">
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-6 col-lg-3">
                                    <div class="form-group">
                                        <label for="formGroupExampleInput2">Another
                                            label</label>
                                        <input type="text" class="form-control"
                                               id="formGroupExampleInput2"
                                               placeholder="Another input">
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-6 col-lg-3">
                                    <div class="form-group">
                                        <label for="formGroupExampleInput2">Another
                                            label</label>
                                        <input type="text" class="form-control"

                                               placeholder="Another input">
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-6 col-lg-3">
                                    <div class="form-group">
                                        <label for="formGroupExampleInput2">Another
                                            label</label>
                                        <input type="text" class="form-control"

                                               placeholder="Another input">
                                    </div>
                                </div>

                            </div>
                            <label>Data</label>
                            <input type="date" class="form-control mb-2 mr-sm-2 mb-sm-0"
                                   name="date"
                                   placeholder="2017-10-10">
                            <label>Driver</label>
                            <input type="text" class="form-control mb-2 mr-sm-2 mb-sm-0"
                                   name="driver"
                                   id="inlineFormInput" placeholder="Driver">
                            <label>Destination</label>
                            <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                                <input type="text" name="destination" class="form-control"
                                       id="inlineFormInputGroup"
                                       placeholder="Destination">
                            </div>

                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </article>
</div>


<%-- CIA BUS JUSU PUSLAPIO VISAS KODAS--%>
<%--js bibliotekos turi buti failo apacioje--%>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
        crossorigin="anonymous"></script>
</body>
</html>
