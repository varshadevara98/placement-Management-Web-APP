<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Coordinator Dashboard - Placement Portal</title>
<!-- Bootstrap CSS -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <%
            if (session == null || session.getAttribute("coordinator_username") == null) {
                response.sendRedirect("coordinator_signin.jsp");
            }
        %>
        <h2>Placement Coordinator Dashboard</h2>
        <p>Welcome to the Placement Coordinator Dashboard!</p>

        <ul>
            <li><a href="add_new_company.jsp" class="btn btn-primary">Add New Company</a></li>
            <li><a href="view_and_update_drives.jsp" class="btn btn-primary">Manage Company Details</a></li>
            <li><a href="list_shortlisted_students.jsp" class="btn btn-primary">View Shortlisted Students</a></li>
            <li><a href="GeneratePlacementReportServlet" class="btn btn-primary">Generate Placement Report</a></li>
            <li><a href="ReviewFeedbackServlet" class="btn btn-primary">View Feedback</a></li>
            <li><a href="CoordinatorLogout" class="btn btn-danger">Logout</a></li>
        </ul>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
