<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Page | Forgot Password</title>
 
	
	<style>
	 
	 body{
	 
	 margin:0;
	 padding:0;
	 
	 }
	
	 .container{
	 
	 margin:200px 600px;
	 
	 }
	 
	 #msg{
	 
	 background-color:green;
	 color:#fff;
	 
	 }
	 
	
	</style>
</head>
<body>

	<%@include file="header.jsp"%>

	<div class="container">
	
	   	<%
	    if (request.getAttribute("status") != null) {
		%>
		<div id="msg" class="form-group col-md-4">
			<%=request.getAttribute("status")%></div>
		<%
		}
		%>

		<form action="forgot" method="post" class="form">
		

			 <div class="heading">Reset Password</div>

			<div class="form-input">
				<input type="text" name="email" placeholder="Email address">
			</div>
			
			<div class="form-input">
				<input type="text" name="id" placeholder="Id">
			</div>
			
			<div class="form-input">
				<input type="password" name="pw" placeholder="new password">
			</div>
			
			<div class="form-input">
				<input type="password" name="cp" placeholder="confirm password">
			</div>
			 
			<div class="form-input">
				<input type="submit" name="forgot" value="Reset">
			</div>
		
		</form>

	</div>



	<%@include file="footer.jsp"%>

</body>
</html>