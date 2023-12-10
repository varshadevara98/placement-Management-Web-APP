<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Representative Dashboard - Placement Portal</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <%
            if (session == null || session.getAttribute("comp_username") == null) {
                response.sendRedirect("comp_representative_login.jsp");
            } else {
                String representativeUsername = (String) session.getAttribute("comp_username");
        %>
            <h2>Welcome to Your Dashboard, <%= representativeUsername %>!</h2>
            <p>Here you can manage company details, view student applications, schedule interviews, and more.</p>
            <ul>
                <li><a href="view_and_update_companies.jsp" class="btn btn-primary">Manage Company Details</a></li>
                <li><a href="view_student_applications.jsp" class="btn btn-primary">View Student Applications</a></li>
                <li><a href="ViewCompanyInterviewScheduleServlet" class="btn btn-primary">View Scheduled Interviews</a></li>
                <li><a href="representative_feedback.jsp" class="btn btn-primary">Feedback</a></li>
                <li><a href="RepresentativeLogoutServlet" class="btn btn-danger">Logout</a></li>
            </ul>
        <%
            }
        %>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
