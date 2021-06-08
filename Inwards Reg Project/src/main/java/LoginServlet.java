

import java.io.Console;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			response.setContentType("text/html");
			PrintWriter pw = response.getWriter();
			
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root");
			Statement st = (Statement) con.createStatement();
			ResultSet rs = st.executeQuery("select * from registration where username='"+username+"' and password='"+password+"'");
			if(rs.next())
			{
		        HttpSession session=request.getSession();  
		        session.setAttribute("username",username);  
		        response.setHeader("Location", "Profile.jsp");
    			response.setStatus(HttpServletResponse.SC_TEMPORARY_REDIRECT); 
				pw.println("<h6 class='text-white'>Login Succesfully done</h6>");
				request.getRequestDispatcher("Profile.jsp").include(request, response);
			}
			else
			{
				pw.println("<h6 class='text-white'>Invalid Username/Password</h6>");
				request.getRequestDispatcher("Login.jsp").include(request, response);	
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
