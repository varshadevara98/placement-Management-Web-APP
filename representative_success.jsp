<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Success - Placement Portal</title>
    <style>
        .message {
            color: green;
            font-size: 18px;
        }
        .link {
            margin-top: 20px;
            display: block;
        }
    </style>
</head>
<body>
    <%
    String successMessage = (String) request.getAttribute("successMessage");
    if(successMessage == null) {
        successMessage = "Operation completed successfully.";
    }
    String returnLink = (String) request.getAttribute("returnLink");
    if(returnLink == null) {
        returnLink = "representative_dashboard.jsp"; 
    }
    %>
    <div class="message">
        <%= successMessage %>
    </div>
    
    <a href="<%= returnLink %>" class="link">Return</a>
</body>
</html>