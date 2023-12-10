<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Job Profiles - Placement Portal</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <%
        if(session != null && session.getAttribute("student_username") != null){
            int driveId = Integer.parseInt(request.getParameter("driveId"));
            Connection con = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/placement_portal", "root", "vamsi1998");
                String query = "SELECT * FROM job_profiles WHERE drive_id = ?";
                pstmt = con.prepareStatement(query);
                pstmt.setInt(1, driveId);
                rs = pstmt.executeQuery();

                while(rs.next()) {
                    String profileName = rs.getString("profile_name");
                    String profileDescription = rs.getString("profile_description");
        %>
                    <div>
                        <h3><%= profileName %></h3>
                        <p><%= profileDescription %></p>
                        <form action="StudentApplyForJobServlet" method="post">
                            <input type="hidden" name="profileId" value="<%= rs.getInt("id") %>">
                            <input type="hidden" name="driveId" value="<%= driveId %>">
                            <input type="submit" class="btn btn-primary" value="Apply for this Profile">
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
        } else {
            response.sendRedirect("student_signin.jsp");
        }
        %>
         <a href="student_dashboard.jsp" class="btn btn-secondary">Dashboard</a>
    </div>
    <!-- Bootstrap and jQuery Scripts -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
