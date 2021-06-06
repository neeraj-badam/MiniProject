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
import javax.servlet.http.HttpSession;
@WebServlet("/Register2")
public class Register2 extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		try {
			
			HttpSession httpsession=request.getSession(false);  
		   	if(httpsession == null)
		   	{
		   		response.getWriter().println("<h6 class='text-white'>You are not authorised to view this page</h6>");
		   		request.getRequestDispatcher("Login.jsp").forward(request, response);
		   	}
		   	String username = (String)httpsession.getAttribute("username");
		   	if(username == null || !username.equals("admin"))
		   	{
		   		response.getWriter().println("<h6 class='text-white'>You are not authorised to view this page</h6>");
		   		request.getRequestDispatcher("Login.jsp").forward(request, response);
		   	}
			
		   	Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root");
			PreparedStatement pst;
			Statement st = (Statement) con.createStatement();
			ResultSet rs = st.executeQuery("select * from users");
			int cnt=0;
			while(rs.next())
			{
				cnt++;
			}
			cnt++;
			String reference;
			if(cnt < 10)
				reference = "CVR/CED/CC/MT-2/HPC/2021-0"+cnt;
			else
				reference = "CVR/CED/CC/MT-2/HPC/2021-"+cnt;
			String d[];
			String date = request.getParameter("date");
			d = date.split("-");
			date = d[2]+"-"+d[1]+"-"+d[0];
			String cubes = request.getParameter("cubes");
			String custref = request.getParameter("custref");
			String age = request.getParameter("age");
			String id = request.getParameter("id");
			String material = request.getParameter("material");
			d = material.split("-");
			material = d[2]+"-"+d[1]+"-"+d[0];
			String grade = request.getParameter("grade");
			String condition = request.getParameter("condition");
			String test = request.getParameter("test");
			String castdate = request.getParameter("castdate");
			String testdate = request.getParameter("testdate");
			String avg = request.getParameter("avg");
			String question = "?,?,?,?,?,?,?,?,?,";
			String Str="";
			int x = 0;
			for(int i=0;i<Integer.parseInt(cubes);i++)
			{
				question += "?,";
				Str += "cube"+i+" varchar(50),";
				question += "?,";
				Str += "cross"+i+" varchar(100),";
				if(x == 0)
				{
					question += "?,";
					Str += "castdate varchar(50),";
					question += "?,";
					Str += "testdate varchar(50),";
					question += "?,";
					Str += "age varchar(10),";
					x = 1;
				}
				question += "?,";
				Str += "weight"+i+" varchar(100),";
				question += "?,";
				Str += "failure"+i+" varchar(100),";
				question += "?,";
				Str += "Compressive"+i+" varchar(100),";
			}
			question += "?";
			String count = "";
			if(cnt < 10)
				count += "0"+cnt;
			else
				count += cnt;
			String create = "create table Book"+count+"("+"ref varchar(50),date varchar(20),cubes varchar(50),custref varchar(50),id varchar(50),material varchar(50),grade varchar(50),con varchar(50),test varchar(50),"+Str+"average varchar(50))";
			System.out.println(create);
			st.executeUpdate(create);
			System.out.println(question);
			System.out.println(question.split(",").length);
			pst = con.prepareStatement("insert into Book"+count+" values("+question+")");
			st.executeUpdate("insert into users(ref) values('"+reference+"')");
			pst.setString(1, reference);
			pst.setString(2, date);
			pst.setString(3, cubes);
			pst.setString(4, custref);
			pst.setString(5, id);
			pst.setString(6, material);
			pst.setString(7, grade);
			pst.setString(8, condition);
			pst.setString(9, test);
			int val = 10;
			x = 0;
			Str = "";
			for(int i=0;i<Integer.parseInt(cubes);i++)
			{
				Str = "dimension"+i;
				String str = request.getParameter(Str);
				pst.setString(val, str);
				System.out.println("Done cubes");
				val++;
				Str = "area"+i;
				str = request.getParameter(Str);
				pst.setString(val, str);
				System.out.println("Done cross");
				val++;
				if(x == 0)
				{
					Str = "dateCast";
					str = request.getParameter(Str);
					d = str.split("-");
					str = d[2]+"-"+d[1]+"-"+d[0];
					pst.setString(val, str);
					val++;
					Str = "datetest";
					str = request.getParameter(Str);
					d = str.split("-");
					str = d[2]+"-"+d[1]+"-"+d[0];
					pst.setString(val, str);
					val++;
					pst.setString(val, age);
					val++;
					x = 1;
				}
				Str = "weight"+i;
				str = request.getParameter(Str);
				pst.setString(val, str);
				val++;
				Str = "failure"+i;
				str = request.getParameter(Str);
				pst.setString(val, str);
				val++;
				Str = "strength"+i;
				str = request.getParameter(Str);
				pst.setString(val, str);
				val++;
				System.out.println("Done "+i);
			}
			PrintWriter pw = response.getWriter();
			pst.setString(val, avg);
			try {
				pst.executeUpdate();
				HttpSession h = request.getSession();
				//System.out.println(reference+"in reg");
				h.setAttribute("reference", reference);
				//pw.println("Successfully Submitted Report");
				request.getRequestDispatcher("ReportsRetrieve").include(request, response);
			}
			catch(Exception e)
			{
				pw.println("Invalid Details In first catch");
				request.getRequestDispatcher("index.jsp").include(request, response);
				e.printStackTrace();
			}
		}
		catch(Exception e)
		{
			PrintWriter pw = response.getWriter();
			pw.println("Invalid Details In second catch");
			request.getRequestDispatcher("index.jsp").include(request, response);
			e.printStackTrace();
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}