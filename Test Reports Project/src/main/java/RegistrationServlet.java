import java.io.*;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			response.setContentType("text/html");
    		Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root");
			PreparedStatement pt = con.prepareStatement("insert into Registration(username,name,email,password) values(?,?,?,?)");
    		PrintWriter pw = response.getWriter();
    		String username = request.getParameter("username");
    		String name = request.getParameter("name");
    		String email = request.getParameter("email");
    		String password = request.getParameter("password");
    		pt.setString(1, username);
    		pt.setString(2, name);
    		pt.setString(3, email);
    		pt.setString(4, password);
    		try {
    			pt.executeUpdate();
    			response.setHeader("Location", "Login.jsp");
    			response.setStatus(HttpServletResponse.SC_TEMPORARY_REDIRECT); 
    			pw.println("<h6 class='text-white lead'>Registration Successful</h6>");
        		request.getRequestDispatcher("Login.jsp").include(request,response);
    		}
    		catch(Exception e)
    		{
    			pw.println("<h6 class='text-white'>Username Already Exist please choose another username</h6>");
        		request.getRequestDispatcher("Register.jsp").include(request,response);
    		}
    		
    	} catch (Exception e) {
    		
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
