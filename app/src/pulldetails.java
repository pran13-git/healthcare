package src;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
//import trial.med_det;


 
public class pulldetails extends HttpServlet{
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
			
			// Execute SQL query
			Statement stmt = conn.createStatement();
			String sql;
			sql = "SELECT * FROM med_det";
			ResultSet rs = stmt.executeQuery(sql);
			String email_c;
			// String referringPage = request.getHeader("Referer");
    		// 	if (referringPage != null && referringPage.endsWith("/doc_apt.jsp")) {
			// 	// The request was made from a page with a URL of referringPage
			// 	// ...
			// 	email_c=(String)request.getAttribute("profileDet");
    		// }
			// else{
				cookie = request.getCookies();
				email_c=cookie[0].getValue();

			out.print(email_c);
			// Extract data from result set
			ArrayList<med_det> med_dets = new ArrayList<med_det>();
			while(rs.next()){
				//Retrieve by column name
				String email = rs.getString("email");
				String name = rs.getString("name");
				String phone = rs.getString("phone");
                String allergies = rs.getString("allergies");
				String med = rs.getString("med");
				//Display values
				
                if(email.equals(email_c))
                {
                    
				// forwarding the request to Welcome.java
        
        med_dets.add(new med_det(name,email,phone,allergies,med));

            request.setAttribute("med_dets",med_dets);
  
        RequestDispatcher rd = request.getRequestDispatcher("WEB-INF\\jsp\\profile.jsp");
	  rd.forward(request, response); 	
			

               
                }	

			}
	




			// Clean-up environment
			rs.close();
			stmt.close();
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
		finally {
		/*  //finally block used to close resources
         try {
            if(stmt!=null)
               stmt.close();
         } catch(SQLException se2) {
         } // nothing we can do
         try {
            if(conn!=null)
            conn.close();
         } catch(SQLException se) {
            se.printStackTrace();
         } //end finally try */
		} //end try
   }
} 