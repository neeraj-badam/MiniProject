<%@ page language="java" import="java.util.*,java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Report</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <style>
    	
        .col-2,.col-6{
            margin-top: 5px;
        }
        
    </style> 
</head>
<body onload="Dates()">
	<div class="container">
        <form action="Register" onsubmit="return Fun()">
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
    	    String ref = "";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root");
			Statement st = (Statement) con.createStatement();
			ResultSet rs = st.executeQuery("select * from register");
			int cnt=0;
			while(rs.next())
			{
				cnt++;
			}
			cnt++; 
			//int cnt=0;
			String str;
			if(cnt < 10)
			 	str = "CVR/CED/CW/2021/HPC/0"+cnt;
			else
				str = "CVR/CED/CW/2021/HPC/"+cnt;
		%>
        <div class="row">
            <div class="col-lg-6" id="Reference" name="Reference">
                Ref. No: <%=str%>
            </div>     
            <div class="col-lg-6">
                <center>
                    Date: <input type="date" id="date" name="date" max="" onchange="Dates()">
                </center>
            </div>
            <div class="col-lg-12">
                <b>M/s. Haris Pranava Constructions Pvt. Ltd.,</b>
            </div>
            <div class="col-lg-12">
                Affluence Villas, Manneguda,
            </div>
            <div class="col-lg-12">
                Hyderabad.
            </div>
            <div class="col-lg-12" align="center" style="font-size: 20px;">
                <u><b>INWARD REGISTER FOR CONCRETE CUBES</b></u>
            </div>
            <div class="col-lg-3">
                Cubes Received on
            </div>
            <div class="col-lg-6">
                : <input type="date" id="date1"  name="date1" autocomplete="off" style="border:none" readonly required>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-3">
                Grade*
            </div>
            <div class="col-lg-6">
                :  <input type="text" id="grade" value="M20" name="grade" style="border:none"  autocomplete="off" readonly>  
            </div>
        </div>
        <div class="row">
            <div class="col-lg-3">
                Condition of Samples
            </div>
            <div class="col-lg-6">
                : <select id="condition" name="condition" autocomplete="off" required>
                    <option>Satisfactory</option>
                    <option>Unsatisfactory</option>
                  </select>
            </div>
            <div class="col-lg-12">
                <br>
                <table class="table table-bordered" border="5">
                    <thead>
                      <tr>
                        <td scope="col">Sl.No</th>
                        <td scope="col"><center>No.of Cubes<br>Received</center></th>
                        <td scope="col"><center>Date of<br>Casting*</center></th>
                        <td scope="col"><center>7 days Test<br>Date</center></th>
                        <td scope="col"><center>28 days Test<br>Date</center></th>
                        <td scope="col"><center>Reference Villa<br>No.*</center></th>
                        <td scope="col">Remarks*</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td scope="row">1</th>
                        <td>
                        	
                         	<select id="cubes" name="cubes" required>
                         		<option value="3">3</option>
                         		<option value="6">6</option>
                         	</select>
                        </td>
                        <td> <input type="date" id="date2" name="date2"  onchange="Register()"   autocomplete="off" required>   </td>
                        <td> <input type="text" id="Seven" name="Seven" autocomplete="off" required readonly>  </td>
                        <td> <input type="text" id="twentyEight" name="twentyEight" autocomplete="off" required readonly> </td>
                        <td> <input type="text" id="villa" name="villa" autocomplete="off" value="Villa" required> </td>
                        <td> <textarea cols="15" rows="5" id="remarks" name="remarks" autocomplete="off" ></textarea> </td>
                      </tr>
                    </tbody>
                </table>
            </div>
            <div class="col-lg-12">*As furnished by the customer</div>
            <div class="col-lg-12" style="margin-top:10px;">For CVR COLLEGE OF ENGINEERING</div>
        </div> 
        <div class="row" style="justify-content: space-around;">
            <div class="col-lg-3"></div>
            <div class="col-lg-6">
                <input type="submit" value="Generate Report" name="submit" class="form-control btn btn-primary btn-block text-white" id="submit">
            </div>
        </div>
        <div class="row" style="justify-content: space-around;">
        	Do you want to see your report ? <a href="Report.jsp">Report</a>
        </div>
        </form>
	</div>
    <script type="text/javascript">
    let d = new Date();
    let m = d.getMonth()+1;
    let x = new String(m);
	if(x.length == 1)
		x = "0"+ x;
	m = d.getDate();
	let y = new String(m);
	if(y.length == 1)
		y = "0"+ y;
	document.getElementById("date").value = d.getFullYear()+"-"+x+"-"+y;
	document.getElementById("date").max=document.getElementById("date").value;
   		function Register()
   		{
			var reference = document.getElementById("Reference");
            var date1 = document.getElementById("date2");
            var str = date1.value.split("-");
            var year = str[0],month = str[1],day = str[2];
            var d = new Date(year,month-1,day);
            var date1 = addDays(d,7);
            var date2 = addDays(d,28);
            var SevenDays = date1.getDate()+"-"+(date1.getMonth()+1)+"-"+date1.getFullYear();
            var twentyEightDays = date2.getDate()+"-"+(date2.getMonth()+1)+"-"+date2.getFullYear();
            document.getElementById("Seven").value = SevenDays;
            document.getElementById("twentyEight").value = twentyEightDays;
            reference.value = reference.innerText;
        }
        function addDays(date, days) {
            var result = new Date(date);
            result.setDate(result.getDate() + days);
            return result;
        }
        function Fun()
        {
        	var date1 = document.getElementById("date1").value;
        	if(date1.trim().length == 0)
        		return false;
        	return true;
        }
        function Dates()
        {
        	document.getElementById("date1").value = document.getElementById("date").value;	
        }
	</script>
</body>
</html>	