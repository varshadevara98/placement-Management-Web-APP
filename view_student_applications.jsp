<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Student Applications - Placement Portal</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>View Student Applications</h2>
        <%
        if(session != null && session.getAttribute("comp_username") != null){
            String representativeUsername = (String) session.getAttribute("comp_username");
            
            Connection con = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/placement_portal", "root", "vamsi1998");
                
                String query = "SELECT a.*, b.profile_name, c.drive_name FROM student_job_applications a " +
                        "JOIN job_profiles b ON a.profile_id = b.id " +
                        "JOIN placement_drives c ON a.drive_id = c.id " +
                        "WHERE b.representative_username = ?";

                pstmt = con.prepareStatement(query);
                pstmt.setString(1, representativeUsername);
                rs = pstmt.executeQuery();

                while(rs.next()) {
        %>
                    <div class="border p-3 mb-3">
                        <p>Student: <%= rs.getString("student_username") %></p>
                        <p>Profile: <%= rs.getString("profile_name") %></p>
                        <p>Drive: <%= rs.getString("drive_name") %></p>
                        <p>Application Date: <%= rs.getTimestamp("application_date") %></p>
                        <p>Status: <%= rs.getString("application_status") %></p>
                        <form action="ShortlistCandidateServlet" method="post">
                            <div class="form-group">
                                <label for="application_status">Status:</label>
                                <select class="form-control" name="application_status" id="application_status">
                                    <option value="<%= rs.getString("application_status") %>"><%= rs.getString("application_status") %></option>
                                    <option value="Under Review">Under Review</option>
                                    <option value="Shortlisted">Shortlisted</option>
                                    <option value="Rejected">Rejected</option>
                                </select>
                            </div>
                            <input type="hidden" name="application_id" value="<%= rs.getInt("id") %>">
                            <input type="submit" class="btn btn-primary" value="Update Status">
                        </form>
                    </div>
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
            response.sendRedirect("comp_representative.jsp");
        }
        %>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
