<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
	<style>
		.up{
       		margin-top:5%;
    	}
	</style>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
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
	%>
	<div class="container-fluid">
        <div class="row">
            <div class="col-2">
                <img src="cvrlogo.jpg" height="150px" align="left">
            </div>
            <div class="col-6">
                <center>
                	<b style="font-size:110%;">Cherabuddi Education Society's</b><br>
                    <b style="font-size:210%;font-weight:700;color:skyblue;">CVR COLLEGE OF ENGINEERING</b	>
                    <div id="w">
                        <b>(An UGC Autonomous Institute with NAAC 'A' Grade)</b><br>
                  
                    <b>Vastunagar</b>, Mangalpalli (V), Ibrahimpatnam (M),<br>
                        Rangareddy (D), Telangana 501 510<br>
                    </div>
                </center>
            </div>
        </div>
        <form action="Date.jsp">
        <div class="row up">
        	<div class="col-6 col-lg-6 col-sm-12" style="justify-content:space-around;">        	
					Enter the Date to get Identification :  
			</div>
			<div class="col-6 col-lg-6 col-sm-12" style="justify-content:space-around;">        	
					<input type="date" name="CubeDate" id="CubeDate" class="form-control" required>
			</div>
        </div>
        <div class="row" style='justify-content:space-around;'>
        	<div class="col-lg-6 col-sm-12">
        		<input type="submit" value="Submit" style="margin-top:20px" class="form-control btn btn-primary">
        	</div>
        </div>
        </form>
	</div>
</body>
</html>