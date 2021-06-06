<%@ page language="java"  import="java.util.*,java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
	<link href="http://db.onlinewebfonts.com/c/5c487f9119f25d34d6cd200608c39b02?family=CG+Omega" rel="stylesheet" type="text/css"/>
	<!-- link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"-->
	<style>
	@import url(http://db.onlinewebfonts.com/c/5c487f9119f25d34d6cd200608c39b02?family=CG+Omega);
		@font-face {
			font-family: "CG Omega"; src: url("https://db.onlinewebfonts.com/t/5c487f9119f25d34d6cd200608c39b02.eot"); 
			src: url("http://db.onlinewebfonts.com/t/5c487f9119f25d34d6cd200608c39b02.eot?#iefix") format("embedded-opentype"),
			url("http://db.onlinewebfonts.com/t/5c487f9119f25d34d6cd200608c39b02.woff2") format("woff2"), 
			url("http://db.onlinewebfonts.com/t/5c487f9119f25d34d6cd200608c39b02.woff") format("woff"), 
			url("http://db.onlinewebfonts.com/t/5c487f9119f25d34d6cd200608c39b02.ttf") format("truetype"),
			url("http://db.onlinewebfonts.com/t/5c487f9119f25d34d6cd200608c39b02.svg#CG Omega") format("svg"); 
		}
		@page { size: auto;  margin: 0mm; }
		* {
 		 	box-sizing: border-box;
		}
		body{
			margin-top:0;
			padding-top:0;
			margin-left: 10%;
			margin-right: 5%;
			padding: 0;
		}
		#Header{
			margin-left: 10%;
		}
		.alignleft {
			float: left;
		}
		.alignright {
			float: right;
		}
		table
		{
			border-collapse: collapse;
			margin:0;
		}
		p,pre{
			margin:0;
		}
		h1{
			font-size: 35px;
			margin:0;
		}
		h3{
			margin:0;
		}
		a{
			color:#00BFFF;
		}
		.alignleft {
			float: left;
		}
		.alignright {
			float: right;
			margin-right:70px;
		}
		td{
			padding:7px;
		}
		*{
			font-family: CG Omega;
		}
	</style>
</head>
<body>
	<table style='margin:0px'>
		<tr>
			<td>
				<center>
					<img src="cvrlogo.jpg" height="100px" align="left">
				</center>
				</td>
			<td>
				
                <center>
                <br><br>
                <h3>Cherabuddi Education Society's</h3>
                    <h1 style="margin:0;padding:0;color:#00BFFF;">CVR COLLEGE OF ENGINEERING</h1>
                        (An UGC Autonomous Institute with NAAC 'A' Grade)
                    
                      <br><small>(Approved by AICTE & Government of Telangana and affiliated to JNTU,Hyderabad)</small>
                    
                    <b>Vastunagar</b>, Mangalpalli (V), Ibrahimpatnam (M),<br>
                        Web : <a href="http://cvr.ac.in">http://cvr.ac.in,</a>email : <a>principal@cvr.ac.in</a><br>
                    <center class="tab4">
                        STD Code : 08414 General : 661601 / 661674 / 661675
                    </center>
                
			</center></td>
		</tr>
	</table>
	<hr>
	<br>
	<% 
		HttpSession hp = request.getSession(false);
		String reference = (String) hp.getAttribute("reference");
		String date = (String) hp.getAttribute("date");
		int cubes = (Integer)hp.getAttribute("cubes");
		String custref = (String) hp.getAttribute("custref");
		String id = (String) hp.getAttribute("id");
		String material = (String) hp.getAttribute("material");
		String grade = (String) hp.getAttribute("grade");
		String condition = (String) hp.getAttribute("condition");
		String test = (String) hp.getAttribute("test");
		String castdate = (String) hp.getAttribute("castdate");
		String testdate = (String) hp.getAttribute("testdate");
		String average = (String) hp.getAttribute("average");
		String age = (String) hp.getAttribute("age");
		String cubeP =  "03(Three only)";
	%>
	<div id="textbox">
		<p class="alignleft">Report No: <%= reference  %> </p>
		<p class="alignright">Date: <%= date %></p>
	</div>
	<div style="clear: both;"></div>
	<b>M/s. Haris Pranava Constructions Pvt. Ltd.,</b><br>
	 Affluence Villas, Manneguda,<br>
	 Hyderabad.
	 <center> <u><b>TEST REPORT ON CONCRETE CUBES</b></u> </center><br>
	 <table>
	 	<tr>
			<td style="padding:0;">Source of the Sample</td><td style="padding:0;"> : M/s. Haris Pranava Constructions Pvt. Ltd.,  </td>
		</tr>
		<tr>
			<td style="padding:0;">No. of Cubes Tested </td><td style="padding:0;"> : <%= cubeP  %> </td>
		</tr>
		<tr>
			<td style="padding:0;">Customer's Reference </td><td style="padding:0;">: <%= custref %> </td>
		</tr>
		<tr>
		 	<td style="padding:0;">Identification*     </td><td style="padding:0;"> : <%= id %> </td>
		 </tr>
		<tr>
			<td style="padding:0;">Material Received on </td><td style="padding:0;">: <%= material %> </td>
		</tr>
		<tr>
			<td style="padding:0;">Grade*		     </td><td style="padding:0;">: <%= grade %>  </td>
		</tr>
		<tr>
			<td style="padding:0;">Condition of Samples </td><td style="padding:0;">: <%= condition %>   </td>
		</tr>
		 <tr>
		 	<td style="padding:0;">Test Method	     </td><td style="padding:0;">: <%=test %>  </td>
		 </tr>
	 </table>
	 <b>COMPRESSIVE STREGNTH</b>
	 <%
	 	out.print("<table border='1'>");
	 	out.print("<tr>"+
 	              "<th scope='col'>Sl.<br>No</th>"+
 	              "<th scope='col'><center>Dimension of<br>Specimen(mm)</center></th>"+
 	              "<th scope='col'><center>Cross<br>Sectional<br>Area<br>(Sq.mm)</center></th>"+
 	              "<th scope='col'><center>Date of<br>Casting*</center></th>"+
 	              "<th scope='col'><center>Date of<br>testing</center></th>"+
 	              "<th scope='col'><center>Age<br>at<br>test</center></th>"+
 	              "<th scope='col'>Weight<br>(Kg)</center></th>"+
 	              "<th scope='col'>Failure<br>Load<br>(kN)</center></th>"+
 	              "<th scope='col'>Compressive<br>strength<br>(N/mm<sup>2</sup>)</center></th>"+
 	              "</tr>");
	 			  int x = 0;
	 			  for(int i=0;i<cubes;i++)
	 			  {
	 				 String str1 = (String) hp.getAttribute("cube"+i);
	 				String str2 = (String) hp.getAttribute("cross"+i);
	 				String str3 = (String) hp.getAttribute("weight"+i);
	 				String str4 = (String) hp.getAttribute("failure"+i);
	 				String str5 = (String) hp.getAttribute("compressive"+i);
	 				String cube = str1 + " x "+str1 + " x "+str1;
	 				out.print("<tr  height='30px'>");
	 				if(i == 0)
	 				{
			 			 out.print("<td><center>"+(i+1)+"</center></td>");
			 			 out.print("<td><center>"+cube+"</center></td>");
			 			 out.print("<td><center>"+str2+"</center></td>");
			 			 out.print("<td rowspan = "+cubes+">"+castdate+"</center></td>");
			 			 out.print("<td rowspan = "+cubes+">"+testdate+"</center></td>");
			 			out.print("<td rowspan = "+cubes+">"+age+"<br>Days"+"</center></td>");
			 			 out.print("<td><center>"+str3+"</center></td>");
			 			 out.print("<td><center>"+str4+"</center></td>");
  			 			 out.print("<td><center>"+str5+"</center></td>");
	 				}
	 				else
	 				{
	 					out.print("<td><center>"+(i+1)+"</center></td>");
			 			out.print("<td><center>"+cube+"</center></td>");
			 			out.print("<td><center>"+str2+"</center></td>");
			 			out.print("<td><center>"+str3+"</center></td>");
			 			out.print("<td><center>"+str4+"</center></td>");
 			 			out.print("<td><center>"+str5+"</center></td>");
	 				}
	 				out.print("</tr>");
	 			  }
	 			  out.print("<tr height='30px'>");
	 			  out.print("<td colspan='8' align='right'> <b> Average Compressive Strength </b> </center></td>");
	 			  out.print("<td><center>"+average+"</center></td>");
	    		  out.print("</tr>");
		out.print("</table>");
		HttpSession httpsession=request.getSession(false);  
		System.out.println(httpsession.getAttribute("username"));
	   	if(httpsession == null)
	   	{
	   		request.getRequestDispatcher("Login.jsp").forward(request, response);
	   	}
	   	String username = (String)httpsession.getAttribute("username");
	   	if(username == null)
	   	{
	   		request.getRequestDispatcher("Login.jsp").forward(request, response);
	   	}
		
	   	Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root");
		
		hp.invalidate();
		HttpSession newSession =request.getSession();
		newSession.setAttribute("username",username);
	 %>
	 <br>
	 
	 <p>
	 	     <b>Note:</b>	1.The results relate only to the samples supplied and tested in the college laboratory.<br>
	            &nbsp &nbsp &nbsp &nbsp  &nbsp   2.Reports shall not be reproduced,except in full,without the written approval of the<br> &nbsp  &nbsp  &nbsp  &nbsp &nbsp Laboratory.<br>
	           &nbsp &nbsp &nbsp  &nbsp  &nbsp  3.Any corrections invalidate this report.<br>
	           &nbsp &nbsp &nbsp  &nbsp &nbsp   4.Any query regarding the report must be raised immediately.<br>
	 <p>
	 <br><br><br><br><br>
	 <div id="textbox">
		<div class="alignleft">
			<center>
				Mr. M Vamsi<br>
				Principal Investigator
			</center>
		</div>
		<div class="alignright">
			<center>Head of the Department<br>Civil Engineering</center>
		</div>
	 </div>
	 <br><br><br>
	 <hr style="height:2px;">
	 <center>
	 <small>City Office : # 201 & 202, H.No. 3-6-520,Ashoka Scintilla, Opp. Malabar Gold & Diamonds, Himayat Nagar, </small>
	 <br>Hyderabad - 500 029. Phone : 040 - 42204001, 42204002 Fax : 040 - 42204003
	 </center>
	 <input type="button" id="btnprint" value="Print this Page" onclick="print_page()" class="alignright" style="margin-right:50%;width:150px;height:40px;background:#00BFFF;color:white;" />
	<script type="text/javascript">
        function print_page() {
            var ButtonControl = document.getElementById("btnprint");
            ButtonControl.style.visibility = "hidden";
            window.print();
        }
    </script>
</body>
</html>