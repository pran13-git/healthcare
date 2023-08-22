package src;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
//import trial.med_det;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


 
public class pullappt extends HttpServlet{
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
		int f=1;
		int latest_id=0;
		cookie = request.getCookies();
		String email_c=cookie[0].getValue();
		ArrayList<Apptdata> book_appt = new ArrayList<Apptdata>();
		String stud_name="ya";
		try {
			// Register JDBC driver
			Class.forName(JDBC_DRIVER);
			//Class.forName("com.mysql.cj.jdbc.Driver");

			// Open a connection
			Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
			
			// Execute SQL query
			Statement stmt = conn.createStatement();
			String sql;
			sql = "SELECT * FROM appts";
			ResultSet rs = stmt.executeQuery(sql);
			//out.print(email_c);
			// Extract data from result set
			
			while(rs.next()){
				//Retrieve by column name
				Date date = rs.getDate("appt_date");
				DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				String appt_date=dateFormat.format(date);
				String appt_time = rs.getString("appt_time");
				int appt_id = rs.getInt("appt_id");
				//Display values	
				latest_id=appt_id;
			if (appt_date.equals(request.getParameter("date")))
			{
				if(appt_time.equals(request.getParameter("time")))
				{
					
				f=0;

				}
			}
			request.setAttribute("d",appt_date);
			request.setAttribute("t",appt_time);
			}

			if(f==0){
			request.setAttribute("f",f);

        	RequestDispatcher rd = request.getRequestDispatcher("WEB-INF\\jsp\\stap.jsp");
	  		rd.forward(request, response); 
			return;
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

		try{


			Class.forName(JDBC_DRIVER);
			//Class.forName("com.mysql.cj.jdbc.Driver");

			// Open a connection
			Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
			
			// Execute SQL query
			Statement stmt = conn.createStatement();
			String sql;
			sql = "SELECT * FROM med_det";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				String student_name = rs.getString("name");
				String email = rs.getString("email");
			if (email_c.equals(email))
			{
				stud_name=student_name;
				break;
			}}
			
			rs.close();
			stmt.close();
			conn.close();}


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


		try{
					if (f==1){
			Class.forName(JDBC_DRIVER);
			//Class.forName("com.mysql.cj.jdbc.Driver");

			// Open a connection
			Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
			
			// Execute SQL query
			Statement stmt = conn.createStatement();
			String sql;
			sql = "Insert into appts values (?,?,?,?,?,?,?,?)";
			PreparedStatement statement = conn.prepareStatement(sql);

// Set the parameter values
			statement.setInt(1,latest_id+1 );
			statement.setInt(2, 1);
			statement.setString(3, stud_name);
			statement.setString(4, "sachin");
			statement.setString(5, request.getParameter("date"));
			statement.setString(6, request.getParameter("time"));
			statement.setString(7, "s");
			statement.setString(8, email_c);

			// Execute the update query
			int rowsAffected = statement.executeUpdate();




    
			
	

        


            request.setAttribute("f",f);
  
        RequestDispatcher rd = request.getRequestDispatcher("WEB-INF\\jsp\\stap.jsp");
	  	rd.forward(request, response); 
					

			// Clean-up environment
			stmt.close();
			conn.close();}
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
		// try {
        //     if(stmt!=null)
        //        stmt.close();
        //  } catch(SQLException se2) {
        //  } // nothing we can do
        //  try {
        //     if(conn!=null)
        //     conn.close();
        //  } catch(SQLException se) {
        //     se.printStackTrace();
        //  } 
		} //end try
   }
} 