<%@ page import = "com.student.dto.Student" %>
<%@ page import = "jakarta.servlet.RequestDispatcher" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Form</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: lavender;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }

    .form-container {
      background: #fff;
      padding: 30px 40px;
      border-radius: 15px;
      box-shadow: 0px 8px 20px rgba(0,0,0,0.2);
      width: 350px;
      text-align: center;
      animation: fadeIn 1s ease-in-out;
    }

    .form-container h2 {
      margin-bottom: 20px;
      color: #333;
    }

    .form-container input, 
    .form-container select {
      width: 100%;
      padding: 12px;
      margin: 10px 0;
      border: 1px solid #ccc;
      border-radius: 8px;
      font-size: 14px;
      outline: none;
      transition: 0.3s;
    }

    .form-container input:focus,
    .form-container select:focus {
      border-color: #2575fc;
      box-shadow: 0px 0px 5px rgba(37,117,252,0.5);
    }

    /* Buttons container */
    .button-container {
      display: flex;
      justify-content: center;
      gap: 10px;
      margin-top: 15px;
    }

    .button-container input {
      flex: 1;
      padding: 12px;
      border-radius: 8px;
      font-size: 14px;
      font-weight: bold;
      text-align: center;
      border: none;
      cursor: pointer;
      transition: 0.3s;
      background: #28a745;
      color: white;
    }

    .button-container input:hover {
      background: #218838;
    }

    /* Ensure links behave like buttons */
    .button-container a {
      flex: 1;
      display: inline-block;
      background: lavender;
      color: black;
      text-align: center;
      font-weight: bold;
      font-size: 16px;
      border-radius: 8px;
      padding: 12px;
      text-decoration: none;
      transition: 0.3s;
      outline:none;
      border:none;
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(-20px); }
      to { opacity: 1; transform: translateY(0); }
    }
  </style>
</head>
<body>
<%Student user = (Student)session.getAttribute("student");%>
<%if(user !=null){ %>
  <div class="form-container">
    <h2>Update Account</h2>
    
    <%if(request.getAttribute("error")!=null){ %>
    <h2 style="color:red; text-align:center; font-weight:bold;">
        <%= request.getAttribute("error") %>
    </h2>
    	<%}%>
    
    <form action="updateAccount" method="post">
      <input type="text" name="name" value = "<%= user.getName() %>" placeholder="Enter your name" required >
      <input type="tel" name="phone" value = "<%= user.getPhone() %>" placeholder="Enter phone number" required>
      <input type="email" name="mail" value = "<%= user.getMail() %>" placeholder="Enter your email" required>
      <input type="text" name="branch" value = "<%= user.getBranch() %>" placeholder="Enter your Branch" required>
      <input type="text" name="loc" value = "<%= user.getLoc() %>" placeholder="Enter your Location" required>

      <div class="button-container">
        <input type="submit" value = "Update Account">
        <button><a href="./dashboard.jsp">Back</a></button>
      </div>
    </form>
  </div>
  <%} else{
	  		request.setAttribute("error", "Session Expired!");
  			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
  			rd.forward(request, response);
   }%>
</body>
</html>
