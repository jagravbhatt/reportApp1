<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>


<%
    // Invalidate the session to log out the user

    if (session != null) {
        session.invalidate();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Logout</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container text-center mt-5">
    <div class="card shadow-sm p-4" style="max-width: 400px; margin: auto;">
        <h2 class="card-title mb-3">Logged Out</h2>
        <p class="card-text mb-4">You have been successfully logged out.</p>
        <a href="login.jsp" class="btn btn-primary w-100">Go to Login</a>
    </div>
</div>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
