<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student SignIn - Placement Portal</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <h2 class="text-center">Student SignIn</h2>
                <form action="StudentSigninServlet" method="post">
                    <div class="form-group">
                        <label for="student_username">Username:</label>
                        <input type="text" class="form-control" id="student_username" name="student_username" required>
                    </div>
                    <div class="form-group">
                        <label for="student_password">Password:</label>
                        <input type="password" class="form-control" id="student_password" name="student_password" required>
                    </div>
                    <button type="submit" class="btn btn-primary">SignIn</button>
                </form>
                <p class="mt-3">Are you new to this site? <a href="student_signup.jsp">Signup in here</a>.</p>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
