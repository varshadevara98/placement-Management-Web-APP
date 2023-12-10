<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Drive Details - Placement Portal</title>
<!-- Bootstrap CSS -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>Update Drive Details</h2>
        <%
        int driveId = Integer.parseInt(request.getParameter("id"));
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/placement_portal", "root", "vamsi1998");
            String query = "SELECT * FROM placement_drives WHERE id = ?";
            pstmt = con.prepareStatement(query);
            pstmt.setInt(1, driveId);
            rs = pstmt.executeQuery();

            if(rs.next()) {
        %>
            <form action="UpdateDriveServlet" method="post">
                <input type="hidden" name="id" value="<%= driveId %>">
                <div class="form-group">
                    <label for="drive_name">Drive Name:</label>
                    <input type="text" class="form-control" id="drive_name" name="drive_name" value="<%= rs.getString("drive_name") %>" required>
                </div>
                <div class="form-group">
                    <label for="drive_details">Drive Details:</label>
                    <textarea class="form-control" id="drive_details" name="drive_details" rows="4" required><%= rs.getString("drive_details") %></textarea>
                </div>
                <div class="form-group">
                    <label for="drive_date">Drive Date:</label>
                    <input type="date" class="form-control" id="drive_date" name="drive_date" value="<%= rs.getDate("drive_date").toString() %>" required>
                </div>
                <div class="form-group">
                    <label for="registration_deadline">Registration Deadline:</label>
                    <input type="date" class="form-control" id="registration_deadline" name="registration_deadline" value="<%= rs.getDate("registration_deadline").toString() %>" required>
                </div>
                <button type="submit" class="btn btn-primary">Update Drive</button>
            </form>
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
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
