<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Page | change</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.min.js"></script>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<title>New Password</title>
<style>



.c1 {
	border: 2px solid black;
	width: 46vh;
	height: 50vh;
	margin-top: 25vh;
	margin-left: 80vh;
}

.form-control {
	width: 40vh;
	margin-left: -15vh;
	margin-bottom: 5vh;
}
#msg{

	background-color:rgb(37, 150, 190);
	color:#C70039 ;
	padding:5px;
	margin:5px 3px 0 3px;
	border-radius: 10px;
	font-size:25px;

}
</style>

</head>
<body>

<script>
		jQuery.validator.addMethod("checkemail", function(value, element) {
		return/^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(value)|| /^[0-9]{10}$/.test(value);}, "Please enter the email format as abc@gmail.com");
		
		jQuery(document).ready(function($) {
			$("#change").validate({
				rules: {
					pwd: {
						required: true,
						minlength: 6
					},
					cp: {
						required: true,
						minlength: 6,
						equalTO:"#pwd"
					}
					
				},
				messages: {
					pwd: {
						required: "Please enter the password.",
						minlength: "Please enter the password greater than or equal to 6."
					},
					cp: {
						required: "Please enter the password.",
						minlength: "Please enter the password greater than or equal to 6.",
						equalTo: "mismatch password"
					},
		 	   }
			});
		});
	</script>

	<%@include file="header.jsp"%>

	<div class="c1">
		<center>
			<%
			if (request.getAttribute("status") != null) {
			%>
			<div id="msg">
				<%=request.getAttribute("status")%></div>
			<%
			}
			%>
			<form method="POST" id="change" action="register">
				<font color="blue" size="4">
					<div class="p-4"></div>
					<h2>New Password</h2>
					<div class="p-1"></div>
					<div class="container ">
						<div class="form-group col-md-4">
							<input type="password" class="form-control"
								placeholder="create new password" name="pwd">
						</div>
					</div>
					<div class="container ">
						<div class="form-group col-md-4">
							<input type="password" class="form-control"
								placeholder="confirm your password" name="cp">
						</div>
					</div>
					<button type="submit" class="btn btn-primary" name="change">change</button>
			</form>
		</center>
	</div>
	<%@include file="footer.jsp"%>

</body>
</html>