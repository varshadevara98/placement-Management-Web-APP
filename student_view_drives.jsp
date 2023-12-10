<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Placement Drives - Placement Portal</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <%
    if(session != null && session.getAttribute("student_username") != null){
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/placement_portal", "root", "vamsi1998");
            stmt = con.createStatement();
            String query = "SELECT * FROM placement_drives";
            rs = stmt.executeQuery(query);

            while(rs.next()) {
                int driveId = rs.getInt("id");
                String driveName = rs.getString("drive_name");
                String driveDetails = rs.getString("drive_details");
    %>
                <div>
                    <h3><%= driveName %></h3>
                    <p><%= driveDetails %></p>
                    <form action="StudentRegisterForDriveServlet" method="post">
                        <input type="hidden" name="driveId" value="<%= driveId %>">
                        <button type="submit" class="btn btn-primary">Register for this Drive</button>
                        <a href="student_view_job_profiles.jsp?driveId=<%= driveId %>" class="btn btn-secondary">View Job Profiles</a>
                    </form>
                </div>
                <hr>
    <%
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) try { rs.close(); } catch(SQLException e) { e.printStackTrace(); }
            if(stmt != null) try { stmt.close(); } catch(SQLException e) { e.printStackTrace(); }
            if(con != null) try { con.close(); } catch(SQLException e) { e.printStackTrace(); }
        }
    } else {
        response.sendRedirect("student_signin.jsp");
    }
    %>
     <a href="student_dashboard.jsp" class="btn btn-secondary">Dashboard</a>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

