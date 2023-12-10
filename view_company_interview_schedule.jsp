<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.placement.ViewCompanyInterviewScheduleServlet.InterviewSchedule"%>
<!DOCTYPE html>
<html>
<head>
    <title>Company Interview Schedule - Placement Portal</title>
</head>
<body>
    <h2>Company Interview Schedule</h2>
    <%
    List<InterviewSchedule> interviewSchedules = (List<InterviewSchedule>) request.getAttribute("interviewSchedules");
    if(interviewSchedules != null && !interviewSchedules.isEmpty()) {
        for(InterviewSchedule schedule : interviewSchedules) {
    %>
            <div>
                <p>Interview ID: <%= schedule.getId() %></p>
                <p>Student: <%= schedule.getStudentUsername() %></p>
                <p>Profile: <%= schedule.getProfileName() %></p>
                <p>Interview Date: <%= schedule.getInterviewDate() %></p>
                <p>Interview Time: <%= schedule.getInterviewTime() %></p>
            </div>
            <hr>
    <%
        }
    } else {
    %>
        <p>No scheduled interviews found.</p>
    <%
    }
    %>
</body>