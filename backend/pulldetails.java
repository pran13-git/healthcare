import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import com.google.gson.Gson;


class med_det {
		    String name;
    String email;
    String phone;
    String allergies;
    String med;
	public med_det(String name,String email,String phone,String allergies,String med){
	this.name = name;
    this.email = email;
    this.phone = phone;
    this.allergies = allergies;
    this.med = med;
	}

    // constructors
    // standard getters and setters.
}
 
public class pulldetails extends HttpServlet{
		// JDBC driver name and database URL
      static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";  
      static final String DB_URL="jdbc:mysql://localhost:3306/xx";

      //  Database credentials
      static final String USER = "root";
      static final String PASS = "Sam123!";
	  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
 
		// Set response content type
		PrintWriter out = response.getWriter();
		Cookie[] cookie = null;

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
			cookie = request.getCookies();
			String email_c=cookie[0].getName();
			// Extract data from result set
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
			Gson gson = new Gson();
        
        med_det med_dets = new med_det(name,email,phone,allergies,med);
        String med_trial = this.gson.toJson(med_dets);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        RequestDispatcher rd = request.getRequestDispatcher("profile.html");
	  rd.forward(request, response);
        out.print(med_trial);
        out.flush();   	
			

               
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