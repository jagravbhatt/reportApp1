<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome - Student-Faculty Portal</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        .btn-custom {
            border-radius: 25px;
            font-weight: 500;
        }
    </style>
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card text-center p-5 shadow-lg border-0">
                <h1 class="mb-4 text-primary">Welcome to Student-Faculty Portal</h1>
                <p class="lead text-muted">A place where faculty can submit student reports and students can view their progress.</p>

                <div class="mt-4">
                    <!-- Faculty Login -->
                    <a href="login" class="btn btn-primary btn-lg m-2 btn-custom">Faculty Login</a>
                    
                    <!-- Student Login -->
                    <a href="#" class="btn btn-success btn-lg m-2 btn-custom">Student Login</a>
                </div>

                <div class="mt-5">
                    <small class="text-muted">&copy; 2025 Student-Faculty Portal. All rights reserved.</small>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
