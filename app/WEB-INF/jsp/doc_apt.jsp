<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
  <head>
    <title>Doctor home page</title>
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
        padding: 50px 20px;
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

      table {
        border-collapse: collapse;
        margin: auto;
        width: 80%;
        background-color: white;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
      }

      th,
      td {
        text-align: center;
        padding: 12px;
        border: 1px solid #ddd;
      }

      th {
        background-color: #333;
        color: white;
        text-align: center;
      }

      td a{
        background-color: rgb(235, 80, 80);
      }

      h3{
        margin-left:6%;
      }
      /* body {
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
        background-repeat: no-repeat;
        background-size: cover;
        background-position: center;
        font-family: Arial, sans-serif;
        position: relative;
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
        border-radius: 5px;
        font-size: 15px;
        display: inline-block;
        width: 90px;
        text-align: center;
        padding: 5px;
      }

      .container {
        width: 80%;
        margin: auto;
      }

      form {
        margin-left: 0px;
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

      input[type="submit"] {
        background-color: #4caf50;
        color: #fff;
        cursor: pointer;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        font-size: 18px;
        transition: background-color 0.3s ease;
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
        background-color: green;
        display: none;
      }

      .hidden {
        display: none;
      }

      table {
        border-collapse: collapse;
        margin: auto;
        width: 80%;
        background-color: white;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
      }

      th,
      td {
        text-align: center;
        padding: 12px;
        border: 1px solid #ddd;
      }

      th {
        background-color: #333;
        color: white;
        text-align: center;
      }

      td a{
        background-color: rgb(235, 80, 80);
      }

      .student a{
        background-color: transparent;
        color: #005ff8;
        text-decoration: none;
        font-weight: 900;

      }


      tr:nth-child(even) {
        background-color: #f2f2f2;
        text-align: center;
      }

      .days {
        margin-left: 200px;
        width: 1000px;
        justify-items: center;
        display: flex;
        gap: 15px;
      }

      .day {
        width: 180px;
        height: 330px;
        background-color: #efeff6;
        padding: 40px;
        float: left;
        margin-right: 7px;
        margin-bottom: 5px;
        border-radius: 10px;
      }

      /*radio buttons styling*/

      .days label {
        flex: 1 1 auto;
        cursor: pointer;
      }

      .days span {
        background-color: #2ca893;
        padding: 10px;
        display: flex;
        align-content: center;
        justify-content: center;
        color: white;
        border-radius: 10px;
      }

      .days input {
        display: none;
      }

      .days input:checked + span {
        background-color: rgb(63, 63, 225);
        color: white;
      }

      .datelabel {
        margin-bottom: 15px;
      }

      .timeslot {
        background-color: #00c09d;
        width: auto;
        height: 20px;
        color: white;
        padding: 7px;
        margin-top: 5px;
        font-size: 14px;
        border-radius: 3px;
        vertical-align: center;
        text-align: center;
      }

      .timeslot:hover {
        background-color: #2ca893;
        cursor: pointer;
      }

      /*cancel button*/
      .cancel-button {
        display: none;
        position: absolute;
        top: 0;
        left: 100px;
        background-color: red;
        color: white;
        padding: 5px;
        border-radius: 50%;
        cursor: pointer;
        scale: 2;
      }

      .hoverable:hover .cancel-button {
        display: inline-block;
      }

      .hoverable {
        position: relative;
      } */
    </style>
  </head>

  <body>
    <div class="hamburger-menu" onclick="toggleMenu()">
      <span></span>
      <span></span>
      <span></span>
    </div>
    <div class="menu" id="menu">
      <ul>
        <li><a href="#">Home</a></li>
        <li><a href="#">Contact</a></li>
        <li><a href="login.html" onclick="logout()">Logout</a></li>
      </ul>
    </div>

    <div style="box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1)">
      <h1 style="text-align: center">SSN Student Healthcare</h1>
      <p style="text-align: center; padding-bottom: 10px">
        Your source for quality medical care.
      </p>
    </div>
    <main style="padding-left:10%">
      <h2 >Welcome Dr. Sachin!</h2>
      <h3 style="padding: 20px; margin-left:0;">Upcoming Appointments</h3>
      <table style="margin-top: 20px">
        <thead>
          <tr>
            <th>Date</th>
            <th>Time</th>
            <th>Patient Name</th>
            <th>Cancel</th>
            <th>Profile</th>
          </tr>
        </thead>
        <tbody>
          
          <c:forEach items="${data}" var="Apptdata">
          <tr>      
              <td>${Apptdata.getAdate()}</td>
              <td>${Apptdata.getAtime()}</td>
              <td>${Apptdata.getSname()}</td>
              <td><input type="checkbox" name="checkbox" value="${Apptdata.getAid()}" />&nbsp;</td>
              <!-- <td><a href="#">Cancel </a></td> -->
              <td>
                <form action="docPulldetails" method="get">
                  <input type="hidden" name="email_stud" id="checkedDet" value=${Apptdata.getMail()}>
                  <input type="submit" value="View Profile" id="profileBtn">
                  
                </form>
              </td>
          </tr>
		      </c:forEach>
        </tbody>
        
      </table>
      <!-- <input type="hidden" name="checkedValues" value="${checkedValues}" /> -->
      <form id="form1"> 
        <input style="margin-top:5%; margin-left:45%; display:none" type="submit" value="Submit" id="submitBtn">
        
      </form>

      <form id="myForm" action="changeToggle" method="get">
        <input type="hidden" name="checkedValues" id="checkedValues">
        <!-- other form elements here -->
        <input style="margin-top:5%; margin-left:42%; display:none" type="submit" value="Confirm changes" id="confirmBtn">
      </form>
      <!-- <form action="changeToggle" method="get">
        <input style="margin-top:5%; margin-left:42%; display:none" type="submit" value="Confirm changes" id="confirmBtn">
        <input type="hidden" name="checkedValues" value="${checkedValuesStr}" />
      </form> -->
      <br />
      <br />
    </main>

    <script>
      function toggleMenu() {
        document.getElementById("menu").classList.toggle("show");
        document.querySelector(".hamburger-menu").classList.toggle("open");
      }
      const checkboxes = document.querySelectorAll('input[type="checkbox"]');
      const checkedValues = [];

      const submitBtn = document.getElementById('submitBtn');

      checkboxes.forEach((checkbox) => {
        checkbox.addEventListener('change', () => {
          if(document.querySelector('input[name="checkbox"]:checked')){
            submitBtn.style.display ="block";
          }
        });
      });

      

      const form = document.getElementById('form1');

      form.addEventListener("submit", function(event) {
            event.preventDefault();

            checkboxes.forEach(function(checkbox) {
              if (checkbox.checked) {
                checkedValues.push(checkbox.value);
              }
            });
            console.log(checkedValues); // or do something else with the values

            var checkedValuesStr = checkedValues.join(",");

            console.log(checkedValuesStr);
            document.getElementById("checkedValues").value = checkedValuesStr; // set the value of the hidden input element

            confirmBtn.style.display ="block";
          });


          function func(val)
          {
            document.cookie="mail="+val;
          }
          
          // document.getElementById("myForm").addEventListener("submit",function(event){
          //   event.preventDefault();
          // }) // submit the form

      //       var xhr = new XMLHttpRequest();
            
      //       xhr.open("GET", "http:/localhost:8080/doctor/deleteApt");
      //       xhr.setRequestHeader("Content-Type", "http:/localhost:8080/doctor/deleteApt");
      //       xhr.onload = function() {
      //           if (xhr.status === 200) {
      //               alert(xhr.responseText);
      //           }
      //           else {
      //               alert("Error: " + xhr.statusText);
      //           }
      //       };
      //       xhr.send(JSON.stringify(checkedValues));
      //   });
      
     
        function logout() {
        // Set cookie's expiration date to a past date
        console.log("hi");
        document.cookie = "email=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/doctor;";

        // Redirect to login page
        window.location.replace("login.html");
      }


  
    </script>
  </body>
</html>
