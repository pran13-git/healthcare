package src;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
//import trial.med_det;


 
public class selappt extends HttpServlet{

    
	  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
 
	      response.setContentType("text/html");
		
  
        RequestDispatcher rd = request.getRequestDispatcher("WEB-INF\\jsp\\stap.jsp");
	  rd.forward(request, response); 	
			
   }
} 