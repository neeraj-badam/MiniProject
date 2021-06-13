<%@ page language="java" import="java.util.*,java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
	<style>
		table{
			margin : auto;
			border-collapse:collapse;
		}
		th{
			font-size : 22px;
			padding : 15px;
		}
		td{
			padding : 10px;
			text-align : center;
		}
		input
		{
			visibility : hidden;
		}
	</style>
</head>
<body>
			<%
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
			Statement st = (Statement) con.createStatement();
			ResultSet rs = st.executeQuery("select * from company");
			%>
			
			
	<div class="container">
        <div class="row">
            <div class="col-2">
                <img src="Images/cvrlogo.jpg" height="150px" align="left">
            </div>
            <div class="col-6">
                <center>
                    <h1>CVR College of Engineering</h1>
                    <center>
                        <b>(An UGC Autonomous Institute)</b>
                    </center>
                    Vastunagar, Mangalpalli (V), Ibrahimpatnam (M),
                    <center class="tab4">
                        Rangareddy (D), Telangana 501 510
                    </center>
                    <center>
                        <h4><b>Department of Civil Engineering</b></h4> 
                    </center>
                </center>
            </div>
        </div>			
		<table border="1">
			<thead>
				<tr>
					<th>Company Name</th>
					<th>Company Address</th>
					<th>Company Location</th>
					<th>Investigator Name</th>
					<th>Investigator Designation</th>
					<th>Select Company</th>
				</tr>
			</thead>
			<tbody>
				<%
					while(rs.next())
					{
						out.print("<form action='GenerateReport.jsp'>");
		    			response.setStatus(HttpServletResponse.SC_TEMPORARY_REDIRECT);
						out.print("<tr>");
						String ss = rs.getString(1);
						out.print("<input type='text' name='companyName' value='"+ss+"'>");
						out.print("<td>"+rs.getString(1)+"</td>");
						ss = rs.getString(2);
						out.print("<input type='text' name='companyAddress' value='"+ss+"'>");
						out.print("<td>"+rs.getString(2)+"</td>");
						ss = rs.getString(3);
						out.print("<input type='text' name='companyLocation' value='"+ss+"'>");
						out.print("<td>"+rs.getString(3)+"</td>");
						ss = rs.getString(4);
						out.print("<input type='text' name='investigatorName' value='"+ss+"'>");
						out.print("<td>"+rs.getString(4)+"</td>");
						ss = rs.getString(5);
						out.print("<input type='text' name='investigatorDesignation' value='"+ss+"'>");
						out.print("<td>"+rs.getString(5)+"</td>");
						ss = rs.getString(6);
						out.print("<input type='text' name='companyCode' value='"+ss+"'>");
						out.print("<th><button type='submit' value = 'Select'>Select</button</th>");
						out.print("</tr>");
						out.print("</form>");
					}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>

