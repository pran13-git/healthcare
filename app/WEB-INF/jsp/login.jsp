<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Healthcare Login</title>
    <link rel="stylesheet" href="login.css" />
  </head>
  <body>
    <div class="container">
      <form id="login-form" action="http://localhost:8080/doctor/loginverify" method="get">
        <h1>SSN Healthcare Login</h1>
        <label for="email">Email</label>
        <input type="email" id="email" name="email" required />
        <label for="password">Password</label>
        <input type="password" id="password" name="password" required />
        <label for="usertype">I'm a</label>
        <select id="usertype" name="usertype">
          <option value="student">Student</option>
          <option value="doctor">Doctor</option>
          <!-- <option value="pharmacist">Pharmacist</option> -->
        </select>
        <input type="submit" value="Login" />
	  <label for="valid" id="valid_mes" class="valid">Invalid Login</label>
      </form>
    </div>
<script>
var valid_mes =document.getElementById("valid_mes");
if (${f}==0)
{
valid_mes.style.color="red";
}
</script>
  </body>
</html>
