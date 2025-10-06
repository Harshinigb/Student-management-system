<%@ page import= "com.student.dto.Student" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
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
        
        .password-container {
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 450px;
            overflow: hidden;
        }
        
        .password-header {
            background: none;
            color: #333;
            padding: 25px 20px;
            text-align: center;
            border-bottom: 1px solid #f0f0f0;
        }
        
        .password-header h1 {
            font-size: 24px;
            font-weight: 600;
        }
        
        .password-form {
            padding: 30px;
        }
        
        .password-form input[type="email"],
        .password-form input[type="tel"],
        .password-form input[type="password"] {
            width: 100%;
            padding: 14px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 16px;
            transition: all 0.3s;
        }
        
        .password-form input[type="email"]:focus,
        .password-form input[type="tel"]:focus,
        .password-form input[type="password"]:focus {
            border-color: #218838;
            box-shadow: 0 0 0 2px rgba(33, 136, 56, 0.2);
            outline: none;
        }
        
        .button-group {
            display: flex;
            gap: 15px;
            margin-top: 10px;
        }
        
        .update-btn, .back-btn {
            flex: 1;
            padding: 15px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            text-align: center;
            text-decoration: none;
        }
        
        .update-btn {
            background-color: #218838;
            color: white;
        }
        
        .update-btn:hover {
            background-color: #28a745;
            transform: translateY(-2px);
            box-shadow: 0 4px 10px rgba(33, 136, 56, 0.3);
        }
        
        .back-btn {
            background-color: #6c757d;
            color: white;
        }
        
        .back-btn:hover {
            background-color: #5a6268;
            transform: translateY(-2px);
            box-shadow: 0 4px 10px rgba(108, 117, 125, 0.3);
        }
        
        .update-btn:active, .back-btn:active {
            transform: translateY(0);
        }
        
        .instructions {
            background-color: #f8f9fa;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
            font-size: 14px;
            color: #555;
            border-left: 4px solid #218838;
        }
        
        @media (max-width: 480px) {
            .password-container {
                max-width: 100%;
            }
            
            .password-form {
                padding: 20px;
            }
            
            .button-group {
                flex-direction: column;
            }
            
            
        }
    </style>
</head>
<body>
<%Student s = (Student)session.getAttribute("student"); %>
    <div class="password-container">
        <div class="password-header">
            <h1>Reset Your Password</h1>
        
        
        <% if(request.getAttribute("error")!= null){ %>
    <h3 style = "color: red;"><%= request.getAttribute("error") %></h3>
    <% } %>
    
    </div>
        
        <form class="password-form" action="forgot-password" method="post">
            <div class="instructions">
                Please enter your email and phone number to verify your identity, then create a new password.
            </div>
            
            <input type="email" name="mail" <%if(s!=null){ %> value ="<%=s.getMail()%>"<%}%> placeholder="Enter your email" required>
            <input type="tel" name="phone" <%if(s!=null){ %> value ="<%=s.getPhone()%>"<%}%> placeholder="Enter your phone number" required>
            <input type="password" name="password" placeholder="Enter new password" required>
            <input type="password" name="confirm" placeholder="Confirm new password" required>
            
            <% if(s!= null){
            	session.invalidate();
            	}%>
       
            <div class="button-group">
                <button type="submit" class="update-btn">Update Password</button>
                <a href="./login.jsp" class="back-btn">Back to Login</a>
            </div>
        </form>
    </div>
</body>
</html>