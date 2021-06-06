<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
	form{	
		margin-top:20vh;
		margin-bottom:8vh;
		margin-left:1vw;
		margin-right:20vw;
		align-content: center;
		background-size: cover;
		background-repeat: no-repeat;
		background-color:transparent;
		box-shadow: 10px 8px 8px 8px #b4c7ac33, 10px 10px 10px 10px rgba(170, 185, 172, 0.945);
		}
	button{
		background-color:red;
	}
	img{
		margin-left:2vw;
	}
	body{
		background-size: cover;
		background-image:url("Images/log.jpg");
		background-repeat : no-repeat;		
        background-attachment: fixed;
	}
	a{
		color:white;
	}
	h2{
		margin-bottom: 80px;
	}
	</style>
<title>Login</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<form action="LoginServlet" method="GET" onsubmit="return Function()">
				<br>
				<h2 align="center" class="col-md-12"><B style="color:rgb(252, 251, 248);font-family: Times New Roman Times, serif";>LOG IN</B></h2>
				<div class="col-md-12 col-lg-12">
					<div class="input-group from-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fa fa-user"></i></span>
						</div>
						<input type="text" name="username" id="username" class="form-control"style="opacity:100;" placeholder="user name" required>
					</div>
				</div><br>
				<div class="col-md-12 col-lg-12">
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fa fa-lock"></i></span>
						</div>
						<input type="password" name="password" id="password" class="form-control" placeholder="Enter password" required>
					</div>
				</div><br>
		    	<div class="col-md-12 col-lg-12">
					<input type="submit" name="submit" class="form-control btn btn-primary btn-block text-white" id="Login" value="Login">
				</div>
				<div class="col-md-12 col-lg-12">
					<h3><a href="Forgot.jsp">Forgot Password?</a></h3>
				</div>
				<div class="col-12"><b style="color:white;">Don't have an account? <button class="btn btn-danger"><a href="Register.jsp" >Register</a></button></b></div><br>
				<div class="col-12" id="message" style="background-color:black;color:blue;visibility: hidden;"></div>
			</div>
		</form>
	</div>
	</div>
	<script>
		function Function()
		{
			var username = document.getElementById('username');
			if(username.value == "admin")
				return true;
			console.log(username.value);
			var password = document.getElementById('password');
			var message= document.getElementById('message');
        	var n = /[0-9]/.test(username.value);
        	var cap = /[A-Z]/.test(username.value);   
        	if(n && cap)
        	{
        	    message.style.visibility="hidden";
        	}
        	else if(username.value.length<8)
        	{
        	    if(username.value == "")
            	{
            	    message.innerHTML = "Username must not be empty";
            	}
            	else{
            	    message.innerHTML = "Username should be atleast 8 letters";
            	}
            	message.style.visibility="visible";
            	message.style.color="#00FFFF";
            	message.style.background.color="black";
            	return false;
        	}
        	else 
        	{ 
        	    message.innerHTML = "Username should consist a capital letter and a number";
            	message.style.visibility="visible";
            	message.style.color="#00FFFF";
            	message.style.background.color="black";
            	return false;
	        }
    	    if(password.value.length < 8)
        	{
            	message.innerHTML = "password must be atleast 8 letters";
            	message.style.visibility="visible";
	            message.style.color="#00FFFF";
    	        message.style.background.color="black";
        	    return false;
        	}
        	return true;
		}
	</script>
</body>
</html>