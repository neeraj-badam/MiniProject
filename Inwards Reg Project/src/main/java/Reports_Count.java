

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class Reports_Count
 */
@WebServlet("/Reports_Count")
public class Reports_Count extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Reports_Count() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession h = request.getSession(false);
		response.setContentType("text/html");
		PrintWriter pw=response.getWriter();
		pw.println("<style>body{margin-left:30%;margin-right:20%;}table{border-collapse:collapse;}</style>");
		pw.println("<table>\r\n" + 
				"		<tr>\r\n" + 
				"			<td>\r\n" + 
				"				<img src=\"https://upload.wikimedia.org/wikipedia/en/4/4c/Cvrh.ibp.jpg\" height=\"125px\" align=\"left\">\r\n" + 
				"			</td>\r\n" + 
				"			<td>\r\n" + 
				"                <center>\r\n" + 
				"                    <p style=\"font-size:30px;\"><b>CVR College of Engineering</b></p><br>\r\n" + 
				"                        <b>(An UGC Autonomous Institute)</b>\r\n" + 
				"                    <br>\r\n" + 
				"                    Vastunagar, Mangalpalli (V), Ibrahimpatnam (M),\r\n" + 
				"                    <center class=\"tab4\">\r\n" + 
				"                        Rangareddy (D), Telangana 501 510\r\n" + 
				"                    \r\n" + 
				"                        <h4 ><b>Department of Civil Engineering</b></h4> \r\n" + 
				"                    </center>\r\n" + 
				"                </center>\r\n" + 
				"			</td>\r\n" + 
				"		</tr>\r\n" + 
				"	</table>");
		String date = (String) h.getAttribute("date");
		pw.println("<b>Reports on : "+date+"</b>");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root");
			PreparedStatement st = con.prepareStatement("select * from register where date = ?");
			st.setString(1, date);
			ResultSet rs = st.executeQuery();
			String s="<table border=1>";
			while(rs.next())
			{
				s+="<tr>";
				s+="<td>";
				s+="<form action='./ValidateServlet' method='post'> <center style='margin-left:10px;margin-top:10px;margin-bottom:10px;'><input type='text' size='50' name='reference' readonly value='"+rs.getString(1)+"' style='border:none;'></center>";
				s+="</td>";
				s+="<td style=\"display:none;\">";
				s+="<input type='hidden' name='date' value='null'>";
				s+="</td>";
				s+="<td>";
				s+="<input type='submit' value='view' style='margin:20px'>";
				s+="</td>";
				s+="</form>";
				s+="<tr>";
			}
			s+="</table>";
			pw.println(s);
		}
		catch(Exception e) {
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
