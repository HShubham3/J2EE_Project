<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>login here</title>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.min.js"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
	<style>
		.error {
			color: red;
		}
		
		.button {
			padding: 5px;
			width: 6%;
			background: cornflowerblue;
			color: white;
		}
		
		#msg {
			background: green;
			color: black;
			border: 1px solid green;
			width: 24%;
			font-weight: bold;
			font-size: 25px;
			padding: 5px;
		}
		
		td input {
			display: block;
		}
	</style>
</head>
<body>

	<script>
		jQuery.validator.addMethod("checkemail", function(value, element) {
		return/^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(value)|| /^[0-9]{10}$/.test(value);}, "Please enter the email format as abc@gmail.com");
		
		jQuery(document).ready(function($) {
			$("#login").validate({
				rules: {
					email: {
						required: true,
						checkemail: true
					},
					pw: {
						required: true,
						minlength: 6
					}
				},
				messages: {
					email: {
						required: "Please enter the email.",
					},
					pw: {
						required: "Please enter the password.",
						minlength: "Please enter the password greater than or equal to 6."
					},
		 	   }
			});
		});
	</script>


<center>8
	<%
	if (request.getAttribute("status") != null) {
	%>
	<div id="msg" class="form-group col-md-4">
		<%=request.getAttribute("status")%></div>
	<%
	}
	%>
	
	<form method="POST" id="login" action="register">
		<font color="blue" size="4">
			<h2 class="form-group col-md-4">Login</h2>
		</font> <br>
		<div class="container ">
			<div class="form-group col-md-4">
				<label>Email address</label> <input type="email" class="form-control" placeholder="Enter email" name="email">
			</div>
			<div class="form-group col-md-4">
				<label>Password</label> <input type="password" class="form-control" placeholder="Enter Password" name="pw">
			</div>
			<button type="submit" class="btn btn-primary" name="login">Submit</button>
			<div style="text-align: center; margin-top: 15px;">
				<a href="forgotpass.jsp">Forgot password?</a>
			</div>
		</div>
	</form>
</center>
</body>
</html>