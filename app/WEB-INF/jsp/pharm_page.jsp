<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <!DOCTYPE html>
  <html>

  <head>
    <title>Pharmacist Homepage</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <style>
      /* Style for the dialog box */
      .image-dialog {
        display: none;
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        z-index: 9999;
        background-color: white;
        padding: 20px;
        border: 1px solid black;
        box-shadow: 0px 0px 20px 0px rgba(0, 0, 0, 0.5);
      }

      /* Style for the close button */
      .image-dialog-close {
        position: absolute;
        top: 10px;
        right: 10px;
        cursor: pointer;
      }

      body {
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
        width: 90%;
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

      td a {
        background-color: rgb(72, 183, 239);
        text-decoration: none;
      }

      td a:hover {
        transform: scale(1.2);
      }

      .student a {
        background-color: transparent;
        color: #005ff8;
        text-decoration: none;
        font-size: 18px;
      }

      .student a:hover {
        transform: scale(1.3);
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

      .days input:checked+span {
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
    </style>
  </head>

  <body>

    <div style="box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);display: flex;flex-direction: row;">
      <div style="margin: 0 auto;">
        <h1 style="text-align: center">SSN Student Healthcare</h1>
        <p style="text-align: center; padding-bottom: 10px">
          Your source for quality medical care.
        </p>
      </div>
      <div style="margin-right:10px;margin-left:10px;padding: 50px;">
        <form action="logout.php" method="post">
          <input type="submit" value="Logout" />
        </form>
      </div>
    </div>
    <main>
      <h2>Welcome Mr.Lal!</h2>
      <h3 style="padding: 20px">Upcoming Appointments</h3>
      <table style="margin-top: 20px">
        <thead>
          <tr>
            <th>Student Email</th>
            <th>Prescription URL</th>
            <!-- <th>Thumbnail</th> -->
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>name</td>
            <td>
              <button onclick="showImageDialog()">Show Image</button>
              <div id="image-dialog" class="image-dialog">
                <div id="imgDiv">

                </div>
                <img id="img" src="" alt="Image">
                <span class="image-dialog-close" onclick="hideImageDialog()">X</span>
              </div>
            </td>
          </tr>
        </tbody>
      </table>

      <br />
      <br />
    </main>

    <script>
      function toggleMenu() {
        document.getElementById("menu").classList.toggle("show");
        document.querySelector(".hamburger-menu").classList.toggle("open");
      }





      function showImageDialog() {


        function getCookie(name) {
          console.log(name);
			const value = `; ${document.cookie}`;
      console.log(value);
			const parts = value.split(`; ${name}=`);
			if (parts.length === 2) return parts.pop().split(';').shift();
		}

		// Get email cookie value
		    var email = getCookie('email');
        console.log(email);
        var emailValue = localStorage.getItem(email);   //url stores value like 'raj2010195@ssn.edu.in'
        console.log(emailValue);
        // Update the span element with the email value
        //document.getElementById('img').src = emailValue;
        document.getElementById('imgDiv').innerHTML = emailValue;


        // Show the dialog box
        document.getElementById("image-dialog").style.display = "block";
      }
      function hideImageDialog() {
        // Hide the dialog box
        document.getElementById("image-dialog").style.display = "none";
      }
    </script>
  </body>

  </html>