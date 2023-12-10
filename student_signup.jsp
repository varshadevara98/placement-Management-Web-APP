<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Student Signup - Placement Portal</title>
        <!-- Include Bootstrap CSS -->
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <h2 class="text-center">Student Signup</h2>
                    <form action="StudentSignupServlet" method="post">
                        <div class="form-group">
                            <label for="student_username">Username:</label>
                            <input type="text" class="form-control" id="student_username" name="student_username" required>
                        </div>
                        <div class="form-group">
                            <label for="student_password">Password:</label>
                            <input type="password" class="form-control" id="student_password" name="student_password" required>
                        </div>
                        <div class="form-group">
                            <label for="student_email">Email:</label>
                            <input type="email" class="form-control" id="student_email" name="student_email">
                        </div>
                        <div class="form-group">
                            <label for="student_fullname">Full Name:</label>
                            <input type="text" class="form-control" id="student_fullname" name="student_fullname">
                        </div>
                        <div class="form-group">
                            <label for="student_academic_year">Academic Year:</label>
                            <input type="number" class="form-control" id="student_academic_year" name="student_academic_year" min="1" max="4">
                        </div>
                        <div class="form-group">
                            <label for="student_major">Major:</label>
                            <input type="text" class="form-control" id="student_major" name="student_major">
                        </div>
                        <button type="submit" class="btn btn-primary">Signup</button>
                    </form>
                    <p class="mt-3">Already have an account? <a href="student_signin.jsp">Sign in here</a>.</p>
                    <p>Are you a Coordinator? <a href="coordinator_login.jsp">Sign in here</a>.</p>
                    <p>Are you a Representative? <a href="comp_representative_login.jsp">Sign in here</a>.</p>
                </div>
            </div>
        </div>
    
        <!-- Include Bootstrap JS and jQuery (if needed) -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
    </html>
    