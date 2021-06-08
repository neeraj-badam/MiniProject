<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rate itt</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
  body{
  	background: url("https://images.unsplash.com/photo-1565626424178-c699f6601afd?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8Y29uY3JldGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80") no-repeat ;
  	background-size:cover;
  		background-attachment:fixed;
  	width:100%;
  }
  row{
  	height:10%;
  }
  img{
  	width:90%;
  	height:70%;
  }
  .col-lg-3{
	  margin-left:3%;
	  margin-right:3%;
	  margin-bottom:2%;
	  margin-top:2%;
	  height:10%;
  }
  a{
  color:white;
  font-size:25px;
  }

  </style>
</head>
<body>
		<% 
      				HttpSession hp = request.getSession(false);
      				String s = (String)hp.getAttribute("username"),n = "Logout"; 
      				String href = "Profile.jsp",hre = "Logout.jsp";
      				if(s == null){
      					s = "Sign up";
      					n = "Login";
      					href ="Register.jsp";
      					hre = "Login.jsp";
      				}
      				String generate = "";
      				if(s.equals("admin"))
      				{
      					generate = "<li><a href='GenerateReport.jsp'>GenerateReport</a></li>"+"<li><a href='PrintReport.jsp'>PrintReport</a></li>";
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
        				<li class="active"><a href="index.jsp">Home</a></li>
        				<%= generate %>
      				</ul>
      			</form>
      			<ul class="nav navbar-nav navbar-right">
        			<li><a href=<%=href %> ><span class="glyphicon glyphicon-user"></span> 
							<%=s %>
        			</a></li>
        			<li><a href=<%=hre %>><span class="glyphicon glyphicon-log-in"></span><%=n %>  </a></li>
      			</ul>
			</div>	
		</div>
	</nav>
</body>
</html>