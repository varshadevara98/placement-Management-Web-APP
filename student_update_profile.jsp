<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Profile - Placement Portal</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>Update Your Profile</h2>
        <form action="StudentUpdateProfileServlet" method="post">
            <div class="form-group">
                <label for="student_email">Email:</label>
                <input type="email" class="form-control" name="student_email">
            </div>
            <div class="form-group">
                <label for="student_fullname">Full Name:</label>
                <input type="text" class="form-control" name="student_fullname">
            </div>
            <div class="form-group">
                <label for="student_academic_year">Academic Year:</label>
                <input type="number" class="form-control" name="student_academic_year" min="1" max="4">
            </div>
            <div class="form-group">
                <label for="student_major">Major:</label>
                <input type="text" class="form-control" name="student_major">
            </div>
            <button type="submit" class="btn btn-primary">Update Profile</button>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
