<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Page | Forgot Password</title>
 
	
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<title>forgot password</title>
<style>
.fp
{
border:2px solid black;
margin:30vh;
width:50vh;
padding-bottom:40px;
border-radius:5px;
}
.fc
{
width:46vh;
margin-left:-17vh;
border-radius:5px;
height:6vh;
}
#msg{

	background-color:rgb(37, 150, 190);
	color:#894B11 ;
	padding:5px;
	margin:5px 3px 0 3px;
	border-radius: 10px;
	font-size:25px;
	font-weigth:600;

}
</style>

	 
	
	</style>
</head>
<body>

	<%@include file="header.jsp"%>

	<center>
		<div class="fp">
		<%
		if (request.getAttribute("status") != null) {
		%>
		<div id="msg">
			<%=request.getAttribute("status")%></div>
		<%
		}
		%>
			<form method="POST" id="forgot" action="register">
				<font color="blue" size="4">
					<div class="p-4"></div>
					<h2>Forgot Password</h2>
					<p class="text-muted">Enter your email address</p>
					<div class="p-1"></div>
					<div class="container ">
						<div class="form-group col-md-4">
							<input type="email" class="fc" placeholder="abc@gmail.com" name="email">
						</div>
						<button type="submit" class="btn btn-primary" name="continue">continue</button>
			</form>
		</div>
	</center>




	<%@include file="footer.jsp"%>

</body>
</html>