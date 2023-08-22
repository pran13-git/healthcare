package src;


import java.io.*;
import java.util.*;
import java.util.Date;
import java.text.*; 
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
// import pack.Apptdata;


public class View extends HttpServlet{
    
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost:3306/db";

    static final String USER = "root";
    static final String PASSWORD = "root123";

    public void doGet(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException{

        res.setContentType("text/html");
        PrintWriter out = res.getWriter();


        try{
            Class.forName(JDBC_DRIVER);

            Connection con = DriverManager.getConnection(DB_URL,USER,PASSWORD);

            Statement stm = con.createStatement();
            String sql;
            sql = "SELECT * FROM appts";
            
            ResultSet rs = stm.executeQuery(sql);

            List<Apptdata> dataList = new ArrayList<Apptdata>();        // list of Apptdata objects
           

            out.println("<label for=\"apptDel\">Choose an appointment to cancel:</label>");
            
            while(rs.next()){
                // int id=rs.getInt("appt_id");
                // out.print("<input type=\"checkbox\" id=\""+id+"\" value=\""+id+"\">");
                // out.print("<label for=\""+id+"\">");
                // out.println("<tr>");
                int a_id=rs.getInt("appt_id");
                int s_id=rs.getInt("student_id");
                String s_name=rs.getString("student_name");
                String d_name=rs.getString("doctor_name");
               
                Date date = rs.getDate("appt_date");  
                DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");  
                String appt_date = dateFormat.format(date);  

                String appt_time=rs.getString("appt_time");

                String toggle=rs.getString("toggle");
                String mail=rs.getString("email");
                //String toggle=rs.getString("toggle");
                if(toggle.equals("s"))
                {
                    dataList.add(new Apptdata(a_id,s_id,s_name,d_name,appt_date,appt_time, toggle, mail));
                    out.print("</tr></label><br>"); 
                }


            }

            int test=1;
            
            req.setAttribute("data", dataList);
            //req.setAttribute("data", dataList);
            req.getRequestDispatcher("WEB-INF\\jsp\\doc_apt.jsp").forward(req, res);


            rs.close();
            stm.close();
            con.close();

            out.println("</tbody>");
            out.println("</body>\n</html>");
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