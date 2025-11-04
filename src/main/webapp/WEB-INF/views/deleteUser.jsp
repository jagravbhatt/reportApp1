<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Delete User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="card shadow p-4">
        <h3 class="text-center mb-4 text-white p-2" style="background-color:#dc3545;">Delete User</h3>

        <p class="text-center">Are you sure you want to delete the following user?</p>

        <table class="table table-bordered">
            <tr>
                <th>First Name</th>
                <td>${user.firstName}</td>
            </tr>
            <tr>
                <th>Last Name</th>
                <td>${user.lastName}</td>
            </tr>
            <tr>
                <th>Email</th>
                <td>${user.email}</td>
            </tr>
            <tr>
                <th>Role</th>
                <td>${user.role}</td>
            </tr>
            <tr>
                <th>Batch</th>
                <td>${user.batch}</td>
            </tr>
            <tr>
                <th>Branch</th>
                <td>${user.branch}</td>
            </tr>
        </table>

        <!-- Delete form -->
        <form action="deleteuserconfirm" method="post" class="text-center">
            <!-- Hidden field to pass user ID -->
            <input type="hidden" name="user_id" value="${user.user_id}"/>

            <a href="listusers" class="btn btn-secondary me-2">Cancel</a>
            <button type="submit" class="btn btn-danger">Delete</button>
        </form>
    </div>
</div>

</body>
</html>
