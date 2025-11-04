<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Registration Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="card shadow p-4">
        <h3 class="text-center mb-4 text-white p-2" style="background-color:#0d6efd;">User Registration Form</h3>
<jsp:include page="sidebar.jsp" />

        <!-- Registration Form -->
        <form action="saveuser" method="post">
            <div class="row">
                <!-- First Name -->
                <div class="col-md-6 mb-3">
                    <label class="form-label">First Name</label>
                    <input type="text" name="firstName" class="form-control" placeholder="First Name" required>
                </div>

                <!-- Last Name -->
                <div class="col-md-6 mb-3">
                    <label class="form-label">Last Name</label>
                    <input type="text" name="lastName" class="form-control" placeholder="Last Name" required>
                </div>
            </div>

            <div class="row">
                <!-- Gender -->
                <div class="col-md-6 mb-3">
                    <label class="form-label">Gender</label>
                    <select class="form-control" name="gender" required>
                        <option value="">Select gender</option>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                        <option value="Other">Other</option>
                    </select>
                </div>

                <!-- Role -->
                <div class="col-md-6 mb-3">
                    <label class="form-label">Role</label>
                    <select class="form-control" name="role" required>
                        <option value="">Select role</option>
                        <option value="Student">Student</option>
                        <option value="Faculty">Faculty</option>
                        <option value="Admin">Admin</option>
                    </select>
                </div>
            </div>

            <div class="row">
                <!-- Email -->
                <div class="col-md-6 mb-3">
                    <label class="form-label">Email</label>
                    <input type="email" name="email" class="form-control" placeholder="Enter email" required>
                </div>

                <!-- Password -->
                <div class="col-md-6 mb-3">
                    <label class="form-label">Password</label>
                    <input type="password" name="password" class="form-control" placeholder="Enter password" required>
                </div>
            </div>

            <div class="row">
                <!-- Contact Number -->
                <div class="col-md-6 mb-3">
                    <label class="form-label">Contact Number</label>
                    <input type="text" name="contact_num" class="form-control" placeholder="+91-XXXXXX" required>
                </div>

                <!-- Batch Type -->
                <div class="col-md-6 mb-3">
                    <label class="form-label">Batch Type</label>
                    <select class="form-control" name="batch" required>
                        <option value="">Select batch type</option>
                        <option value="gen 25">gen 25</option>
                        <option value="club">club</option>
                        <option value="one to one">one to one </option>
                         <option value="complimentarys">complimentary</option>
                    </select>
                </div>
            </div>

            <!-- Branch -->
            <div class="mb-3">
                <label class="form-label">Branch</label>
                <select class="form-control" name="branch" required>
                    <option value="">Select branch</option>
                    <option value="ahmedabad">ahmedabad</option>
                    <option value="gandhiagar">gandhinagar</option>
                    <option value="himmatnagar">himmatanagar</option>
                   
                </select>
            </div>

            <!-- Buttons -->
            <div class="d-flex justify-content-end">
                <button type="reset" class="btn btn-secondary me-2">Reset</button>
                <button type="submit" class="btn btn-primary">Submit</button>
            </div>
        </form>
    </div>
</div>

</body>
</html>
