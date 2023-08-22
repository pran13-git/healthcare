<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
  <head>
    <title>Hamburger Menu Example</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <style>
      body {
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
        /* background-image: linear-gradient(
            to bottom,
            rgba(245, 246, 252, 0.52),
            rgba(245, 4, 4, 0.73)
          ),
          url(ssn.jpg); */
        background-repeat: no-repeat;
        background-size: cover;
        background-position: center;
        font-family: Arial, sans-serif;
        position: relative;
        overflow:auto;
      }

      /* body::before{
        content: "";
        background-image: url(ssn.jpg);
        background-size: cover;
background-repeat: no-repeat;
        background-color: rgba(0,0,0,2.4);
        
      } */
      .hamburger-menu {
        display: inline-block;
        cursor: pointer;
        padding: 20px;
        position: absolute;
        z-index: 1;
        margin: 0px;
      }
      .hamburger-menu span {
        display: block;
        height: 3px;
        width: 40px;
        background-color: #000000;
        margin-bottom: 5px;
        margin-top: 8px;
        position: relative;
        transform-origin: center;
        transition: transform 0.3s ease-out, opacity 0.2s;
      }
      .hamburger-menu span:nth-child(2) {
        width: 40px;
        height: 3px;
      }
      .hamburger-menu span:nth-child(3) {
        width: 40px;
        height: 3px;
      }
      .hamburger-menu.open span:nth-child(1) {
        transform: translateY(10px) rotate(45deg);
      }
      .hamburger-menu.open span:nth-child(2) {
        opacity: 0;
      }
      .hamburger-menu.open span:nth-child(3) {
        transform: translateY(-10px) rotate(-45deg);
      }
      .menu {
        position: fixed;
        top: 0;
        left: -300px;
        width: 300px;
        height: 100%;
        background-color: #0a4d68;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.6);
        z-index: 0;
        transition: left 0.3s ease-out;
        margin-top: 0px;
      }
      .menu ul {
        list-style: none;
        padding: 0;
        margin-top: 100px;
        margin-left: 10px;
      }
      .menu li {
        padding: 10px;
        border-bottom: 1px solid #ffffff;
      }
      .menu li:hover {
        background-color: rgb(219, 127, 127);
      }
      .menu li:last-child {
        border-bottom: none;
      }
      .menu a {
        color: #ffffff;
        text-decoration: none;
      }
      .menu.show {
        left: 0;
      }
      .dashboard-container {
        max-width: 800px;
        margin: 0 auto;
        padding: 20px;
        background-color: #fff;
        box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
        border-radius: 4px;
      }

      /* Style the dashboard tabs */
      .dashboard-tabs {
        display: flex;
        flex-wrap: wrap;
        margin-bottom: 20px;
        justify-content: center;
      }

      .dashboard-tab {
        padding: 10px 20px;
        margin-right: 10px;
        background-color: #eee;
        border-radius: 4px;
        cursor: pointer;
      }

      .dashboard-tab.active {
        background-color: #007bff;
        color: #fff;
      }

      /* Style the dashboard content */
      .dashboard-content {
        padding: 20px;
        background-color: #fff;
        box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
        border-radius: 4px;
      }

      /* Style the form elements */
      .dashboard-form {
        display: flex;
        flex-direction: column;
        max-width: 400px;
        margin: 0 auto;
      }

      .dashboard-form label {
        margin-bottom: 10px;
        font-weight: bold;
      }

      .dashboard-form input[type="text"],
      .dashboard-form input[type="email"],
      .dashboard-form input[type="password"],
      .dashboard-form select,
      .dashboard-form textarea {
        padding: 10px;
        margin-bottom: 20px;
        border: none;
        border-radius: 4px;
        box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
      }

      .dashboard-form input[type="submit"] {
        padding: 10px;
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 4px;
        cursor: pointer;
      }

      .dashboard-form input[type="submit"]:hover {
        background-color: #0069d9;
      }

      /* Main content styling */
      main {
        max-width: 1200px;
        margin: 0 auto;
        padding: 20px 20px;
      }
      main h2 {
        font-size: 36px;
        margin: 0;
      }
      main p {
        font-size: 18px;
        margin: 20px 0;
        line-height: 1.5;
      }
      main a {
        background-color: #42b8dd;
        color: #fff;
        padding: 10px 20px;
        border-radius: 5px;
        text-decoration: none;
        font-size: 20px;
        display: inline-block;
        margin-top: 20px;
      }

      .container {
        width: 80%;
        margin: auto;
      }

      form {
        margin-left: 300px;
      }
      label {
        display: block;
        font-size: 20px;
        margin-bottom: 10px;
      }

      input[type="text"],
      input[type="email"],
      input[type="tel"] {
        width: 60%;
        padding: 10px;
        border-radius: 5px;
        border: 1px solid #ccc;
        font-size: 16px;
        margin-bottom: 20px;
        border-width: 1px;
        border-color: black;
      }

      textarea {
        width: 100%;
        padding: 10px;
        border-radius: 5px;
        border: 1px solid #ccc;
        font-size: 16px;
        margin-bottom: 20px;
      }

      button {
        margin-top: 10px;
        padding: 5px 10px;
        border-radius: 5px;
        border: none;
        color: white;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
      }
      .edit {
        background-color: blue;
        padding: 10px;
      }
      .save {
	  margin-top: 10px;
        padding: 5px 10px;
        border-radius: 5px;
        border: none;
        color: white;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
        background-color: green;
	  padding: 10px;
	  display:none;
      }

      .hidden{
        display: none;
      }
    </style>
    <script src="edit_details.js"></script>

  </head>
  <body>
    <div class="hamburger-menu" onclick="toggleMenu()">
      <span></span>
      <span></span>
      <span></span>
    </div>
    <div class="menu" id="menu">
      <ul>
        <!-- <li><a href="student_home.html">Home</a></li>
        <li><a href="http://localhost:8088/trial/pulldetails">My Profile</a></li> -->
        <li><a href="http://localhost:8080/doctor/View">View Appointments</a></li>
        <li><a href="#">Contact</a></li>
      </ul>
    </div>

    <div style="box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1)">
      <h1 style="text-align: center">SSN Student Healthcare</h1>
      <p style="text-align: center; padding-bottom: 10px">
        Your source for quality medical care.
      </p>
    </div>
      <main>
        <div class="container mt-5">
          <h1 class="text-center mb-5" style="text-align: center;font-size: 28px;padding:20px;margin-left: 300px;width: 300px;justify-content: center;">Student's Profile</h1>
          <form style="margin-left: 180px;" >
		<c:forEach items="${med_dets}" var="med_var">
    		
		
            <div class="row mb-3">
              <label for="name">Name:</label>
              <input
                type="text"
		    name="name"
                id="name"
                value=${med_var.name}
                disabled
              />
            </div>
            <div class="row mb-3">
              <label for="email">Email:</label>
              <input
                type="email"
		    name="email"
                id="email"
                value=${med_var.email}
                disabled
              />
            </div>
            <div class="row mb-3">
              <label for="phone">Phone:</label>
              <input
                type="tel"
		    name="phone"
                id="phone"
                value=${med_var.phone}
                disabled
              />
            </div>
            <div class="row mb-3">
              <label for="allergies">Allergies:</label>
              <input
                type="text"
	 	    name="allergies"
                id="allergies"
                value=${med_var.allergies}
                disabled
              />
            </div>
            <div class="row mb-3">
              <label for="medication">Ongoing Medication:</label>
              <input
                type="text"
		    name="med"
                id="medication"
                value=${med_var.med}
                disabled
              />
            </div>
		</c:forEach>
            <!-- <button type="button" class="edit" id="editBtn">Edit</button>
		<input type="submit" class="save" id="saveBtn"/> -->
  
          </form>
        </div>
      </main>

    <script>
     class med_det {
  constructor(name, email,phone,allergies,med) {
    this.name = name;
    this.email = email;
    this.phone = phone;
    this.allergies = allergies;
    this.med = med;
  }
}
      function toggleMenu() {
        document.getElementById("menu").classList.toggle("show");
        document.querySelector(".hamburger-menu").classList.toggle("open");
      }
	var editBtn =document.getElementById("editBtn");
	var saveBtn =document.getElementById("saveBtn");
      editBtn.addEventListener("click", () => {
  const inputToDisable = document.getElementById("email");
  inputToDisable.disabled = true;

  const inputs = document.querySelectorAll("input");
  inputs.forEach((input) => {
    if (input !== inputToDisable) {
      input.disabled = false;
    }
  });

        editBtn.style.display = "none";
        saveBtn.style.display = "block";
      });

	      

    </script>
  </body>
</html>
