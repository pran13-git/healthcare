package src;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
//import trial.med_det;


 
public class updatedetails extends HttpServlet{
		// JDBC driver name and database URL
      static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
      static final String DB_URL="jdbc:mysql://localhost:3306/db";

      //  Database credentials
      static final String USER = "root";
      static final String PASS = "root123";
	  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
 
		// Set response content type
		PrintWriter out = response.getWriter();
		Cookie[] cookie = null;
	      response.setContentType("text/html");
		try {
			// Register JDBC driver
			Class.forName(JDBC_DRIVER);
			//Class.forName("com.mysql.cj.jdbc.Driver");

			// Open a connection
			Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
			cookie = request.getCookies();
			String email_c=cookie[0].getValue();
			// Execute SQL query
			Statement stmt = conn.createStatement();
	String sql = "UPDATE med_det SET name=?, phone=?, allergies=?, med=? WHERE email=?";
PreparedStatement statement = conn.prepareStatement(sql);

// Set the parameter values
statement.setString(1, request.getParameter("name"));
statement.setString(2, request.getParameter("phone"));
statement.setString(3, request.getParameter("allergies"));
statement.setString(4, request.getParameter("med"));
statement.setString(5, email_c);

// Execute the update query
int rowsAffected = statement.executeUpdate();
	
			// Extract data from result set
			ArrayList<med_det> med_dets = new ArrayList<med_det>();
				
                    
				// forwarding the request to Welcome.java
        
        med_dets.add(new med_det(request.getParameter("name"),email_c,request.getParameter("phone"),request.getParameter("allergies"),request.getParameter("med")));

            request.setAttribute("med_dets",med_dets);
  
        RequestDispatcher rd = request.getRequestDispatcher("WEB-INF\\jsp\\profile.jsp");
	  rd.forward(request, response); 	
			


			// Clean-up environment
			statement.close();
			conn.close();
		} 
		catch(SQLException se) {
         //Handle errors for JDBC
         se.printStackTrace();
		} 
		catch(Exception e) {
         //Handle errors for Class.forName
         e.printStackTrace();
		} 
   }
} 