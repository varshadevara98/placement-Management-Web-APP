<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
<head>
    <title>Schedule Interview - Placement Portal</title>
</head>
<body>
    <h2>Schedule Interview</h2>
    <form action="ScheduleInterviewServlet" method="post">
        Student Username: <input type="text" name="student_username" value="<%= request.getParameter("studentUsername") != null ? request.getParameter("studentUsername") : "" %>" required readonly><br>
        Profile ID: <input type="number" name="profile_id" value="<%= request.getParameter("profileId") != null ? request.getParameter("profileId") : "" %>" required readonly><br>
       
        Interview Date: <input type="date" name="interview_date" required><br>
        Interview Time: <input type="time" name="interview_time" required><br>
        <input type="submit" value="Schedule Interview">
    </form>
</body>
</html>
