<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Coordinator Login - Placement Portal</title>
<!-- Bootstrap CSS -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>Coordinator Login</h2>
        <form action="CoordinatorLoginServlet" method="post">
            <div class="form-group">
                <label for="cordusername">Username:</label>
                <input type="text" class="form-control" id="cordusername" name="cordusername" required>
            </div>
            <div class="form-group">
                <label for="cordpassword">Password:</label>
                <input type="password" class="form-control" id="cordpassword" name="cordpassword" required>
            </div>
            <button type="submit" class="btn btn-primary">Login</button>
        </form>
    </div>
</body>
</html>
