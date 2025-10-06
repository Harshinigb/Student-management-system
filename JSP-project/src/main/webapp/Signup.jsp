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

    .form-container input[type="submit"] {
      background: #28a745;
      color: white;
      font-weight: bold;
      border: none;
      cursor: pointer;
      transition: 0.3s;
    }

    .form-container input[type="submit"]:hover {
      background: #218838;
    }
    .signup-link {
            text-align: center;
            font-size: 15px;
            color: #555;
            margin-top: 20px;
        }
        
        .signup-link a {
            color: #218838;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s;
        }
        
        .signup-link a:hover {
            color: #28a745;
            text-decoration: underline;
        }
        

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(-20px); }
      to { opacity: 1; transform: translateY(0); }
    }
  </style>
</head>
<body>
  <div class="form-container">
    <h2>Signup Form</h2>
    <% if(request.getAttribute("error")!= null){ %>
    <h3 style = "color: red;"><%= request.getAttribute("error") %></h3>
    <% } %>
    
    <form action="signup" method ="post">
      <input type="text" name="name" placeholder="Enter your name" required>
      <input type="tel" name="phone" placeholder="Enter phone number" required>
      <input type="email" name="mail" placeholder="Enter your email" required>
      
      <select name="branch" required>
        <option value="">Select Branch</option>
        <option>ECE</option>
        <option>CSE</option>
        <option>ISE</option>
      </select>
      
      <select name="loc" required>
        <option value="">Select Location</option>
        <option>Bengaluru</option>
        <option>Hyderabad</option>
        <option>Dubai</option>
      </select>
      
      <input type="password" name="password" placeholder="Enter password" required>
      <input type="password" name="confirm" placeholder="Confirm password" required>
      
      <input type="submit" value="Signup">
      <div class="signup-link">
                Already have an account? <a href="./login.jsp">Login</a>
            </div>
    </form>
  </div>
</body>
</html>
