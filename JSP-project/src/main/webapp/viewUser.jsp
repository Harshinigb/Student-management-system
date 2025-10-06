<%@ page import= "com.student.dao.StudentDAOImpl" %>
<%@ page import= "com.student.dao.StudentDAO" %>
<%@ page import= "com.student.dto.Student" %>
<%@ page import = "jakarta.servlet.RequestDispatcher" %>
<%@ page import="java.util.ArrayList" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        background-color: #f9f9f9;
    }

    /* Navbar */
    .navbar {
        background-color: #2c3e50;
        color: white;
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 10px 30px;
    }

    .navbar .logo {
        font-size: 22px;
        font-weight: bold;
        letter-spacing: 1px;
    }

    

    .dashboard-title {
        text-align: center;
        margin-top: 40px;
        font-size: 32px;
        font-weight: bold;
        color: #2c3e50;
    }

    table {
        width: 95%;
        margin: 30px auto;
        border-collapse: collapse;
        background: white;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }

    th, td {
        padding: 12px;
        text-align: center;
        border-bottom: 1px solid #ddd;
    }

    th {
        background-color: #2c3e50;
        color: white;
    }

    tr:hover {
        background-color: #f2f2f2;
    }
    button{
        background-color: red;
    	height:40px;
    	width:60px;
    	border-radius: 10px;
    	color:white;
    	margin-left:10px;
    }
    button:hover{
          cursor:pointer;
    }
    a{
    	text-decoration:none;
    	color:white;
    	font-weight: bold;
    	font-size:16px;
    }
    input{
    	background-color: red;
    	height:40px;
    	width:60px;
    	border-radius: 10px;
    	color:white;
    	border:none;
    	font-weight: bold;
    	font-size:14px;
    }
    input:hover{
          cursor:pointer;
    }

    .success {
        color: green;
        text-align: center;
    }

    h2 {
        margin-left: 40px;
        margin-top: 30px;
    }
</style>
</head>
<body>

<%
    Student admin = (Student)session.getAttribute("student");

    if(admin!=null && admin.getId() == 1) {%>

<!-- Navigation Bar -->
<div class="navbar">
    <div class="logo">Welcome <%= admin.getName() %></div>
    <button><a href="./dashboard.jsp">Back</a></button>
</div>
<%if(request.getAttribute("success")!=null){ %>
   <h3 align = "center" style = "color:green;" ><%= request.getAttribute("success") %></h3>
    <%}%>
    
 <%if(request.getAttribute("error")!=null){ %>
   <h3 align = "center" style = "color:red;" ><%= request.getAttribute("error") %></h3>
    <%}%>
<div class="dashboard-title">Student Data</div>



<table>
    <thead>
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Phone</th>
            <th>Mail ID</th>
            <th>Branch</th>
            <th>Location</th>
            <th>Remove</th>
        </tr>
    </thead>
    
        <%StudentDAO sdao= new StudentDAOImpl();
        ArrayList<Student> students = sdao.getStudent();%>
    <tbody>
        <%for(Student s:students){ %>
        <tr>
        	<td><%=s.getId()%></td>
        	<td><%=s.getName()%></td>
        	<td><%=s.getPhone()%></td>
        	<td><%=s.getMail()%></td>
        	<td><%=s.getBranch()%></td>
        	<td><%=s.getLoc()%></td>
        	<td>
        	<form action= "deleteUser" method = "post">
        		<input type ="hidden" name = "id" value = "<%=s.getId()%>">
        		<input type = "submit" value = "Delete">
        	</form>
        	</td>
        
        </tr>
        <%} %>
    </tbody>
</table>
<%} else{
	request.setAttribute("error", "Session Expired!");
		RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		rd.forward(request, response);
}%>
</body>
</html>
