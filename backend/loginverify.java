import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
 
public class loginverify extends HttpServlet{
		// JDBC driver name and database URL
      static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";  
      static final String DB_URL="jdbc:mysql://localhost:3306/healthcare";

      //  Database credentials
      static final String USER = "root";
      static final String PASS = "password";
	  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
 
		// Set response content type
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String title = "Database Result";
		String docType =
         "<!doctype html public \"-//w3c//dtd html 4.0 " + "transitional//en\">\n";
      
		out.println(docType +
         "<html>\n" +
         "<head><title>" + title + "</title></head>\n" +
         "<body bgcolor = \"#f0f0f0\">\n" +
         "<h1 align = \"center\">" + title + "</h1>\n");
		try {
			// Register JDBC driver
			Class.forName(JDBC_DRIVER);
			//Class.forName("com.mysql.cj.jdbc.Driver");

			// Open a connection
			Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
			
			// Execute SQL query
			Statement stmt = conn.createStatement();
			String sql;
			sql = "SELECT * FROM login";
			ResultSet rs = stmt.executeQuery(sql);
			int f=0;
			// Extract data from result set
			while(rs.next()){
				//Retrieve by column name
				String email = rs.getString("email");
				String pw = rs.getString("pw");
                String user_type = rs.getString("user_type");
				//Display values
				
                if(email.equals(request.getParameter("email")))
                {
                    if(pw.equals(request.getParameter("pw")))
                    {
                        //out.print("verified");
                       //	out.print(", First: " + email );
                        //out.print(", First: " + usertype );
				//out.println(", Last: " + password + "<br>"); 
				if ("student".equals(request.getParameter("user_type"))){
                        f=1;
                        Cookie cemail = new Cookie("email", request.getParameter("email"));
                        response.addCookie(cemail);
				RequestDispatcher rd = request.getRequestDispatcher("student_home.html");
				rd.forward(request, response);
                        //out.print("<br><a href='student_home.html?email="+email+" '></a>");
}
			if ("doctor".equals(request.getParameter("user_type"))){
                         f=1;
				//RequestDispatcher rd = request.getRequestDispatcher("student_home.html");
				//rd.forward(request, response);
				//out.print("<br><a href='student_home.html?email="+email+" '></a>"); 
}
				// forwarding the request to Welcome.java
				


                    }
                }
			}
			if (f==0)
                   {
				out.print("INVALID LOGIN");

			}
			out.println("</body></html>");

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