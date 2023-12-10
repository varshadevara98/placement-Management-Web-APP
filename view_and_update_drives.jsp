<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Placement Drives - Placement Portal</title>
<!-- Bootstrap CSS -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>Manage Placement Drives</h2>
        <%
        if(session != null && session.getAttribute("coordinator_username") != null){
            Connection con = null;
            Statement stmt = null;
            ResultSet rs = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/placement_portal", "root", "vamsi1998");
                stmt = con.createStatement();
                String query = "SELECT * FROM placement_drives";
                rs = stmt.executeQuery(query);
        %>
        <table class="table table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th>Drive Name</th>
                    <th>Details</th>
                    <th>Date</th>
                    <th>Deadline</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% while(rs.next()) { %>
                <tr>
                    <td><%= rs.getString("drive_name") %></td>
                    <td><%= rs.getString("drive_details") %></td>
                    <td><%= rs.getDate("drive_date") %></td>
                    <td><%= rs.getDate("registration_deadline") %></td>
                    <td>
                        <a href="update_drive.jsp?id=<%= rs.getInt("id") %>" class="btn btn-primary">Update</a>
                        <a href="DeleteDriveServlet?id=<%= rs.getInt("id") %>" class="btn btn-danger" onclick="return confirm('Are you sure?')">Delete</a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <%
            } catch(Exception e) {
                e.printStackTrace();
            } finally {
                if(rs != null) try { rs.close(); } catch(SQLException e) { e.printStackTrace(); }
                if(stmt != null) try { stmt.close(); } catch(SQLException e) { e.printStackTrace(); }
                if(con != null) try { con.close(); } catch(SQLException e) { e.printStackTrace(); }
            }
        } else {
            response.sendRedirect("coordinator_login.jsp");
        }
        %>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
