<%@ page language="java" import="java.util.*,java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Report</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <style>
    	input{
			size:10;
			width:150px;
    	}
    </style>
</head>
<body onload='createTable()'>
	<div class="container-fluid">
        <form action="Register2">
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
        <hr color="black">
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
			ResultSet rs = st.executeQuery("select * from users");
			int cnt=0;
			while(rs.next())
			{
				cnt++;
			}
			cnt++;
			String str;
			if(cnt < 10)
				str = "CVR/CED/CC/MT-2/HPC/2021-0"+cnt;
			else
				str = "CVR/CED/CC/MT-2/HPC/2021-"+cnt;
			HttpSession h = request.getSession();
			h.setAttribute("reference", str);
			String CubeDate=null;
			try{
				CubeDate = request.getParameter("CubeDate");
			}
			catch(Exception e)
			{
				e.printStackTrace();
				System.out.println("Entered date has no reports");
				out.print("Entered date has no reports");
				request.getRequestDispatcher("index.jsp").include(request, response);
			}
			
			Statement state = (Statement) con.createStatement();
			System.out.println(CubeDate);
			if(CubeDate == null)
			{
				request.getRequestDispatcher("index.jsp").include(request, response);
			}
			String d[] = CubeDate.split("-");
			String V = d[2]+"-"+d[1]+"-"+d[0];
			ResultSet results = state.executeQuery("select villa from register where date1 = '"+V+"'");
		%>
        <div class="row">
            <div class="col-lg-6">
                
                    <%= str %>
                
            </div>
            <div class="col-lg-6" style="float:right;">
                <center>
                    Date: <input type="date" id="date" name="date" readonly style=border:none;">
                </center>
            </div>
            <div class="col-lg-6" >
                <b>M/s. Haris Pranava Constructions Pvt. Ltd.,</b>
            </div>
            <div class="col-lg-12">
                Affluence Villas, Manneguda,
            </div>
            <div class="col-lg-12">
                Hyderabad.
            </div>
            <div class="col-lg-12" align="center" style="font-size: 20px;">
                <u><b>TEST REPORT ON CONCRETE CUBES</b></u>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-3">
                Source of the Sample
            </div>
            <div class="col-lg-6">
                : <b>M/s. Haris Pranava Constructions Pvt. Ltd.,</b>
            </div>
        </div>
		<div class="row">
            <div class="col-lg-3">
                No of Cubes Tested
            </div>
            <div class="col-lg-6">
                : <input type="number" id="cubes"  name="cubes" value='3' readonly required  size=30 style='width:300px'>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-3">
                Customer's Reference
            </div>
            <div class="col-lg-6">
                :  <input type="text" id="custref" name="custref" required size=30 style='width:300px'>
                	
            </div>
        </div>
        <div class="row">
            <div class="col-lg-3">
                Identification*
            </div>
             <div class="col-lg-6">
                :  <!-- input type="text" id="id" name="id" required-->  
                <%
                		LinkedHashSet<String> l = new LinkedHashSet<>();
                		out.print("<select id='id' name='id' style='height:30px;width:300px'>");
                		while(results.next())
        				{
                			String val = (String)results.getString(1);
                			l.add(val);
        					
        				}
                		ArrayList<String> al = new ArrayList<>();
                		al.addAll(l);
                		int size = l.size();
                		if(size == 0){
                			response.getWriter().println("No Identification is done on that day");
            				request.getRequestDispatcher("GenerateReport.jsp").forward(request, response);
            			}
                		for(int i=0;i<size;i++)
                		{
                			out.print("<option value='"+al.get(i)+"'>"+al.get(i)+"</option>");
                		}
                		out.print("</select>");
                	%>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-3">
                Material Received on
            </div>
             <div class="col-lg-6">
                :  <input type="date" id="material" name="material" value=<%= CubeDate %> readonly style="border:none;" required>  
            </div>
        </div>
         <div class="row">
            <div class="col-lg-3">
                Grade*
            </div>
             <div class="col-lg-6">
                :  <input type="text" id="grade" name="grade" value='M20' style="border:none;"  readonly required>  
            </div>
        </div>
         <div class="row">
            <div class="col-lg-3">
                Condition of Samples
            </div>
            <div class="col-lg-6">
                : <select id="condition" name="condition" style='height:30px;width:300px' required>
                    <option>Satisfactory</option>
                    <option>Unsatisfactory</option>
                  </select>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-3">
                Test Method
            </div>
             <div class="col-lg-6">
                :  <input type="text" list="cars" name="test"  size=30 style='width:300px' id="test">
						<datalist id="cars">
							<option>IS: 516-1959(Reaffirmed 2018)</option>
						</datalist>
            </div>
            <div class="col-lg-12">
                <br>
                <b>COMPRESSIVE STRENGTH:</b>
                <table class="table" border="1" id="myTable">
		
	</table>
            </div>
            <div class="col-lg-12" style="margin-top:10px;"><b><u>Note:</u></b><br>
	            1.The results relate only to the samples supplied and tested in the college laboratory.<br>
	            2.Reports shall not be reproduced,except in full,without the written approval of the Laboratory.<br>
	            3.Any corrections invalidate this report.<br>
	            4.Any query regarding the report must be raised immediately.<br>
	        </div>
      </div> 
        <div class="row" style="justify-content: space-around;">
            <div class="col-lg-3"></div>
            <div class="col-lg-6">
                <input type="submit" name="submit" class="form-control btn btn-primary btn-block text-white" id="submit">
            </div>
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
   			function age(){
            var date1 = document.getElementById("castdate");
            var date2 = document.getElementById("testdate");
            
            var str = date1.value.split("-");
            var year = str[0],month = str[1],day = str[2];
            var d1 = new Date(year,month-1,day);
            
            var str1 = date2.value.split("-");
            var year1 = str1[0],month1 = str1[1],day1 = str1[2];
            var d2 = new Date(year1,month1-1,day1);
            
            var Difference_In_Time = d2.getTime() - d1.getTime(); 
         	var Difference_In_Days = Difference_In_Time / (1000 * 3600 * 24); 
         	
         	document.getElementById("res").value=Difference_In_Days;
        }
   			function createTable()
   	        {
   	            rn = document.getElementById("cubes");
   	     
   	            rn = parseInt(rn.value);
   	            
   	            cn = 9;
   	            var table = "<thead>"+
   	            "<tr>"+
   	              '<th scope="col">Sl.<br>No</th>'+
   	              '<th scope="col"><center>Dimension of<br>Specimen(mm)</center></th>'+
   	              '<th scope="col"><center>Cross<br>Sectional<br>Area<br>(Sq.mm)</center></th>'+
   	              '<th scope="col"><center>Date of<br>Casting*</center></th>'+
   	              '<th scope="col"><center>Date of<br>testing</center></th>'+
   	              '<th scope="col"><center>Age<br>at<br>test</center></th>'+
   	              '<th scope="col">Weight<br>(Kg)</center></th>'+
   	              '<th scope="col">Failure<br>Load<br>(kN)</center></th>'+
   	              '<th scope="col">Compressive<br>strength<br>(N/mm<sup>2</sup>)</center></th>'+
   	            '</tr>'+
   	          "</thead>";
   	            var x = 0,y = 0,z = 0;
   	            for(var r = 0;r < rn;r++)
   	            {
   	                table += '<tr>';
   	                for(var c = 1;c<=cn;c++)
   	                {
   	                    var add = "";
   	                    if(x == 0 && c == 4)
   	                    {
   	                        add = "<td rowspan="+rn+">"+" <input type='Date' id='dateCast' onchange='Calculate()'s name='dateCast' required> "+"</td>";
   	                        x = 1;
   	                    }
   	                    else if(y == 0 && c == 5)
   	                    {
   	                        add = "<td rowspan="+rn+">"+" <input type='Date' id='datetest' name='datetest' required> "+"</td>";
   	                        y = 1;
   	                    }
   	                    else if(z == 0 && c == 6)
   	                    {
   	                        add = "<td rowspan="+rn+">"+" <select name='age' id='age' required onchange='Calculate()'><option value='7'>7<br>Days</option><option value='28'>28<br>Days</option></select>"+"</td>";
   	                        z = 1;
   	                    }
   	                    else
   	                    {
   	                        switch(c)
   	                        {
   	                            case 1 : add = "<td>"+(r+1)+"</td>";
   	                                     break;
   	                            case 2 : add = "<td>"+"<input type='number' required size='10' style='width:100px;' id='dimension"+r+"' name='dimension"+r+"' class='dimension"+r+"' onchange='Area()'> x <input type='number' size='10' style='width:100px;'  name='dimension"+r+"' class='dimension"+r+"' disabled> x <input type='number' size='10' style='width:100px;'  name='dimension"+r+"' class='dimension"+r+"' disabled>"+"</td>";
   	                                     break;
   	                            case 3 : add = "<td>"+"<input type='number' required name='area"+r+"' id='area"+r+"'>"+"</td>";
   	                                     break;
   	                            case 7 : add = "<td>"+"<input type='text' required name='weight"+r+"' id='weight"+r+"'>"+"</td>";
   	                                     break;
   	                            case 8 : add = "<td>"+"<input type='text' required name='failure"+r+"' onchange='CalculateCompressiveStrength()' id='failure"+r+"'>"+"</td>";
   	                                     break;
   	                            case 9 : add = "<td>"+"<input type='text' required name='strength"+r+"' onchange='Average()' id='strength"+r+"'>"+"</td>";
   	                                     break;
   	                        }
   	                    }
   	                    table += add;
   	                }
   	                table += '</tr>';
   	            }
   	         	AvgStrength = "<tr><td colspan='8' align='right'> <b> Average Compressive Strength </b> </td><td> <input type='text' name='avg' id='avg' required> </td></tr>"
   	            table += AvgStrength;
   	            document.getElementById("myTable").innerHTML = "<table border='2'>"+table+"</table>";
   	        }
   	        function Area()
   	        {
   	            
   	            dim = "dimension";
   	            a = "area"
   	            rows = document.getElementById("cubes");
   	            
   	            for(r=0;r<rows.value;r++)
   	            {
   	                dimensions = dim+r;
   	                areas = a + r;
   	                var ele = document.getElementsByClassName(dimensions);
   	                var area = document.getElementById(areas);
   	                
   	                for(var x = 0;x<ele.length;x++)
   	                {
   	                    ele[x].value = ele[0].value;
   	                }
   	                try{
   	                   area.value = ele[0].value*ele[0].value;
   	                }
   	                catch(err)
   	                {

   	                }
   	            }
   	        }
   	     
   	     function Calculate()
   	     {
   	    	var x = document.getElementById('dateCast');
   	    	var age = document.getElementById('age');
   	    	//console.log(age);
   	    	//age = age.value;
   	    	//console.log(age.value);
   	    	console.log(x.value);
   	    	var str = x.value.split("-");
            var year = str[0],month = str[1],day = str[2];
            var d = new Date(year,month-1,day);
            var date1 = addDays(d,parseInt(age.value));
            var month = date1.getMonth()+1;
            var dates = date1.getDate();
            mon = '';
            day = '';
            if(parseInt(month) < 10)
            	mon = '0'+month;
            else
            	mon = monthl
            if(parseInt(dates)< 10)
            	day = '0'+dates;
            else
            	day = dates
            var SevenDays = date1.getFullYear()+"-"+mon+"-"+day;
            console.log(SevenDays);
   	    	 var y = document.getElementById("datetest");
   	    	 y.value = SevenDays;
   	    	 
   	     }
   	  	function addDays(date, days) {
        	var result = new Date(date);
        	result.setDate(result.getDate() + days);
        	return result;
      	}
   	  	function CalculateCompressiveStrength()
   	  	{
   	  		console.log("hi");
   	  		rows = document.getElementById("cubes");
        	Avg = 0;
        	for(r=0;r<rows.value;r++)
        	{
        	    var area,ele;
            	row = "failure" + r;
            	are = "area"+r;
    	        try{
        	        ele =  document.getElementById(row);
        	        area =  document.getElementById(are);
            	}
	            catch(err)
    	        {
        	        console.log(err);
            	}
	            Val = ele.value * 1000 / area.value;
	            if(!Number.isNaN(Val) )
		            document.getElementById("strength"+r).value = Val.toFixed(2);
	            Avg += parseFloat(Val.toFixed(2));
            }
        	console.log(Avg+"<br>");
        	Avg = Avg/parseInt(rows.value);
        	console.log(Avg+"<br>");
            if(!Number.isNaN(Avg) )
                document.getElementById("avg").value = Avg.toFixed(2);
   	  	}
   	  	function Average()
   	  	{
   	  		rows = document.getElementById("cubes");
    		Avg = 0;
    		for(r=0;r<rows.value;r++)
    		{
    			var ele;
            	row = "strength" + r;
    	        try{
        	        ele =  document.getElementById(row);
            	}
	            catch(err)
    	        {
        	        console.log(err);
            	}
	            Val = parseFloat(ele.value);
	            Avg += parseFloat(Val.toFixed(2));
    		}
    		Avg = Avg/parseInt(rows.value);
        	console.log(Avg+"<br>");
            if(!Number.isNaN(Avg) )
                document.getElementById("avg").value = Avg.toFixed(2);
   	  	}
	</script>
</body>
</html>	