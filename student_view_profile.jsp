<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Profile - Placement Portal</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <%
        if(session != null && session.getAttribute("student_username") != null){
            String studentUsername = (String) session.getAttribute("student_username");
    
            Connection con = null;
            Statement stmt = null;
            ResultSet rs = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/placement_portal", "root", "vamsi1998");
                stmt = con.createStatement();
                String query = "SELECT * FROM student_users WHERE student_username = '" + studentUsername + "'";
                rs = stmt.executeQuery(query);
                
                if(rs.next()) {
                    
        %>
                    <h2>Your Profile Information</h2>
                    <p>Username: <%= rs.getString("student_username") %></p>
                    <p>Email: <%= rs.getString("student_email") %></p>
                    <p>Full Name: <%= rs.getString("student_fullname") %></p>
                    <p>Academic Year: <%= rs.getInt("student_academic_year") %></p>
                    <p>Major: <%= rs.getString("student_major") %></p>
                    <a href="student_update_profile.jsp" class="btn btn-primary">Edit Profile</a>
                    <a href="student_dashboard.jsp" class="btn btn-secondary">Dashboard</a>
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
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
