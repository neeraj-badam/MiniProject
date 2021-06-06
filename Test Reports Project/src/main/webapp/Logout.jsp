<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Do you want to really logout</h1>
	<button value = "Yes"><a href="Logout">Yes</a></button>
	<script type="text/javascript"> 
		window.history.forward(); 
		function noBack() { 
			window.history.forward(); 
		} 
	</script> 
</body>
</html>