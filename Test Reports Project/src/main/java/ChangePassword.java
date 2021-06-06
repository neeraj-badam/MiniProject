

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ChangePassword
 */
@WebServlet("/ChangePassword")
public class ChangePassword extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String recovery = request.getParameter("recovery");
		String password = request.getParameter("password");
		try {
			response.setContentType("text/html");
    		Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root");
			PreparedStatement pt = con.prepareStatement("select * from Registration where (username=? and recovery=?) or (username=? and recovery1=?)");
			pt.setString(1, username);
			pt.setString(2, recovery);
			pt.setString(3, username);
			pt.setString(4, recovery);
			ResultSet res = pt.executeQuery();
			if(res.next())
			{
				pt = con.prepareStatement("update Registration set password = ? where username = ?");
				pt.setString(1, password);
				pt.setString(2, username);
				pt.executeUpdate();
				response.getWriter().println("<h1 style='color:white'>Password Changed</h1>");
				request.getRequestDispatcher("Login.jsp").include(request, response);
			}
			else
			{
				response.getWriter().println("<h1 style='color:white'>Invalid Details</h1>");
				request.getRequestDispatcher("Forgot.jsp").include(request, response);
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
