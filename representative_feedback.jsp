<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Representative Feedback</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>Representative Feedback Form</h2>
        <form action="CompanyRepresentativeFeedback" method="post">
            <div class="form-group">
                <label for="representative_username">Representative Username:</label>
                <input type="text" class="form-control" id="representative_username" name="representative_username" required>
            </div>
            <div class="form-group">
                <label for="feedback_text">Feedback:</label>
                <textarea class="form-control" id="feedback_text" name="feedback_text" rows="4" cols="50" required></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Submit Feedback</button>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
