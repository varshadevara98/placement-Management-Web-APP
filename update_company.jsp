<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Company Details - Placement Portal</title>
</head>
<body>
    <h2>Update Company Details</h2>
    <%
    int companyId = Integer.parseInt(request.getParameter("id"));
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/placement_portal", "root", "vamsi1998");
        String query = "SELECT * FROM job_profiles WHERE id = ?";
        pstmt = con.prepareStatement(query);
        pstmt.setInt(1, companyId);
        rs = pstmt.executeQuery();

        if(rs.next()) {
    %>
            <form action="UpdateCompanyServlet" method="post">
                <input type="hidden" name="id" value="<%= companyId %>">
                Company Name: <input type="text" name="company_name" value="<%= rs.getString("profile_name") %>" required><br>
                Company Details: <textarea name="company_details" required><%= rs.getString("profile_description") %></textarea><br>
                <input type="submit" value="Update Company">
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
</body>
</html>