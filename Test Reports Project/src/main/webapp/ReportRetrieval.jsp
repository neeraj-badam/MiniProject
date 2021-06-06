<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<style>
		.Container
		{
			margin : 50px;
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
   	System.out.println("users : ");
   	System.out.println(username);
   	if(username == null)
   	{
   		response.getWriter().println("<h6 class='text-white'>You are not authorised to view this page</h6>");
   		request.getRequestDispatcher("Login.jsp").forward(request, response);
   	}
	%>
	<div class="container">
		<form action="ReportsRetrieve">
			<div class="row">
            <div class="col-2">	
                <img src="cvrlogo.jpg" height="150px" align="left">
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
		<div class="Container">
			<div class="row">
				<div class="col-lg-6">
					Enter your reference ID : 
				</div>
				<div class="col-lg-6">
					<input type="text" id="reference" name="reference" class="form-control" required>
				</div>
			</div>
			<div class="row" style="margin:20px">
				<div class="col-lg126">
					<input type="submit" value="get Report" class="btn btn-primary btn-block">
				</div>
			</div>
		</div>
		</form>
	</div>
</body>
</html>