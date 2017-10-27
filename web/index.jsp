<%--
  Created by IntelliJ IDEA.
  User: dalius
  Date: 2017.10.17
  Time: 09:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Route Manager</title>
    <link rel="stylesheet" href="">
  </head>
  <body>
  <h1> Login to Route manager</h1>
  <form action="/login" method="GET">
  <table>
    <tr>
      <td><b>User Name</b></td>
      <td><input type="text" name = "username"></td>
    </tr>
    <tr>
      <td><b>Password</b></td>
      <td><input type="text" name = "password"></td>
    </tr>
  </table>
    <input type="submit" name = "submit" value = "submit">

  </form>
  </body>
</html>
