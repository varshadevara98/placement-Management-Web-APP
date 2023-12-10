<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Student Feedback</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <h2 class="text-center">Student Feedback Form</h2>
                <form action="StudentFeedbackServlet" method="post">
                    <div class="form-group">
                        <label for="student_username">Student Username:</label>
                        <input type="text" class="form-control" id="student_username" name="student_username" required>
                    </div>
                    <div class="form-group">
                        <label for="feedback_text">Feedback:</label>
                        <textarea class="form-control" id="feedback_text" name="feedback_text" rows="4" required></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">Submit Feedback</button>
                </form>
            </div>
        </div>
        <a href="student_dashboard.jsp" class="btn btn-secondary">Dashboard</a>
    </div>
	
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

