<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Test Reports</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body{
            background-image : url("https://image.freepik.com/free-vector/restaurant-mural-wallpaper_52683-47493.jpg");
            background-size: cover;
            background-attachment: fixed;
            align-items: center;
        }
        .form-control:active,
        .form-control:focus,
            .form-control:focus:active {
                background-color: white!important;
                border-color: white;
                color: white;
            }
        h1{
            color: black;
            text-align: center;
        }
        label{
            color:white;
        }
        .container{
            position: absolute;
            top: 50%;
            left: 50%;
            border:none;
            width:80%;
            border-radius: 10px;
            box-shadow: 0px 0px 50px 0px #000;
            transform: translate(-50%,-50%);
        }
        .container .input-group{
            position: relative;
        }
        .container .input-group input{
            width: 100%;
            font-size: 16px;
            letter-spacing: 1px;
            margin-bottom: 30px;
            border:none;
            outline:none;
            background: transparent;
        }
        .container .input-group label{
            position: absolute;
            top:0;
            left:10;
            font-size: 16px;
            transition: 0.5s;
        }
        #submit
        {
            border:#000;
            outline:auto;
            background:red;
            border-bottom:1px solid white;
        }
        .container .input-group input:focus~label,
        .container .input-group input:valid~label{
            top : -30px;
            left : 10px;
            color:#87CEEB;
        }
        a{
        color:blue;
        }
    </style>
</head>
<body>	
	<form action="RegistrationServlet" method="post" onsubmit="return Function()">
    <center>
        <h1 style="color:whitesmoke;margin: 10px;"><b> SIGN UP</b></h1>
    </center>
    <div class="container">
            <div class="row">
                <div class="col-lg-12 input-group">
                    <input type="text" name="username" id="username" style="color:greenyellow;" required class="form-control">
                    <label>Username</label>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 input-group">
                    <input type="text" name="name" id="name" style="color:greenyellow;" required class="form-control">
                    <label>Name</label>
                </div>
            </div>
            <div class="row">
                    <div class="col-lg-12 input-group">
                        <input type="email" name="email" id="email" style="color:greenyellow;" required class="form-control">
                        <label>Email</label>
                    </div>
            </div>
            <div class="row">
                    <div class="col-lg-12 input-group">
                        <input type="password" name="password" id="password" style="color:greenyellow;" required class="form-control">
                        <label>password</label>
                    </div>
            </div>
             <div class="row" style="justify-content: space-around;">
                <div class="col-lg-6 input-group">
                    <input type="submit" name="submit" class="form-control btn btn-block btn-danger" id="submit">
                </div>
            </div>
            <div class="row" >
                <div class="col-6">
               		<h2 style="color:white;">Already have an account? <button class="btn btn-secondary"><a class="text-white" href="Login.jsp">Login</a></button> </h2>
                </div>
            </div>
            <div class="row" >
                <div class="col-6" id="message" style="background-color:black;color:blue;visibility: hidden;"></div>
            </div>
    </div>
</form>
<script>
    function Function()
    {
        var username = document.getElementById('username');
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