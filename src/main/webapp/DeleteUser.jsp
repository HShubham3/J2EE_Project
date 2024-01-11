<%@page import="java.util.*"%>
<%@page import="model.student"%>
<%@page import="model.Registration"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<style>

	.errmsg {
		background: green;
		padding: 6px;
		width: 50%;
		color: white;
		font-weight: bold;
	}

	.jumbotron {
		background-color: white;
	}
	
	#search {
		width: 50%;
	}
</style>
</head>


<body>

	<%@include file="header.jsp"%>
	
	<center>
		<br> <font color="blue" size="4">
			<h2>Delete User</h2>
		</font>
		<%
		if (request.getAttribute("status") != null) {
		%>
		<h1 class="errmsg"><%=request.getAttribute("status")%></h1>
		<%
		}
		%>
		<div class="container ">
			<div class="jumbotron">
				<input class="form-control" id="search" type="text" placeholder="Search..">
				<table class="table">
					<thead>
						<tr style="background-color: lightblue;">
							<br>
							<th>Slno</th>
							<th>Name</th>
							<th>Email</th>
							<th>Phone</th>
							<th>Date</th>
							<th>Delete</th>
						</tr>
					</thead>
					<tbody id="table">
						<%
						if (session.getAttribute("id") != null && session.getAttribute("id").equals("1")) {
							Registration reg = new Registration(session);
							ArrayList<student> mydata = reg.getUserDetails();

							Iterator<student> itr = mydata.iterator();
							while (itr.hasNext()) {
								student s = itr.next();
						%>
						<tr>
							<td><%=s.getId()%></td>
							<td><%=s.getName()%></td>
							<td><%=s.getemail()%></td>
							<td><%=s.getphone()%></td>
							<td><%=s.getdate()%></td>
							<td>
								<form action="delete" method="POST">
									<input type="hidden" name="userid" value="<%=s.getId()%>" /> 
									<input type="submit" class="btn btn-danger" value="Delete" name="delete"/>
								</form>
							</td>
						</tr>
						<%}
                        }%>
					</tbody>
				</table>
			</div>
		</div>
	</center>
	<%@include file="footer.jsp"%>

</body>
</html>