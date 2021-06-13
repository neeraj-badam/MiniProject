
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		try {
			
			String companyCode = request.getParameter("companyCode");
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root");
			
		Statement state = (Statement) con.createStatement();
		ResultSet rs = state.executeQuery("select * from register");
		int cnt=0;
		while(rs.next())
		{
			cnt++;
		}
		cnt++;
		String str = request.getParameter("reference");
		System.out.println(str);
		PreparedStatement st = con.prepareStatement("insert into register(ref,date,date1,grade,con,cubes,date2,seven,twenty,villa,remarks,companyName,companyAddress,companyLocation,InvestigatorName,InvestigatorDesignation) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
		String date = request.getParameter("date");
		String date1 = request.getParameter("date1");
		String grade = request.getParameter("grade");
		String condition = request.getParameter("condition");
		String cubes = request.getParameter("cubes");
		String date2 = request.getParameter("date2");
		System.out.println(date2);
		String Seven = request.getParameter("Seven");
		String twentyEight = request.getParameter("twentyEight");
		String villa = request.getParameter("villa");
		String companyName = request.getParameter("companyName");
		String companyAddress = request.getParameter("companyAddress");
		String companyLocation = request.getParameter("companyLocation");
		String investigatorName = request.getParameter("investigatorName");
		String investigatorDesignation = request.getParameter("investigatorDesignation");
		String remarks="";
		try {
			remarks = request.getParameter("remarks");
			remarks = remarks.trim();
			if(remarks.length() == 0)
				remarks = " ";
			}
			catch(Exception e)
			{
				
			}
		String d[] = date.split("-");
		date = d[2]+"-"+d[1]+"-"+d[0];
		d = date1.split("-");
		date1 = d[2]+"-"+d[1]+"-"+d[0];
		d = date2.split("-");
		date2 = d[2]+"-"+d[1]+"-"+d[0];
		System.out.println(date2);
		String dateOfCast = date2;
		st.setString(1,str);
		try {
		st.setString(2,date);
		st.setString(3,date1);
		st.setString(4,grade);
		st.setString(5,condition);
		st.setString(6,(cubes));
		st.setString(7,dateOfCast);
		st.setString(8,Seven);
		st.setString(9,twentyEight);
		st.setString(10,villa);
		st.setString(11,remarks);
		st.setString(12,companyName);
		st.setString(13,companyAddress);
		st.setString(14,companyLocation);
		st.setString(15,investigatorName);
		st.setString(16,investigatorDesignation);
		st.execute();
		System.out.println("Execution done");
		
		request.getRequestDispatcher("ValidateServlet").include(request, response);
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
			pw.println("Invalid Details");
			request.getRequestDispatcher("GenerateReport.jsp").forward(request, response);
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
