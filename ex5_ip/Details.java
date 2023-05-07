import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.Iterator;

public class Details extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String uname = request.getParameter("username");
		String pwd = request.getParameter("password");
		String sal = request.getParameter("salutation");
		String email = request.getParameter("email");
		String dob = request.getParameter("dob");
		String txt = request.getParameter("addexpertise");
		String[] ln = request.getParameterValues("language");
		String file = request.getParameter("photo");
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		pw.println("<table border=1>");

		pw.println("<tr>");
		pw.println("<th>Name</th>");
		pw.println("<td>");
		pw.println(name);
		pw.println("</td>");
		pw.println("</tr>");

		pw.println("<tr>");
		pw.println("<th>Username</th>");
		pw.println("<td>");
		pw.println(uname);
		pw.println("</td>");
		pw.println("</tr>");

		pw.println("<tr>");
		pw.println("<th>Password</th>");
		pw.println("<td>");
		pw.println(pwd);
		pw.println("</td>");
		pw.println("</tr>");

		pw.println("<tr>");
		pw.println("<th>Email</th>");
		pw.println("<td>");
		pw.println(email);
		pw.println("</td>");
		pw.println("</tr>");

		pw.println("<tr>");
		pw.println("<th>DOB</th>");
		pw.println("<td>");
		pw.println(dob);
		pw.println("</td>");
		pw.println("</tr>");

		pw.println("<tr>");
		pw.println("<th>Saluation</th>");
		pw.println("<td>");
		pw.println(sal);
		pw.println("</td>");
		pw.println("</tr>");

		pw.println("<tr>");
		pw.println("<th>Language</th>");
		pw.println("<td>");
		for( int i = 0; i < ln.length; i++)
		{
			 pw.println(ln[i]);
		}
		pw.println("</td>");
		pw.println("</tr>");

		pw.println("<tr>");
		pw.println("<th>File</th>");
		pw.println("<td>");
		pw.println(file);
		pw.println("</td>");
		pw.println("</tr>");

		pw.println("<tr>");
		pw.println("<th>Expertise</th>");
		pw.println("<td>");
		pw.println(txt);
		pw.println("</td>");
		pw.println("</tr>");

		pw.println("</table>");
		pw.close();
	}
}