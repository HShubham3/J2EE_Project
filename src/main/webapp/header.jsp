<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<script src="https://kit.fontawesome.com/393fab6d21.js" crossorigin="anonymous"></script>
    <style>
        ul {
            list-style-type: none;
            /*width:100%;*/
            margin: 0;
            padding: 10px;
            overflow: hidden;
            background-color: #123969;
        }

        li {
            float: right;
        }
        li a {
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        li a:hover {
            background-color: #111;
        }
        .uname{
            margin-top: 14px;
            color: white;
            margin-right: 10px;
        }
    </style>

</head>
<body>
	<ul>
		<% if (session.getAttribute("uname") != null) {%>

		<li class="uname"><i class="fa-solid fa-circle-user" style="padding:4px"></i><%=session.getAttribute("uname")%></li>
		<li><a href="register?logout=yes">Logout</a></li>
		<li><a href="EditForm.jsp">Edit</a></li>
		
		<% if (session.getAttribute("id").equals("1")) {%>
		<li><a href="DeleteUser.jsp">Delete</a></li>
		<li><a href="search.jsp">Search</a></li>
		<%}%>
		
		<%}else {%>
		<li><a href="Registration.jsp">Register</a></li>
		<li><a href="login.jsp">Login</a></li>
		<%}%>
		<li><a class="active" href="index.jsp">Home</a></li>
		<li style="float: left"><img src="./images/Dairylogo.png" style="width:70px; border-radius:10px;"></li>
	</ul>


</body>
</html>