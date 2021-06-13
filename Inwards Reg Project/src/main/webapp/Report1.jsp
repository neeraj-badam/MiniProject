<%@ page language="java" import="java.util.*,java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link href="http://db.onlinewebfonts.com/c/5c487f9119f25d34d6cd200608c39b02?family=CG+Omega" rel="stylesheet" type="text/css"/>
	<style>
		@page { size: auto;  margin: 0mm; }
		@import url(http://db.onlinewebfonts.com/c/5c487f9119f25d34d6cd200608c39b02?family=CG+Omega);
		@font-face {
			font-family: "CG Omega"; src: url("https://db.onlinewebfonts.com/t/5c487f9119f25d34d6cd200608c39b02.eot"); 
			src: url("http://db.onlinewebfonts.com/t/5c487f9119f25d34d6cd200608c39b02.eot?#iefix") format("embedded-opentype"),
			url("http://db.onlinewebfonts.com/t/5c487f9119f25d34d6cd200608c39b02.woff2") format("woff2"), 
			url("http://db.onlinewebfonts.com/t/5c487f9119f25d34d6cd200608c39b02.woff") format("woff"), 
			url("http://db.onlinewebfonts.com/t/5c487f9119f25d34d6cd200608c39b02.ttf") format("truetype"),
			url("http://db.onlinewebfonts.com/t/5c487f9119f25d34d6cd200608c39b02.svg#CG Omega") format("svg"); 
		}
		* {
			font-family: CG Omega;
 		 	box-sizing: border-box;
		}
		body{
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
		p,b,pre{
			margin:0;
		}
		@font-face{
		font-family:'CG Omega';
		src:url('C:\Users\USER\Downloads\cgor45w.ttf');
		font-style:normal;
		}
		td{
	        padding:8px;
	        margin:5px;
        }
	</style>
</head>
<body>
	<table>
		<tr>
			<td style="margin:0;padding:0;">
				<img src="Images/cvrlogo.jpg" height="125px" align="left">
			</td>
			<td style="margin:0;padding:0;">
                <center>
                    <p style="margin:0;padding:0;font-size:30px;"><b>CVR College of Engineering</b></p>	
                        <b>(An UGC Autonomous Institute)</b>
                    <br>
                    Vastunagar, Mangalpalli (V), Ibrahimpatnam (M),
                    <center class="tab4">
                        Rangareddy (D), Telangana 501 510
                    
                        <h4 ><b>Department of Civil Engineering</b></h4> 
                    </center>
                </center>
			</td>
			<td>
				<table border='1' style="margin-left:30px;float:right;">
					<tr>
						<td style="padding:3px;">Original Copy</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<%
		HttpSession h = request.getSession(false);
		String reference = (String) h.getAttribute("reference");
		String date = (String) h.getAttribute("date");
		String date1 = (String) h.getAttribute("date1");
		String grade = (String) h.getAttribute("grade");
		String con = (String) h.getAttribute("con");
		int cubes = (Integer) h.getAttribute("cubes");
		String date2 = (String) h.getAttribute("date2");
		String seven = (String) h.getAttribute("seven");
		String twenty = (String) h.getAttribute("twenty");
		String villa = (String) h.getAttribute("villa");
		String remarks = (String) h.getAttribute("remarks");
		String uname = (String)h.getAttribute("username");
		String companyName = (String)h.getAttribute("companyName");
		String companyAddress = (String)h.getAttribute("companyAddress");
		String companyLocation = (String)h.getAttribute("companyLocation");
		String investigatorName = (String)h.getAttribute("investigatorName");
		String investigatorDesignation = (String)h.getAttribute("investigatorDesignation");
		
		h.invalidate();
		HttpSession httpsession=request.getSession();
		httpsession.setAttribute("username", uname);
		System.out.println("Register in reports "+uname);
		if(httpsession == null)
		{
			response.getWriter().println("<h6 class='text-white'>You are not authorised to view this page</h6>");
			request.getRequestDispatcher("Login.jsp").forward(request, response);
		}
	%>
	<div id="textbox">
		<p class="alignleft">Ref. No: <%= reference%> </p>
		<p class="alignright">Date: <%= date%></p>
	</div>
	<div style="clear: both;"></div>
	<div>
		<b><%= companyName %>,</b>
		<p><%= companyAddress %>,</p>
		<p><%= companyLocation%>.</p>
	</div>
	<div>
		<center>
			<u><b>INWARD REGISTER FOR CONCRETE CUBES</b></u>
		</center>
		<table>
			<tr>
				<td style="margin:0;padding:0;">Cubes Received on    </td><td  style="margin:0;padding:0;">:  <%= date %></td>
			</tr>
			<tr>
				<td style="margin:0;padding:0;">Grade* 		     </td> <td style="margin:0;padding:0;">: <%= grade %></td>
			</tr>
			<tr>		
				<td style="margin:0;padding:0;">Condition of Samples  </td><td  style="margin:0;padding:0;">: <%= con %></td>
			</tr>
		</table>
	</div>
	<table border="1">
		  
		  <tr>
			<td>Sl.No</th>
			<td><center>No.of Cubes Received</center></th>
			<td><center>Date of Casting*</center></th>
			<td><center>7 days Test Date</center></th>
			<td><center>28 days Test Date</center></th>
			<td><center>Reference Villa No.*</center></th>
			<td>Remarks*</th>
		  </tr>
		
		<tr>
			<td>1</td>
			<td><center> <%= cubes %> </center>  </td>
			<td> <center>  <%= date2 %> </center>   </td>
			<td> <center> <%= seven %>  </center>  </td>
			<td> <center> <%= twenty %>  </center>  </td>
			<td> <center> <%= villa %>  </center>  </td>
			<td> <center> <%= remarks %>  </center>  </td>
		</tr>
	</table>
	<p>*As furnished by the customer</p>
	
	<br><br>
	<br><p>
		
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= investigatorName %><br>
			<%= investigatorDesignation %>
		
	</p><br>
	<hr>
	<table>
		<tr>
			<td style="margin:0;padding:0;">
				<img src="Images/cvrlogo.jpg" height="125px" align="left">
			</td>
			<td style="margin:0;padding:0;">
                <center>
                   <p style="margin:0;padding:0;font-size:30px;"><b>CVR College of Engineering</b></p>	
                    <center>
                        <b>(An UGC Autonomous Institute)</b>
                    </center>
                    Vastunagar, Mangalpalli (V), Ibrahimpatnam (M),
                    <center class="tab4">
                        Rangareddy (D), Telangana 501 510
                        <h4 ><b>Department of Civil Engineering</b></h4> 
                    </center>
                </center>
			</td>
			<td>
				<table border='1' style="margin-left:30px;float:right;">
					<tr>
						<td style="padding:3px;">Customer Copy</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<div id="textbox">
		<p class="alignleft">Ref. No: <%= reference%> </p>
		<p class="alignright">Date: <%= date%></p>
	</div>
	<div style="clear: both;"></div>
	<div>
		<b><%= companyName %>,</b>
		<p><%= companyAddress %>,</p>
		<p><%= companyLocation%>.</p>
	</div>
	<div>
		<center>
			<u><b>INWARD REGISTER FOR CONCRETE CUBES</b></u>
		</center>
		<table>
			<tr>
				<td style="margin:0;padding:0;">Cubes Received on    </td><td  style="margin:0;padding:0;">:  <%= date %></td>
			</tr>
			<tr>
				<td style="margin:0;padding:0;">Grade* 		     </td> <td style="margin:0;padding:0;">: <%= grade %></td>
			</tr>
			<tr>		
				<td style="margin:0;padding:0;">Condition of Samples  </td><td  style="margin:0;padding:0;">: <%= con %></td>
			</tr>
		</table>
	</div>
	<table border="1">
		
		  <tr>
			<td>Sl.No</th>
			<td><center>No.of Cubes Received</center></th>
			<td><center>Date of Casting*</center></th>
			<td><center>7 days Test Date</center></th>
			<td><center>28 days Test Date</center></th>
			<td><center>Reference Villa No.*</center></th>
			<td>Remarks*</th>
		  </tr>
		
		<tr>
			<td>1</td>
			<td><center> <%= cubes %> </center>  </td>
			<td> <center>  <%= date2 %> </center>   </td>
			<td> <center> <%= seven %>  </center>  </td>
			<td> <center> <%= twenty %>  </center>  </td>
			<td> <center> <%= villa %>  </center>  </td>
			<td> <center> <%= remarks %>  </center>  </td>
		</tr>
	</table>
	<p>*As furnished by the customer</p>
	
	<br><br>
	<br><p>
		
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= investigatorName %><br>
			<%= investigatorDesignation %>
		
	</p><br>
	<input type="button" id="btnprint" value="Print this Page" onclick="print_page()" />
	
	
	<script type="text/javascript">
        function print_page() {
            var ButtonControl = document.getElementById("btnprint");
            ButtonControl.style.visibility = "hidden";
            window.print();
        }
    </script>
</body>
</html>