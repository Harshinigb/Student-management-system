<%@ page import= "com.student.dto.Student" %>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

    .navbar ul {
        list-style-type: none;
        margin: 0;
        padding: 0;
        display: flex;
    }

    .navbar ul li {
        margin-left: 20px;
        margin-top:10px;
    }

    .navbar ul li a {
        text-decoration: none;
        color: white;
        font-size: 14px;
        transition: 0.3s;
        
    }

    .navbar ul li a:hover {
        color: #00b894;
    }

    /* Dashboard Title */
    .dashboard-title {
        text-align: center;
        margin-top: 40px;
        font-size: 32px;
        font-weight: bold;
        color: #2c3e50;
    }

    /* Table styling */
    table {
        width: 95%;
        margin: 40px auto;
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

    input{
    	background-color: red;
    	height:40px;
    	width:60px;
    	border-radius: 10px;
    	color:white;
    	margin-left:10px;
    }
    input:hover{
          cursor:pointer;
    }
    h2{
    	margin-left:40px;
    
    }
</style>
</head>
<body>

<%Student s = (Student)session.getAttribute("student"); %>



    <!-- Navigation Bar -->
    <div class="navbar">
        <div class="logo">Welcome <%=s.getName() %></div>
        <ul>
            <%if(s.getId()==1){ %>
            <li><a href="./viewUser">View User</a></li>
            <%}%>
            
            <li><a href="./forgot-password.jsp">Reset Password</a></li>
            <li><a href="./updateAccount.jsp">Update Data</a></li>
            <form action= "logout" method = "post">
            	<input type = "submit" name = "logout" value = "logout">
            </form>
        </ul>
    </div>

    <div class="dashboard-title">Dashboard</div>
	
    <%if(request.getAttribute("success")!=null){ %>
   <h3 align = "center", style = "color:green;" ><%= request.getAttribute("success") %></h3>
    <%}%>
    <h2>View Your Data</h2>
    
    <table>
    <thead>
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Phone</th>
            <th>Mail ID</th>
            <th>Branch</th>
            <th>Location</th>
        </tr>
	</thead>
	<tbody>
		<tr>
			<td><%=s.getId() %></td>
			<td><%=s.getName() %></td>
			<td><%=s.getPhone() %></td>
			<td><%=s.getMail() %></td>
			<td><%=s.getBranch() %></td>
			<td><%=s.getLoc() %></td>
					
		
		</tr>
	
	
	
	
	
	
	</tbody>
        
    </table>

</body>
</html>
