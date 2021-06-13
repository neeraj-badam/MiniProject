

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ValidateServlet
 */
@WebServlet("/ValidateServlet")
public class ValidateServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		// TODO Auto-generated method stub
		PrintWriter pw = response.getWriter();
		String ref = request.getParameter("reference");
		System.out.println(ref);
		String date = request.getParameter("date");
		if(ref.length() >= 22)
		{
			
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root");

				PreparedStatement st2 = con.prepareStatement("select * from register where ref = ?");
				st2.setString(1, ref);
				ResultSet rs = st2.executeQuery();
				if(rs.next()) {
					HttpSession h = request.getSession();
					h.setAttribute("reference", rs.getString(1));
					h.setAttribute("date", rs.getString(2));
					h.setAttribute("date1", rs.getString(3));
					h.setAttribute("grade", rs.getString(4));
					h.setAttribute("con", rs.getString(5));
					h.setAttribute("cubes", rs.getInt(6));
					h.setAttribute("date2", rs.getString(7));
					h.setAttribute("seven", rs.getString(8));
					h.setAttribute("twenty", rs.getString(9));
					h.setAttribute("villa", rs.getString(10));
					h.setAttribute("remarks", rs.getString(11));
					h.setAttribute("companyName", rs.getString(12));
					h.setAttribute("companyAddress", rs.getString(13));
					h.setAttribute("companyLocation", rs.getString(14));
					h.setAttribute("investigatorName", rs.getString(15));
					h.setAttribute("investigatorDesignation", rs.getString(16));
					
					request.getRequestDispatcher("Report1.jsp").include(request, response);
				}
				else
				{
					pw.println("Invalid Details");
					request.getRequestDispatcher("Report.jsp").include(request, response);
				}
			} 
			catch (Exception e) 
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(date.length()==10)
		{
			String d[] = date.split("-");
			date = d[2]+"-"+d[1]+"-"+d[0];
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root");
				PreparedStatement st = con.prepareStatement("select * from register where date = ?");
				st.setString(1, date);
				ResultSet rs = st.executeQuery();	
				int count=0;
				while(rs.next()) {
					count++;
					//pw.println("Here");
				}
				rs = st.executeQuery();
				//pw.println(count);
				if(count==1) {
				if(rs.next())
				{
					HttpSession h = request.getSession();
					h.setAttribute("reference", rs.getString(1));
					h.setAttribute("date", rs.getString(2));
					h.setAttribute("date1", rs.getString(3));
					h.setAttribute("grade", rs.getString(4));
					h.setAttribute("con", rs.getString(5));
					h.setAttribute("cubes", rs.getInt(6));
					h.setAttribute("date2", rs.getString(7));
					h.setAttribute("seven", rs.getString(8));
					h.setAttribute("twenty", rs.getString(9));
					h.setAttribute("villa", rs.getString(10));
					h.setAttribute("remarks", rs.getString(11));
					h.setAttribute("companyName", rs.getString(12));
					h.setAttribute("companyAddress", rs.getString(13));
					h.setAttribute("companyLocation", rs.getString(14));
					h.setAttribute("investigatorName", rs.getString(15));
					h.setAttribute("investigatorDesignation", rs.getString(16));
					request.getRequestDispatcher("Report1.jsp").include(request, response);
				}
				
				}
				else if(count>1) {
					HttpSession h = request.getSession();
					h.setAttribute("date", date);
					 RequestDispatcher rd=request.getRequestDispatcher("Reports_Count");  
				        rd.forward(request, response);  
				}
				else
				{
					pw.println("Invalid Details");
					request.getRequestDispatcher("Report.jsp").include(request, response);
				}
			} 
			catch (Exception e) 
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		}
		else
		{
			pw.println("Invalid details");
			request.getRequestDispatcher("Report.jsp").include(request, response);
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
