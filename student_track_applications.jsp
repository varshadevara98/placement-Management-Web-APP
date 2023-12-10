<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Track Applications - Placement Portal</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <%
    if(session != null && session.getAttribute("student_username") != null){
        String studentUsername = (String) session.getAttribute("student_username");
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean hasApplications = false; 
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/placement_portal", "root", "vamsi1998");
            String query = "SELECT a.id, b.drive_name, c.profile_name, a.application_date, a.application_status FROM student_job_applications a " +
                           "JOIN placement_drives b ON a.drive_id = b.id " +
                           "JOIN job_profiles c ON a.profile_id = c.id " +
                           "WHERE a.student_username = ?";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, studentUsername);
            rs = pstmt.executeQuery();

            while(rs.next()) {
                hasApplications = true; 
    %>
                <div>
                    <h3>Drive: <%= rs.getString("drive_name") %></h3>
                    <p>Profile: <%= rs.getString("profile_name") %></p>
                    <p>Applied on: <%= rs.getDate("application_date") %></p>
                    <p>Status: <%= rs.getString("application_status") %></p>
                    <form action="StudentWithdrawApplicationServlet" method="post">
                        <input type="hidden" name="applicationId" value="<%= rs.getInt("id") %>">
                        <input type="submit" class="btn btn-danger" value="Withdraw Application">
                    </form>
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
        
        if (!hasApplications) {
    %>
            <p>No applications found.</p> 
    <%
        }
        
    } else {
        response.sendRedirect("student_signin.jsp");
    }
    %>
     <a href="student_dashboard.jsp" class="btn btn-secondary">Dashboard</a>
</div>
</body>
</html>
