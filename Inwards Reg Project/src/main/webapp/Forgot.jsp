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
			<form action="ChangePassword">
				<br>
				<h2 align="center" class="col-md-12"><B style="color:rgb(252, 251, 248);font-family: Times New Roman Times, serif";>Forgot Password</B></h2>
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
						<input type="number" name="recovery" id="recovery" class="form-control" placeholder="Enter a recovery Code" required>
					</div>
				</div>
				<div class="col-md-12 col-lg-12">
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fa fa-lock"></i></span>
						</div>
						<input type="password" name="password" id="password" class="form-control" placeholder="Enter new password" required>
					</div>
				</div><br>
		    	<div class="col-md-12 col-lg-12">
					<input type="submit" name="submit" class="form-control btn btn-primary btn-block text-white" value="Update Password">
				</div>
			</div>
		</form>
	</div>
	</div>
</body>
</html>