<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error - Placement Portal</title>
</head>
<body>
    <h2>An Error Occurred</h2>
    
    <% 
    String errorMessage = (String) request.getAttribute("error");
    if(errorMessage == null) {
        errorMessage = "Unknown error occurred.";
    }
    %>
    
    <p style="color: red;"><%= errorMessage %></p>
    
    <p>
        <a href="student_dashboard.jsp">Return to Home</a> 
    </p>
</body>
</html>