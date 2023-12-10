<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Job Profile - Placement Portal</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2>Add Job Profile to Drive</h2>
    <form action="AddJobProfileServlet" method="post">
        <div class="form-group">
            <label for="drive_name">Drive Name:</label>
            <input type="text" class="form-control" name="drive_name" required>
        </div>
        <div class="form-group">
            <label for="drive_details">Drive Details:</label>
            <textarea class="form-control" name="drive_details" required></textarea>
        </div>
        <div class="form-group">
            <label for="drive_date">Drive Date:</label>
            <input type="date" class="form-control" name="drive_date" required>
        </div>
        <div class="form-group">
            <label for="registration_deadline">Registration Deadline:</label>
            <input type="date" class="form-control" name="registration_deadline" required>
        </div>
        <button type="submit" class="btn btn-primary">Add Drive</button>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

