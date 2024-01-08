<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Landing page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<style>
        h1,h2{
            text-align: center;
            text-shadow: 2px 1px 2px black;
        }
        .errmsg{
            background: green;
            padding: 10px;
            width: 50%;
            color: white;
            font-weight: bold;
         }
         
         .container{
         	display:flex;
         	flex-direction:column;
         	margin-top:10%;
         
         }
    </style>
	
</head>
<body>

    <%@include file="header.jsp" %>

    <div class="container">
        <% if (request.getAttribute("status") != null) {%>
        <h1 class="errmsg"> <%= request.getAttribute("status")%></h1>
        <%}%>
        <br>
        <div>
            <h1>Sookshmas E-Learning Pvt. Ltd</h1>
        </div>
        <% if (session.getAttribute("uname") != null) {%>
        <h1>  Welcome <%= session.getAttribute("uname")%></h1>
        <h2>  Email:- <%= session.getAttribute("email")%></h2>
        <h2>  Id:- <%= session.getAttribute("id")%></h2>
        <%}%>
    </div>


<%@include file="footer.jsp" %>

</body>
</html>