<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Placement Activity Report</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>Placement Activity Report</h2>
        <%
        Map<String, Integer> reportData = (Map<String, Integer>) request.getAttribute("reportData");
        %>
        <p>Number of Scheduled Interviews: <%= reportData.getOrDefault("interviewCount", 0) %></p>
        <p>Number of Students Registered for Placement Drives: <%= reportData.getOrDefault("studentCount", 0) %></p>
        <p>Number of Companies Participating: <%= reportData.getOrDefault("companyCount", 0) %></p>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
