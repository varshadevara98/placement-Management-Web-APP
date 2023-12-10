<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.placement.ViewInterviewScheduleServlet.InterviewSchedule"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Interview Schedule - Placement Portal</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>My Interview Schedule</h2>
        <%
        List<InterviewSchedule> interviewSchedules = (List<InterviewSchedule>) request.getAttribute("interviewSchedules");
        if(interviewSchedules != null && !interviewSchedules.isEmpty()) {
            for(InterviewSchedule schedule : interviewSchedules) {
        %>
                <div class="card mb-3">
                    <div class="card-body">
                        <p class="card-text">Interview ID: <%= schedule.getId() %></p>
                        <p class="card-text">Profile ID: <%= schedule.getProfileId() %></p>
                        <p class="card-text">Interview Date: <%= schedule.getInterviewDate() %></p>
                        <p class="card-text">Interview Time: <%= schedule.getInterviewTime() %></p>
                    </div>
                </div>
        <%
            }
        } else {
        %>
            <p>No scheduled interviews found.</p>
        <%
        }
        %>
        <a href="student_dashboard.jsp" class="btn btn-secondary">Dashboard</a>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
