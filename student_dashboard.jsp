<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>


<!DOCTYPE html>



<html>
<head>
    <meta charset="UTF-8">
    <title>Student Dashboard - Placement Portal</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <%
            if (session == null || session.getAttribute("student_username") == null) {
                response.sendRedirect("student_signin.jsp");
            } else {
                String studentUsername = (String) session.getAttribute("student_username");
        %>
            <h2>Welcome to Your Dashboard, <%= studentUsername %>!</h2>
            <p>Here you can manage your profile, view placement drives, apply for jobs, and more.</p>
            <ul>
                <li><a href="student_view_profile.jsp" class="btn btn-primary">View Profile</a></li>
                
                <li><a href="student_view_drives.jsp" class="btn btn-primary">View Placement Drives</a></li>
       
                <li><a href="student_track_applications.jsp" class="btn btn-primary">Track Your Applications</a></li>
                <li><a href="ViewInterviewScheduleServlet" class="btn btn-primary">View Scheduled Interviews</a></li>
                <li><a href="student_feedback.jsp" class="btn btn-primary">Feedback</a></li>
                <li><a href="StudentLogoutServlet" class="btn btn-danger">Logout</a></li>
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

