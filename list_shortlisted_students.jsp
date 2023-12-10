<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>List of Shortlisted Students - Placement Portal</title>
</head>
<body>
    <h2>Shortlisted Students for Interviews</h2>
    <%
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/placement_portal", "root", "vamsi1998");
        String query = "SELECT a.id, a.student_username, b.profile_name, a.application_status, b.id as profile_id " +
                       "FROM student_job_applications a " +
                       "JOIN job_profiles b ON a.profile_id = b.id " +
                       "WHERE a.application_status = 'Shortlisted'";
        pstmt = con.prepareStatement(query);
        rs = pstmt.executeQuery();

        while(rs.next()) {
    %>
            <div>
                <p>Student: <%= rs.getString("student_username") %></p>
                <p>Profile: <%= rs.getString("profile_name") %></p>
                <p>Status: <%= rs.getString("application_status") %></p>
                <a href="schedule_interview.jsp?studentUsername=<%= rs.getString("student_username") %>&profileId=<%= rs.getInt("profile_id") %>">Schedule Interview</a>
            </div>
            <hr>
    <%
        }
    } catch(Exception e) {
        e.printStackTrace();
    } finally {
        if(rs != null) try { rs.close(); } catch(SQLException e) { e.printStackTrace(); }
        if(pstmt != null) try { pstmt.close(); } catch(SQLException e) { e.printStackTrace(); }
        if(con != null) try { con.close(); } catch(SQLException e) { e.printStackTrace(); }
    }
    %>
</body>
</html>
