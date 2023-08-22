package src;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

 
public class addPresc extends HttpServlet{
		// JDBC driver name and database URL
      static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
      static final String DB_URL="jdbc:mysql://localhost:3306/db";

      //  Database credentials
      static final String USER = "root";
      static final String PASS = "root123";
	  public void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
 
		// Set response content type
		PrintWriter out = response.getWriter();
		
	      response.setContentType("text/html");
		try {
			// Register JDBC driver
			Class.forName(JDBC_DRIVER);
			//Class.forName("com.mysql.cj.jdbc.Driver");

			// Open a connection
			Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
			out.println("hi");
			Cookie[] cookies = request.getCookies();
			String email_c = null;
			if (cookies != null) {
				for (Cookie cookie : cookies) {
					if (cookie.getName().equals("email")) {
						email_c = cookie.getValue();
						break;
					}
				}
			}
			out.println(email_c);

			out.println("hi");
			// Execute SQL query
			// Statement stmt = conn.createStatement();
	String sql = "INSERT INTO prescription VALUES(?,?)";
PreparedStatement statement = conn.prepareStatement(sql);

String src="";
String html = request.getParameter("imgDiv");
        String pattern = "<img.*?src=\"(.*?)\".*?>";
        Pattern r = Pattern.compile(pattern);
        Matcher m = r.matcher(html);
        if (m.find()) {
            src = m.group(1);
            System.out.println(src);
        } else {
            System.out.println("No match found.");
        }

// out.println(request.getParameter("imgDiv"));
// String str="+"+request.getParameter("imgDiv");
// out.println(src);

// Set the parameter values
statement.setString(1, email_c);
statement.setString(2, src);

out.println("hi");
// Execute the update query
statement.executeUpdate();

out.println("hi");
	
			// Extract data from result set
	// 		ArrayList<med_det> med_dets = new ArrayList<med_det>();
				
                    
	// 			// forwarding the request to Welcome.java
        
    //     med_dets.add(new med_det(request.getParameter("name"),email_c,request.getParameter("phone"),request.getParameter("allergies"),request.getParameter("med")));

    //         request.setAttribute("med_dets",med_dets);
  
    //     RequestDispatcher rd = request.getRequestDispatcher("WEB-INF\\jsp\\profile.jsp");
	//   rd.forward(request, response); 	
			


			// Clean-up environment
			statement.close();
			conn.close();
		} 
		catch(SQLException se) {
         //Handle errors for JDBC
         se.printStackTrace();
		 out.println(se);
		} 
		catch(Exception e) {
         //Handle errors for Class.forName
         e.printStackTrace();
		 out.println(e);
		} 
   }
} 
