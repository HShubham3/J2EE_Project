 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.min.js"></script>

<style>
	.error{
	color:red;
	}
	input{
	display: block;
	}
	#msg
	{
	background: red;
	color:black;
	border: 1px solid red;
	width:24%;
	font-weight: bold;
	font-size: 25px;
	padding: 5px;
	}
	</style>
	
</head>

<body>

<script type="text/javascript">
	jQuery.validator.addMethod("checkemail", function(value, element) {
	    return /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(value) || /^[0-9]{10}$/.test(value);
	});
	jQuery(document).ready(function($) {
		$("#signup").validate({
		 
			rules: {
				name: {
					required: true
				},
				email: {
					required: true,
					checkemail: true
				},
				phone: {
					required: true,
					minlength: 10,
					maxlength: 10
				},
				pw: {
					required: true,
					minlength: 6
				},
				cp: {
					required: true,
					minlength: 6,
					equalTo: "#pw"
				}
			},
			messages: {
				
				name: {
					required: "Please enter the name."
				},
				email: {
					required: "Please enter the email.",
					email: "Please enter valid email id"
				},
				phone: {
					required: "Please enter the number.",
					minlength: "Please enter the 10 digit number .",
					maxlength: "more than 10 digits."
				},
				pw: {
					required: "Please enter the password.",
					minlength: "Please enter the password greater than or equal to 6.",
				},
				cp: {
					required: "Please reenter the password.",
					minlength: "Please enter the password greater than or equal to 6.",
					equal To: "mismatch password"
				}
			}
		});
	});
	</script>


	<center>
		<br>
		<br>
		
		<%
		if (request.getAttribute("status") != null) {
		%>
		<div id="msg">
			<%=request.getAttribute("status")%></div>
		<%
		}
		%>
		
		<form method="POST" id="signup" action="register">
			<font color="green">
				<h2>Sookshmas Registration Form</h2>
			</font>
			<table>
				<tr>
					<td>NAME</td>
					<td><input type="text" id="name" name="name"></td>
				</tr>
				<tr>
					<td>PHONE NUMBER</td>
					<td><input type="number" name="phone"></td>
				</tr>
				<tr>
					<td>Email</td>
					<td><input type="email" name="email"></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="password" id="pw" name="pw"></td>
				</tr>
				<tr>
					<td>Confirm Password</td>
					<td><input type="password" name="cp"></td>
				</tr>
				<tr>
					<td></br> <input type="submit" name="register" value="Register"></td>
				</tr>
			</table>
		</form>

	</center>

</body>
</html>