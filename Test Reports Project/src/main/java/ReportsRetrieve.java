

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ReportRetrieval
 */
@WebServlet("/ReportsRetrieve")
public class ReportsRetrieve extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		try {
			
			HttpSession httpsession=request.getSession(false);  
		   	if(httpsession == null)
		   	{
		   		response.getWriter().println("<h6 class='text-white'>You are not authorised to view this page</h6>");
		   		request.getRequestDispatcher("Login.jsp").forward(request, response);
		   	}
		   	String username = (String)httpsession.getAttribute("username");
		   	if(username == null)
		   	{
		   		response.getWriter().println("<h6 class='text-white'>You are not authorised to view this page</h6>");
		   		request.getRequestDispatcher("Login.jsp").forward(request, response);
		   	}
			
		   	Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root");
			
			PreparedStatement pst;
			String str = request.getParameter("reference");
			if(str == null)
			{
				HttpSession hs = request.getSession(false);
				str =(String) hs.getAttribute("reference");
			}
			System.out.println(str);
			str = str.substring(25);
			System.out.println(str);
			System.out.println(str);
			pst = con.prepareStatement("select * from Book"+str);
			//System.out.println("entered");
			ResultSet res = pst.executeQuery();
			HttpSession hp = request.getSession();
			if(res.next())
			{
				hp.setAttribute("reference", res.getString(1));
				hp.setAttribute("date", res.getString(2));
				int val = Integer.parseInt(res.getString(3));
				hp.setAttribute("cubes", val);
				hp.setAttribute("custref", res.getString(4));
				hp.setAttribute("id", res.getString(5));
				hp.setAttribute("material", res.getString(6));
				hp.setAttribute("grade", res.getString(7));
				hp.setAttribute("condition", res.getString(8));
				hp.setAttribute("test", res.getString(9));
				//System.out.println("Altest");
				int number = 10,x = 0;
				for(int i=0;i<val;i++)
				{
					//if(i == 0)
						//System.out.println(res.getString(number));
					hp.setAttribute("cube"+i, res.getString(number));
					number++;
					hp.setAttribute("cross"+i, res.getString(number));
					number++;
					if(x == 0)
					{
						hp.setAttribute("castdate", res.getString(number));
						number++;
						hp.setAttribute("testdate", res.getString(number));
						number++;
						hp.setAttribute("age", res.getString(number));
						number++;
						x = 1;
					}
					hp.setAttribute("weight"+i, res.getString(number));
					number++;
					hp.setAttribute("failure"+i, res.getString(number));
					number++;
					hp.setAttribute("compressive"+i, res.getString(number));
					number++;
				}
				hp.setAttribute("average", res.getString(number));
				request.getRequestDispatcher("Reports.jsp").include(request, response);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			response.getWriter().println("Invalid Details in reports");
			request.getRequestDispatcher("ReportRetrieval.jsp").include(request, response);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
