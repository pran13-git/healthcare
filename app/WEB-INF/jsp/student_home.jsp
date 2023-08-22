
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
  <head>
    <title>Student Home</title>
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
    </style>
  </head>
  <body >
    <div class="hamburger-menu" onclick="toggleMenu()">
      <span></span>
      <span></span>
      <span></span>
    </div>
    <div class="menu" id="menu">
      <ul>
        <li><a href="http://localhost:8080/doctor/getAppt">Home</a></li>
        <li><a href="http://localhost:8080/doctor/pulldetails">My Profile</a></li>
        <li><a href="selappt">Book Appointment</a></li>
        <li><a href="upload_pre.html">Upload prescription</a></li>
        <li><a href="login.html" onclick="logout()">Logout</a></li>
      </ul>
    </div>

    <div style="box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1)">
      <h1 style="text-align: center">SSN Student Healthcare</h1>
      <p style="text-align: center; padding-bottom: 10px">
        Your source for quality medical care.
      </p>
    </div>

 
      <main>
          <p id="greeting"></p>
          <h2>Welcome to our website!</h2>
          <p>
            We are committed to providing our patients with the highest quality
            medical care. Our team of experienced healthcare professionals is
            dedicated to helping you and your family stay healthy and happy. From
            routine check-ups to complex medical procedures, we offer a wide range
            of services to meet your healthcare needs.
          </p>
          <a href="#">Learn more</a>
      </main>
       <h1 id="ho"></h1>

       <h3 style="padding: 20px">Upcoming Appointments</h3>
      <table style="margin-top: 20px">
        <thead>
          <tr>
            <th>Date</th>
            <th>Time</th>
            <th>Doctor Name</th>
          </tr>
        </thead>
        <tbody>

          <c:forEach items="${data}" var="Apptdata">
          <tr>      
              <td>${Apptdata.getAdate()}</td>
              <td>${Apptdata.getAtime()}</td>
              <td>${Apptdata.getDname()}</td>
              
              <!-- <td><input type="checkbox" name="checkbox" value="${Apptdata.getAid()}" />&nbsp;</td>
              
              <td>
                <form action="docPulldetails" method="get">
                  
                  <input type="submit" value="click to view" id="profileBtn" onclick="func('${Apptdata.getMail()}')">
                  
                </form>
              </td> -->
          </tr>
		      </c:forEach>
          </tbody>
      </table>

      <h3 style="padding: 20px">Cancelled Appointments</h3>
      <table style="margin-top: 20px">
        <thead>
          <tr>
            <th>Date</th>
            <th>Time</th>
            <th>Doctor Name</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach items="${cancelData}" var="Apptdata">
          <tr>      
              <td>${Apptdata.getAdate()}</td>
              <td>${Apptdata.getAtime()}</td>
              <td>${Apptdata.getDname()}</td>
              
              <!-- <td><input type="checkbox" name="checkbox" value="${Apptdata.getAid()}" />&nbsp;</td>
              
              <td>
                <form action="docPulldetails" method="get">
                  
                  <input type="submit" value="click to view" id="profileBtn" onclick="func('${Apptdata.getMail()}')">
                  
                </form>
              </td> -->
          </tr>
		      </c:forEach>
          </tbody>
      </table>

    <script>
      const cok=document.cookie;

      function toggleMenu() {
        document.getElementById("menu").classList.toggle("show");
        document.querySelector(".hamburger-menu").classList.toggle("open");

        const cookieValue = document.cookie
			.split('; ')
			.find(row => row.startsWith('name='))
			.split('=')[1];

		// Update the text of the paragraph element with the greeting message
		document.getElementById("greeting").textContent = "Hi " + cookieValue + "!";
        }
      
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
