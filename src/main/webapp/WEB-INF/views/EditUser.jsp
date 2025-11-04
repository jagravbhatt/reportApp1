<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="card shadow p-4">
        <h3 class="text-center mb-4 text-white p-2" style="background-color:#0d6efd;">Edit User</h3>

        <!-- Edit Form -->
        <form action="updateuser" method="post">
            <!-- Hidden field for User ID -->
            <input type="hidden" name="user_id" value="${user.user_id}"/>

            <div class="row">
                <div class="col-md-6 mb-3">
                    <label class="form-label">First Name</label>
                    <input type="text" name="firstName" class="form-control" value="${user.firstName}" required>
                </div>
                <div class="col-md-6 mb-3">
                    <label class="form-label">Last Name</label>
                    <input type="text" name="lastName" class="form-control" value="${user.lastName}" required>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6 mb-3">
                    <label class="form-label">Gender</label>
                    <select class="form-control" name="gender" required>
                        <option value="Male" ${user.gender == 'Male' ? 'selected' : ''}>Male</option>
                        <option value="Female" ${user.gender == 'Female' ? 'selected' : ''}>Female</option>
                        <option value="Other" ${user.gender == 'Other' ? 'selected' : ''}>Other</option>
                    </select>
                </div>
                <div class="col-md-6 mb-3">
                    <label class="form-label">Role</label>
                    <select class="form-control" name="role" required>
                        <option value="Student" ${user.role == 'Student' ? 'selected' : ''}>Student</option>
                        <option value="Faculty" ${user.role == 'Faculty' ? 'selected' : ''}>Faculty</option>
                        <option value="Admin" ${user.role == 'Admin' ? 'selected' : ''}>Admin</option>
                    </select>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6 mb-3">
                    <label class="form-label">Email</label>
                    <input type="email" name="email" class="form-control" value="${user.email}" required>
                </div>
                <div class="col-md-6 mb-3">
                    <label class="form-label">Password</label>
                    <input type="password" name="password" class="form-control" value="${user.password}" required>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6 mb-3">
                    <label class="form-label">Contact Number</label>
                    <input type="text" name="contact_num" class="form-control" value="${user.contact_num}">
                </div>
                <div class="col-md-6 mb-3">
                    <label class="form-label">Batch</label>
                    <select class="form-control" name="batch">
                        <option value="gen 25" ${user.batch == 'gen 25' ? 'selected' : ''}>gen 25</option>
                        <option value="club" ${user.batch == 'club' ? 'selected' : ''}>club</option>
                        <option value="one to one" ${user.batch == 'one to one' ? 'selected' : ''}>one to one</option>
                        <option value="complimentary" ${user.batch == 'complimentary' ? 'selected' : ''}>complimentary</option>
                    </select>
                </div>
            </div>

            <div class="mb-3">
                <label class="form-label">Branch</label>
                <select class="form-control" name="branch">
                    <option value="ahmedabad" ${user.branch == 'ahmedabad' ? 'selected' : ''}>ahmedabad</option>
                    <option value="gandhinagar" ${user.branch == 'gandhinagar' ? 'selected' : ''}>gandhinagar</option>
                    <option value="himmatnagar" ${user.branch == 'himmatnagar' ? 'selected' : ''}>himmatnagar</option>
                </select>
            </div>

            <div class="mb-3">
                <label class="form-label">Profile Pic URL</label>
                <input type="text" name="profilePicURL" class="form-control" value="${user.profilePicURL}">
            </div>

            <div class="d-flex justify-content-end">
                <a href="listusers" class="btn btn-secondary me-2">Cancel</a>
                <button type="submit" class="btn btn-success">Update</button>
            </div>
        </form>
    </div>
</div>

</body>
</html>
