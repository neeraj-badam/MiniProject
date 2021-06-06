

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CheckServlet
 */
@WebServlet("/CheckServlet")
public class CheckServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter pw = response.getWriter();
		String restaurant = request.getParameter("restaurant");
		String location = request.getParameter("location");
		String starters = request.getParameter("starters");
		String desserts = request.getParameter("desserts");
		String mainmenu = request.getParameter("mainmenu");
		String star = request.getParameter("star");
		String review = request.getParameter("review");
		try {
			response.setContentType("text/html");
    		Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root");
			PreparedStatement pt = con.prepareStatement("insert into review(name,restaurant,loc,starters,desserts,menu,review,rating,avgRating) values(?,?,?,?,?,?,?,?,?)");
			HttpSession hp = request.getSession();
			String s = (String)hp.getAttribute("username");
			if(hp == null || s == null ) {	
				pw.println("<h6 class='text-white'>Please login first .You are not authorised to view this page</h6>");
				request.getRequestDispatcher("Login.jsp").include(request, response);
				
			}
			else if(review.length()>300)
			{
				pw.println("Review should not be more than 300 characters ");
				request.getRequestDispatcher("Review.jsp").include(request, response);
			}
			else {
				PreparedStatement del = con.prepareStatement("delete from review where loc = ? and restaurant = ? and name = ?");
				del.setString(1, location);
				del.setString(2, restaurant);
				del.setString(3, s);
				del.executeUpdate();
				PreparedStatement st = con.prepareStatement("select rating from review where loc = ? and restaurant = ?");
				st.setString(1, location);
				st.setString(2, restaurant);
				ResultSet res = st.executeQuery();
				String v="";
				System.out.println(star);
				if(star == null) {
					v = "0";
				}
				else {
					char c = star.charAt(4);
					v = c+"";
				}
				int val = Integer.parseInt(v);
				float sum =val ,count=1;
			while(res.next())
			{
				sum += (float)res.getFloat(1);
				count++;
			}
			if(count != 0)
				sum = sum / count;	
			pt.setString(1, s);
			pt.setString(2, restaurant);	
			pt.setString(3, location);
			pt.setString(4, starters);
			pt.setString(5, desserts);
			pt.setString(6, mainmenu);			
			pt.setString(7, review);
			pt.setInt(8, val);
			pt.setFloat(9, sum);
			pt.executeUpdate();	
			st = con.prepareStatement("update review set avgRating = ? where loc = ? and restaurant = ?");
			st.setFloat(1, sum);
			st.setString(2, location);
			st.setString(3, restaurant);
			st.executeUpdate();
			request.getRequestDispatcher("Profile.jsp").include(request, response);
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
