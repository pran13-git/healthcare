package src;

import java.io.*;
import java.util.*;
import java.util.Date;
import java.text.*; 
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
// import pack.Apptdata;


public class changeToggle extends HttpServlet{
    
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost:3306/db";

    static final String USER = "root";
    static final String PASSWORD = "root123";

    public void doGet(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException{

        res.setContentType("text/html");
        PrintWriter out = res.getWriter();

        // String jsonString = request.getReader().readLine();
        // List<String> checkedValues = new Gson().fromJson(jsonString, new TypeToken<List<String>>(){}.getType());

        String checkedValuesStr = req.getParameter("checkedValues");
        String[] checkedValues = checkedValuesStr.split(",");   
        //List<String> checkedValues = Arrays.asList(checkedValuesArray);


        System.out.println(checkedValuesStr);

        


        try{
            Class.forName(JDBC_DRIVER);

            Connection con = DriverManager.getConnection(DB_URL,USER,PASSWORD);

            String sql = "UPDATE Appts SET toggle = ? WHERE appt_id = ?";
            PreparedStatement ps = con.prepareStatement(sql);

            for (int i = 0; i < checkedValues.length; i++) {
                String value = checkedValues[i];
                ps.setString(1, "d"); // set the new value for column1
                ps.setString(2, value); // set the id value
                ps.addBatch(); // add the prepared statement to the batch for execution
            }
            
            // Execute the batch update
            ps.executeBatch();

           
            
            //req.setAttribute("data", dataList);
            //req.setAttribute("data", dataList);
            req.getRequestDispatcher("View").forward(req, res);


            ps.close();
            con.close();
        }
        catch(SQLException e){
            System.out.println(e);
            out.println("<body>Database Error</body>");
            out.println("</html>");
        }
        catch(Exception e){
            System.out.println(e);
            out.println(e);
            out.println("<body>Record couldn't be viewed</body>");
            out.println("</html>");
        }
    }
}
