<%@ page language="java" import="java.sql.*,javax.servlet.*,javax.servlet.http.*,java.util.*" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<style>
		.col-lg-6{
			margin-left:3%;
			margin-right:3%;
		}
		body{
			background-size: cover;
		background-image:url("Images/profile.jpg");
		background-repeat : no-repeat;
        background-attachment: fixed;
        background-size: 100% 100%;
		}
		h1{
			color:white;
			}
	</style>
</head>
<body>

	<%
	    HttpSession httpsession=request.getSession(false);  
  
		if(session == null ) {	
			response.getWriter().println("<h6 class='text-white'>Please login first .You are not authorised to view this page</h6>");
			request.getRequestDispatcher("Login.jsp").include(request, response);
		}
	
		String s = (String)session.getAttribute("username");
		if(s == null)
		{
			response.getWriter().println("<h6 class='text-white'>Please login first .You are not authorised to view this page</h6>");
			request.getRequestDispatcher("Login.jsp").include(request, response);	
		}
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root");
		Statement st = con.createStatement();
		ResultSet res = st.executeQuery("select * from registration where username = '"+s+"'");
		res.next();
		String generate = "";
			if(s.equals("admin"))
			{
				generate = "<li><a href='Report.jsp'>PrintReport</a></li>"+"<li><a href='GenerateReport.jsp'>GenerateReport</a></li>";
			}
			else
			{
				generate = "<li><a href='Report.jsp'>PrintReport</a></li>";
			}
	%>
	<nav class="navbar navbar-inverse">
  		<div class="container-fluid">
    		<div class="navbar-header">
      			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        			<span class="icon-bar"></span>
        			<span class="icon-bar"></span>
        			<span class="icon-bar"></span>
      			</button>
				<b style="font-family:cursive"><a class="navbar-brand" href="#" style="font-size:30px">Inwards Register</a></b>
    		</div>
    		<div class="collapse navbar-collapse" id="myNavbar">
	    		<form action="Search.jsp">
    				<ul class="nav navbar-nav">
        				<%= generate %>
      				</ul>
      			</form>
      			<ul class="nav navbar-nav navbar-right">
        			<li><a href="ProfileServlet" ><span class="glyphicon glyphicon-user"></span> 
							<%=s %>
        			</a></li>
        			<li><a href="Logout.jsp" onclick="noBack()"><span class="glyphicon glyphicon-log-in"></span>Logout </a></li>
      			</ul>
			</div>	
		</div>
	</nav>
	<%
	if(s.equals("admin"))
	{
		ResultSet results = st.executeQuery("select * from register");
		
		while(results.next())
		{
			
		}
	}
	%>
</body>
</html>