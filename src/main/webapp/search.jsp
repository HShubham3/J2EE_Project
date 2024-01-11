<%@page import="java.util.*"%>
<%@page import="model.student"%>
<%@page import="model.Registration"%> 

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>search</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<style>
.jumbotron{
	 background-color: white;
}

.errmsg{
	color:black;
	background-color:red;
	padding:10px;
}
</style>
</head>
<body>

    <%@include file="header.jsp"%>
        
    <center>
        <% if (session.getAttribute("id") != null && session.getAttribute("id").equals("1")) {%>
        <font color="blue" size="4">
        <h2> Search module </h2>
        </font>
        <br><br>
        <form action="search" method="POST">
            <div class="form-group col-md-4">
                <label >Student id:</label>
                <input type="text" name="id" class="form-control" >
            </div>
            <button type="submit" class="btn btn-primary" name="submit">Search</button>
        </form>
        <%  if (request.getParameter("id") != null) {%>
        <div class="container ">
            <div class="jumbotron">

                <table class="table">
                    <thead>
                        <tr style="background-color: lightblue;">
                    <br>
                    <th>Slno</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Date</th>

                    </tr>
                    </thead>
                    <tbody id="table">
                        <% Registration reg = new Registration(session);
                            ArrayList<student> mydata = reg.getUserinfo(request.getParameter("id"));
                            Iterator<student> itr = mydata.iterator();
                            if(mydata.isEmpty()){%>
                          <tr>
                             <td style="color:red;">N/A</td>
                             <td style="color:red;">N/A</td>
                             <td style="color:red;">N/A</td>
                             <td style="color:red;">N/A</td>
                             <td style="color:red;">N/A</td>
                             <h1 class="errmsg">Not Available</h1>
                        </tr> 
                            	
                            <%}else{%>
                          <%while (itr.hasNext()) {
                                student s = itr.next();
                        %>
                        <tr>
                            <td><%=s.getId()%></td>
                            <td><%=s.getName()%></td>
                            <td><%=s.getemail()%></td>
                            <td><%=s.getphone()%></td>
                            <td><%=s.getdate()%></td>
                        </tr> 
                        <%}}%> 
                    </tbody>
                </table>
            </div>
        </div>
        
<%}}%>
    </center>
    <%@include file="footer.jsp"%>


</body>
</html>