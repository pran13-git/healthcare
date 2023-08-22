package src;

import java.io.*;
import java.util.*;
import java.util.Date;
import java.text.*; 
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class getAppt extends HttpServlet{
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
            List<Apptdata> cancelList = new ArrayList<Apptdata>();
            Cookie[] cookies = req.getCookies();

            //Cookie cookie = (Cookie)req.getAttribute("cemail");
            // out.println(cookies);
            String email_c =null;
            // // Check if the "email" cookie exists
                        if (cookies != null) {
            for (Cookie cookie : cookies) {
                out.println(cookie.getName());
                if (cookie.getName().equals("email")) {
                email_c = cookie.getValue();
                break;
                }
            }
            }
            if (email_c==null){
            email_c = (String)req.getAttribute("cemail");}

			// String email_c=cookie[0].getValue();

            //out.println("<body>"+email_c+"</body>");

            // out.println("<label for=\"apptDel\">Choose an appointment to cancel:</label>");

            // if (email_c != null) {
            
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
                    DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");  
                    String appt_date = dateFormat.format(date);  

                    String appt_time=rs.getString("appt_time");

                    String toggle=rs.getString("toggle");
                    String mail=rs.getString("email");
                    
                    if(email_c.equals(mail))
                    {
                        if(toggle.equals("s"))
                        {
                            dataList.add(new Apptdata(a_id,s_id,s_name,d_name,appt_date,appt_time, toggle, mail));
                        }
                        else
                        {
                            cancelList.add(new Apptdata(a_id,s_id,s_name,d_name,appt_date,appt_time, toggle, mail));
                        }
                    }



                }
                out.println(dataList.get(0).getSname());
                req.setAttribute("data", dataList);
                req.setAttribute("cancelData", cancelList);
                req.getRequestDispatcher("WEB-INF\\jsp\\student_home.jsp").forward(req, res);

            //}

            // else{
                // req.getRequestDispatcher("login.html").forward(req, res);
            //}

            

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


