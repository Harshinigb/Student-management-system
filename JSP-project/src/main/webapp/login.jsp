<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Professional Login</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: lavender;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }
        
        .login-container {
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            overflow: hidden;
        }
        
        .login-header {
            background: none;
            color: #333;
            padding: 25px 20px;
            text-align: center;
            border-bottom: 1px solid #f0f0f0;
        }
        
        .login-header h1 {
            font-size: 24px;
            font-weight: 600;
        }
        
        .login-form {
            padding: 30px;
        }
        
        .login-form input[type="email"],
        .login-form input[type="password"] {
            width: 100%;
            padding: 14px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 16px;
            transition: all 0.3s;
        }
        
        .login-form input[type="email"]:focus,
        .login-form input[type="password"]:focus {
            border-color: #218838;
            box-shadow: 0 0 0 2px rgba(33, 136, 56, 0.2);
            outline: none;
        }
        
        .login-form input[type="submit"] {
            background-color: #218838;
            color: white;
            border: none;
            border-radius: 8px;
            padding: 15px;
            width: 100%;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
        }
        
        .login-form input[type="submit"]:hover {
            background-color: #28a745;
            transform: translateY(-2px);
            box-shadow: 0 4px 10px rgba(33, 136, 56, 0.3);
        }
        
        .login-form input[type="submit"]:active {
            transform: translateY(0);
        }
        
        .form-options {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            font-size: 14px;
        }
        
        .forgot-password {
            color: #218838;
            text-decoration: none;
            transition: color 0.3s;
        }
        
        .forgot-password:hover {
            color: #28a745;
            text-decoration: underline;
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
        
        @media (max-width: 480px) {
            .login-container {
                max-width: 100%;
            }
            
            .login-form {
                padding: 20px;
            }
            
            .form-options {
                flex-direction: column;
                align-items: flex-start;
                gap: 10px;
            }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="login-header">
            <h1>Secure Login</h1>
            <% if(request.getAttribute("success")!= null){ %>
    <h3 style = "color: green;"><%= request.getAttribute("success") %></h3>
    <% } %>
    
    <% if(request.getAttribute("error")!= null){ %>
    <h3 style = "color: red;"><%= request.getAttribute("error") %></h3>
    <% } %>
        </div>
        
        <form class="login-form" action="login" method="post">
            <input type="email" name="mail" placeholder="Enter your mail">
            <input type="password" name="password" placeholder="Enter the password">
            
            <div class="form-options">
                <a href="./forgot-password.jsp" class="forgot-password">Forgot Password?</a>
            </div>
            
            <input type="submit" value="login">
            
            <div class="signup-link">
                Don't have an account? <a href="./Signup.jsp">Signup</a>
            </div>
        </form>
    </div>
</body>
</html>