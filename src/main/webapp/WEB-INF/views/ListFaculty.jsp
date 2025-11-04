<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel - Faculty Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --sidebar-width: 250px;
            --primary-color: #4361ee;
            --secondary-color: #3f37c9;
            --light-color: #f8f9fa;
            --dark-color: #212529;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f7fb;
            overflow-x: hidden;
        }
        
        .sidebar {
            width: var(--sidebar-width);
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            background: linear-gradient(180deg, var(--primary-color), var(--secondary-color));
            box-shadow: 3px 0 10px rgba(0, 0, 0, 0.1);
            z-index: 100;
            transition: all 0.3s;
        }
        
        .sidebar-brand {
            font-weight: 700;
            font-size: 1.5rem;
            padding: 1.5rem 1rem;
            color: white;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        .sidebar-nav {
            list-style: none;
            padding: 0;
            margin-top: 1rem;
        }
        
        .sidebar-nav li {
            margin-bottom: 0.5rem;
        }
        
        .sidebar-nav a {
            display: flex;
            align-items: center;
            padding: 0.8rem 1rem;
            color: rgba(255, 255, 255, 0.8);
            text-decoration: none;
            border-radius: 5px;
            transition: all 0.3s;
        }
        
        .sidebar-nav a:hover, .sidebar-nav a.active {
            background-color: rgba(255, 255, 255, 0.1);
            color: white;
        }
        
        .sidebar-nav i {
            margin-right: 10px;
            font-size: 1.2rem;
            width: 25px;
            text-align: center;
        }
        
        .content {
            margin-left: var(--sidebar-width);
            padding: 20px;
            transition: all 0.3s;
            min-height: 100vh;
        }
        
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem 0;
            margin-bottom: 2rem;
            border-bottom: 1px solid #eaeaea;
        }
        
        .user-info {
            display: flex;
            align-items: center;
        }
        
        .user-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: var(--primary-color);
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 10px;
            font-weight: bold;
        }
        
        .table-container {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            overflow: hidden;
        }
        
        .table th {
            border-top: none;
            background-color: #f8f9fa;
            font-weight: 600;
            color: #495057;
        }
        
        .btn-action {
            padding: 0.25rem 0.5rem;
            margin: 0 2px;
        }
        
        .page-title {
            color: var(--dark-color);
            font-weight: 600;
            margin-bottom: 1.5rem;
        }
        
        .toggle-sidebar {
            display: none;
            background: none;
            border: none;
            font-size: 1.5rem;
            color: var(--dark-color);
        }
        
        .role-badge {
            padding: 0.25rem 0.5rem;
            border-radius: 4px;
            font-size: 0.75rem;
            font-weight: 600;
        }
        
        .role-faculty {
            background-color: #d4edda;
            color: #155724;
        }
        
        .back-link {
            display: inline-flex;
            align-items: center;
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 500;
            margin-top: 1rem;
        }
        
        .back-link:hover {
            text-decoration: underline;
        }
        
        @media (max-width: 768px) {
            .sidebar {
                transform: translateX(-100%);
            }
            
            .sidebar.active {
                transform: translateX(0);
            }
            
            .content {
                margin-left: 0;
            }
            
            .toggle-sidebar {
                display: block;
            }
            
            .table-responsive {
                font-size: 0.875rem;
            }
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="sidebar-brand">
            <i class="fas fa-cogs me-2"></i>Admin Panel
        </div>
        <ul class="sidebar-nav">
            <li><a href="dashboard"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
            <li><a href="listusers"><i class="fas fa-users"></i> Users</a></li>
            <li><a href="liststudents"><i class="fas fa-user-graduate"></i> Students</a></li>
            <li><a href="listfaculty"> class="active"><i class="fas fa-chalkboard-teacher"></i> Faculty</a></li>
            <li><a href="newuser"><i class="fas fa-user-plus"></i> Add User</a></li>
            <li><a href="#"><i class="fas fa-chart-bar"></i> Reports</a></li>
            <li><a href="#"><i class="fas fa-cog"></i> Settings</a></li>
            <li><a href="logout.jsp" class="text-danger"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
        </ul>
    </div>

    <!-- Main Content -->
    <div class="content">
        <div class="header">
            <h2 class="page-title">Faculty List</h2>
            <div class="d-flex align-items-center">
                <button class="toggle-sidebar me-3">
                    <i class="fas fa-bars"></i>
                </button>
                <div class="user-info">
                    <div class="user-avatar">AD</div>
                    <div>
                        <div class="fw-bold">Admin User</div>
                        <small class="text-muted">Administrator</small>
                    </div>
                </div>
            </div>
        </div>

        <!-- Faculty Table -->
        <div class="table-container p-3">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h4 class="mb-0">All Faculty Members</h4>
                <div>
                    <button class="btn btn-primary"><i class="fas fa-plus me-2"></i> Add New Faculty</button>
                    <button class="btn btn-outline-secondary"><i class="fas fa-filter me-2"></i> Filter</button>
                </div>
            </div>
            
            <div class="table-responsive">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Last Name</th>
                            <th>Gender</th>
                            <th>Email</th>
                            <th>Contact</th>
                            <th>Batch</th>
                            <th>Role</th>
                            <th>Branch</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>vii</td>
                            <td>bhatt</td>
                            <td>Male</td>
                            <td>y@gmail.com</td>
                            <td>12345</td>
                            <td>club</td>
                            <td><span class="role-badge role-faculty">Faculty</span></td>
                            <td>himmatnagar</td>
                            <td>
                                <button class="btn btn-sm btn-outline-primary btn-action"><i class="fas fa-edit"></i> Edit</button>
                                <button class="btn btn-sm btn-outline-danger btn-action"><i class="fas fa-trash"></i> Delete</button>
                            </td>
                        </tr>
                        <tr>
                            <td>nsh</td>
                            <td>nagari</td>
                            <td>Male</td>
                            <td>v@gmail.com</td>
                            <td>987654321</td>
                            <td>gen 25</td>
                            <td><span class="role-badge role-faculty">Faculty</span></td>
                            <td>ahmedabad</td>
                            <td>
                                <button class="btn btn-sm btn-outline-primary btn-action"><i class="fas fa-edit"></i> Edit</button>
                                <button class="btn btn-sm btn-outline-danger btn-action"><i class="fas fa-trash"></i> Delete</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            
            <div class="d-flex justify-content-between align-items-center mt-3">
                <div>Showing 1 to 2 of 2 entries</div>
                <nav>
                    <ul class="pagination mb-0">
                        <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">Next</a></li>
                    </ul>
                </nav>
            </div>
            
            <a href="AdminDashboard.jsp" class="back-link">
                <i class="fas fa-arrow-left me-2"></i> Back to Dashboard
            </a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Toggle sidebar on mobile
        document.querySelector('.toggle-sidebar').addEventListener('click', function() {
            document.querySelector('.sidebar').classList.toggle('active');
        });
        
        // Update active menu item
        document.querySelectorAll('.sidebar-nav a').forEach(item => {
            item.addEventListener('click', function() {
                document.querySelectorAll('.sidebar-nav a').forEach(link => {
                    link.classList.remove('active');
                });
                this.classList.add('active');
                
                // Close sidebar on mobile after selection
                if (window.innerWidth < 768) {
                    document.querySelector('.sidebar').classList.remove('active');
                }
            });
        });
        
        // Add confirmation for delete actions
        document.querySelectorAll('.btn-outline-danger').forEach(button => {
            button.addEventListener('click', function() {
                if (confirm('Are you sure you want to delete this faculty member?')) {
                    // Add your delete logic here
                    alert('Faculty member deleted successfully!');
                }
            });
        });
        
        // Add functionality to edit buttons
        document.querySelectorAll('.btn-outline-primary').forEach(button => {
            button.addEventListener('click', function() {
                // Redirect to edit faculty page
                window.location.href = 'EditUser.jsp';
            });
        });
    </script>
</body>
</html>