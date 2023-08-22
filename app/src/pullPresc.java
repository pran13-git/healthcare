
package src;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;



 
// public class pullPresc extends HttpServlet{
// 		// JDBC driver name and database URL
//       static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
//       static final String DB_URL="jdbc:mysql://localhost:3306/db";

//       //  Database credentials
//       static final String USER = "root";
//       static final String PASS = "root123";
// 	  public void doGet(HttpServletRequest request, HttpServletResponse response)
//       throws ServletException, IOException {
 
// 		// Set response content type
// 		PrintWriter out = response.getWriter();
// 		//Cookie[] cookie = null;
// 	      response.setContentType("text/html");
// 		try {
// 			// Register JDBC driver
// 			Class.forName(JDBC_DRIVER);
// 			//Class.forName("com.mysql.cj.jdbc.Driver");

// 			// Open a connection
// 			Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
			
// 			Execute SQL query
// 			Statement stmt = conn.createStatement();
// 			String sql;
// 			sql = "SELECT * FROM prescription";
// 			ResultSet rs = stmt.executeQuery(sql);
// 			//String email_c;
// 			// String referringPage = request.getHeader("Referer");
//     		// 	if (referringPage != null && referringPage.endsWith("/doc_apt.jsp")) {
// 			// 	// The request was made from a page with a URL of referringPage
// 			// 	// ...
// 			// 	email_c=(String)request.getAttribute("profileDet");
//     		// }
// 			// else{
// 				// cookie = request.getCookies();
// 				// email_c=cookie[0].getValue();

// 			// out.print(email_c);
// 			// Extract data from result set
// 			ArrayList<prescription> p_dets = new ArrayList<prescription>();
// 			while(rs.next()){
// 				//Retrieve by column name
// 				String email = rs.getString("email");
// 				String url = rs.getString("url");
// 				//Display values
				
                    
// 				// forwarding the request to Welcome.java
        
//                     p_dets.add(new prescription(email,url));

//                     request.setAttribute("p_dets",p_dets);
            
//                     RequestDispatcher rd = request.getRequestDispatcher("WEB-INF\\jsp\\pharm_page.jsp");
//                 rd.forward(request, response); 	
			

               
//                 }	

			
	




// 			// Clean-up environment
			
// 			rs.close();
// 			stmt.close();
// 			conn.close();
//         }
// 		catch(SQLException se) {
//          //Handle errors for JDBC
//          se.printStackTrace();
// 		} 
// 		catch(Exception e) {
//          //Handle errors for Class.forName
//          e.printStackTrace();
// 		} 
// 		finally {
// 		/*  //finally block used to close resources
//          try {
//             if(stmt!=null)
//                stmt.close();
//          } catch(SQLException se2) {
//          } // nothing we can do
//          try {
//             if(conn!=null)
//             conn.close();
//          } catch(SQLException se) {
//             se.printStackTrace();
//          } //end finally try */
// 		} //end try
//    }
// }

public class pullPresc extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("WEB-INF\\jsp\\pharm_page.jsp");
		rd.forward(request, response); 	
	  }
	}

