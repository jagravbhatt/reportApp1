<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel - User Management</title>
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
        
        .role-admin {
            background-color: #e9ecef;
            color: #495057;
        }
        
        .role-student {
            background-color: #d1ecf1;
            color: #0c5460;
        }
        
        .role-faculty {
            background-color: #d4edda;
            color: #155724;
        }
        
        .no-image {
            color: #6c757d;
            font-style: italic;
        }
        
        /* Report Modal Styles */
        .modal-header {
            background-color: var(--primary-color);
            color: white;
        }
        
        .report-actions {
            display: flex;
            gap: 10px;
            margin-top: 20px;
        }
        
        .report-section {
            margin-bottom: 20px;
            padding: 15px;
            border: 1px solid #eaeaea;
            border-radius: 5px;
        }
        
        .report-section h6 {
            color: var(--primary-color);
            margin-bottom: 10px;
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
            
            .btn-action {
                margin-bottom: 5px;
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
            <li><a href="listfaculty" class="active"><i class="fas fa-chalkboard-teacher"></i> Faculty</a></li>
            <li><a href="newuser"><i class="fas fa-user-plus"></i> Add User</a></li>
            <li><a href="#" id="reports-link"><i class="fas fa-chart-bar"></i> Reports</a></li>
            <li><a href="#"><i class="fas fa-cog"></i> Settings</a></li>
            <li><a href="logout.jsp" class="text-danger"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
        </ul>
    </div>

    <!-- Main Content -->
    <div class="content">
        <div class="header">
            <h2 class="page-title">Users List</h2>
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

        <!-- User Table -->
        <div class="table-container p-3">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h4 class="mb-0">All Users</h4>
                <div>
                    <button class="btn btn-primary"><i class="fas fa-plus me-2"></i> Add New User</button>
                    <button class="btn btn-outline-secondary" id="filter-btn"><i class="fas fa-filter me-2"></i> Filter</button>
                    <button class="btn btn-success" id="generate-report-btn"><i class="fas fa-chart-bar me-2"></i> Generate Report</button>
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
                            <th>Profile Pic</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>gray</td>
                            <td>bhatt</td>
                            <td>Male</td>
                            <td>jagrav@gmail.com</td>
                            <td>9998037244</td>
                            <td>gen 25</td>
                            <td><span class="role-badge role-admin">Admin</span></td>
                            <td>himmatnagar</td>
                            <td class="no-image">No Image</td>
                            <td>
                                <button class="btn btn-sm btn-outline-primary btn-action"><i class="fas fa-edit"></i></button>
                                <button class="btn btn-sm btn-outline-danger btn-action"><i class="fas fa-trash"></i></button>
                                <button class="btn btn-sm btn-outline-info btn-action report-user-btn"><i class="fas fa-chart-bar"></i></button>
                            </td>
                        </tr>
                        <tr>
                            <td>dev</td>
                            <td>nagariya</td>
                            <td>Male</td>
                            <td>dev@gmail.com</td>
                            <td>123457654</td>
                            <td>club</td>
                            <td><span class="role-badge role-student">Student</span></td>
                            <td>Electronics</td>
                            <td class="no-image">No Image</td>
                            <td>
                                <button class="btn btn-sm btn-outline-primary btn-action"><i class="fas fa-edit"></i></button>
                                <button class="btn btn-sm btn-outline-danger btn-action"><i class="fas fa-trash"></i></button>
                                <button class="btn btn-sm btn-outline-info btn-action report-user-btn"><i class="fas fa-chart-bar"></i></button>
                            </td>
                        </tr>
                        <tr>
                            <td>ash</td>
                            <td>baxi</td>
                            <td>Male</td>
                            <td>y@gmail.com</td>
                            <td>1234567u87654</td>
                            <td>one to one</td>
                            <td><span class="role-badge role-student">Student</span></td>
                            <td>ahmedabad</td>
                            <td class="no-image">No Image</td>
                            <td>
                                <button class="btn btn-sm btn-outline-primary btn-action"><i class="fas fa-edit"></i></button>
                                <button class="btn btn-sm btn-outline-danger btn-action"><i class="fas fa-trash"></i></button>
                                <button class="btn btn-sm btn-outline-info btn-action report-user-btn"><i class="fas fa-chart-bar"></i></button>
                            </td>
                        </tr>
                        <tr>
                            <td>init</td>
                            <td>popat</td>
                            <td>Male</td>
                            <td>y@gmail.com</td>
                            <td>1234567564534</td>
                            <td>gen 25</td>
                            <td><span class="role-badge role-student">Student</span></td>
                            <td>ahmedabad</td>
                            <td class="no-image">No Image</td>
                            <td>
                                <button class="btn btn-sm btn-outline-primary btn-action"><i class="fas fa-edit"></i></button>
                                <button class="btn btn-sm btn-outline-danger btn-action"><i class="fas fa-trash"></i></button>
                                <button class="btn btn-sm btn-outline-info btn-action report-user-btn"><i class="fas fa-chart-bar"></i></button>
                            </td>
                        </tr>
                        <tr>
                            <td>grav</td>
                            <td>baxi</td>
                            <td>Male</td>
                            <td>y@gmail.com</td>
                            <td>123456</td>
                            <td>one to one</td>
                            <td><span class="role-badge role-student">Student</span></td>
                            <td>gandhiagar</td>
                            <td class="no-image">No Image</td>
                            <td>
                                <button class="btn btn-sm btn-outline-primary btn-action"><i class="fas fa-edit"></i></button>
                                <button class="btn btn-sm btn-outline-danger btn-action"><i class="fas fa-trash"></i></button>
                                <button class="btn btn-sm btn-outline-info btn-action report-user-btn"><i class="fas fa-chart-bar"></i></button>
                            </td>
                        </tr>
                        <tr>
                            <td>gray</td>
                            <td>baxi</td>
                            <td>Male</td>
                            <td>y@gmail.com</td>
                            <td>123456</td>
                            <td>one to one</td>
                            <td><span class="role-badge role-student">Student</span></td>
                            <td>gandhiagar</td>
                            <td class="no-image">No Image</td>
                            <td>
                                <button class="btn btn-sm btn-outline-primary btn-action"><i class="fas fa-edit"></i></button>
                                <button class="btn btn-sm btn-outline-danger btn-action"><i class="fas fa-trash"></i></button>
                                <button class="btn btn-sm btn-outline-info btn-action report-user-btn"><i class="fas fa-chart-bar"></i></button>
                            </td>
                        </tr>
                        <tr>
                            <td>zravi</td>
                            <td>bhatt</td>
                            <td>Male</td>
                            <td>y@gmail.com</td>
                            <td>123456</td>
                            <td>club</td>
                            <td><span class="role-badge role-faculty">Faculty</span></td>
                            <td>himmatnagar</td>
                            <td class="no-image">No Image</td>
                            <td>
                                <button class="btn btn-sm btn-outline-primary btn-action"><i class="fas fa-edit"></i></button>
                                <button class="btn btn-sm btn-outline-danger btn-action"><i class="fas fa-trash"></i></button>
                                <button class="btn btn-sm btn-outline-info btn-action report-user-btn"><i class="fas fa-chart-bar"></i></button>
                            </td>
                        </tr>
                        <tr>
                            <td>init</td>
                            <td>popat</td>
                            <td>Male</td>
                            <td>y@gmail.com</td>
                            <td>1234567564534</td>
                            <td>gen 25</td>
                            <td><span class="role-badge role-student">Student</span></td>
                            <td>ahmedabad</td>
                            <td class="no-image">No Image</td>
                            <td>
                                <button class="btn btn-sm btn-outline-primary btn-action"><i class="fas fa-edit"></i></button>
                                <button class="btn btn-sm btn-outline-danger btn-action"><i class="fas fa-trash"></i></button>
                                <button class="btn btn-sm btn-outline-info btn-action report-user-btn"><i class="fas fa-chart-bar"></i></button>
                            </td>
                        </tr>
                        <tr>
                            <td>ansh</td>
                            <td>nagari</td>
                            <td>Male</td>
                            <td>v@gmail.com</td>
                            <td>987654321</td>
                            <td>gen 25</td>
                            <td><span class="role-badge role-faculty">Faculty</span></td>
                            <td>ahmedabad</td>
                            <td class="no-image">No Image</td>
                            <td>
                                <button class="btn btn-sm btn-outline-primary btn-action"><i class="fas fa-edit"></i></button>
                                <button class="btn btn-sm btn-outline-danger btn-action"><i class="fas fa-trash"></i></button>
                                <button class="btn btn-sm btn-outline-info btn-action report-user-btn"><i class="fas fa-chart-bar"></i></button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            
            <div class="d-flex justify-content-between align-items-center mt-3">
                <div>Showing 1 to 9 of 9 entries</div>
                <nav>
                    <ul class="pagination mb-0">
                        <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">Next</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>

   
    <div class="modal fade" id="reportModal" tabindex="-1" aria-labelledby="reportModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="reportModalLabel">User Report</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="report-section">
                        <h6>User Information</h6>
                        <div class="row">
                            <div class="col-md-6">
                                <p><strong>Name:</strong> <span id="report-user-name">-</span></p>
                                <p><strong>Email:</strong> <span id="report-user-email">-</span></p>
                                <p><strong>Role:</strong> <span id="report-user-role">-</span></p>
                            </div>
                            <div class="col-md-6">
                                <p><strong>Contact:</strong> <span id="report-user-contact">-</span></p>
                                <p><strong>Batch:</strong> <span id="report-user-batch">-</span></p>
                                <p><strong>Branch:</strong> <span id="report-user-branch">-</span></p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="report-section">
                        <h6>Report Options</h6>
                        <div class="form-check mb-2">
                            <input class="form-check-input" type="checkbox" id="report-activity" checked>
                            <label class="form-check-label" for="report-activity">
                                Activity Summary
                            </label>
                        </div>
                        <div class="form-check mb-2">
                            <input class="form-check-input" type="checkbox" id="report-login" checked>
                            <label class="form-check-label" for="report-login">
                                Login History
                            </label>
                        </div>
                        <div class="form-check mb-2">
                            <input class="form-check-input" type="checkbox" id="report-performance">
                            <label class="form-check-label" for="report-performance">
                                Performance Metrics
                            </label>
                        </div>
                        <div class="form-check mb-2">
                            <input class="form-check-input" type="checkbox" id="report-engagement">
                            <label class="form-check-label" for="report-engagement">
                                Engagement Statistics
                            </label>
                        </div>
                    </div>
                    
                    <div class="report-section">
                        <h6>Date Range</h6>
                        <div class="row">
                            <div class="col-md-6">
                                <label for="report-start-date" class="form-label">Start Date</label>
                                <input type="date" class="form-control" id="report-start-date">
                            </div>
                            <div class="col-md-6">
                                <label for="report-end-date" class="form-label">End Date</label>
                                <input type="date" class="form-control" id="report-end-date">
                            </div>
                        </div>
                    </div>
                    
                    <div class="report-actions">
                        <button class="btn btn-primary" id="generate-pdf-btn">
                            <i class="fas fa-file-pdf me-2"></i> Generate PDF
                        </button>
                        <button class="btn btn-success" id="generate-csv-btn">
                            <i class="fas fa-file-csv me-2"></i> Export CSV
                        </button>
                        <button class="btn btn-info" id="view-report-btn">
                            <i class="fas fa-eye me-2"></i> View Report
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        
        document.querySelector('.toggle-sidebar').addEventListener('click', function() {
            document.querySelector('.sidebar').classList.toggle('active');
        });
        
       
        document.querySelectorAll('.sidebar-nav a').forEach(item => {
            item.addEventListener('click', function() {
                document.querySelectorAll('.sidebar-nav a').forEach(link => {
                    link.classList.remove('active');
                });
                this.classList.add('active');
                
               
                if (window.innerWidth < 768) {
                    document.querySelector('.sidebar').classList.remove('active');
                }
            });
        });
        
        
        document.querySelectorAll('.btn-outline-danger').forEach(button => {
            button.addEventListener('click', function() {
                if (confirm('Are you sure you want to delete this user?')) {
             
                    alert('User deleted successfully!');
                }
            });
        });
        

        const reportModal = new bootstrap.Modal(document.getElementById('reportModal'));
        
 
        document.querySelectorAll('.report-user-btn').forEach(button => {
            button.addEventListener('click', function() {
                const row = this.closest('tr');
                const cells = row.querySelectorAll('td');
                
               
                document.getElementById('report-user-name').textContent = cells[0].textContent + ' ' + cells[1].textContent;
                document.getElementById('report-user-email').textContent = cells[3].textContent;
                document.getElementById('report-user-contact').textContent = cells[4].textContent;
                document.getElementById('report-user-batch').textContent = cells[5].textContent;
                document.getElementById('report-user-role').textContent = cells[6].textContent;
                document.getElementById('report-user-branch').textContent = cells[7].textContent;
                
               
                reportModal.show();
            });
        });
        
      
        document.getElementById('generate-report-btn').addEventListener('click', function() {
          
            document.getElementById('report-user-name').textContent = 'All Users';
            document.getElementById('report-user-email').textContent = '-';
            document.getElementById('report-user-contact').textContent = '-';
            document.getElementById('report-user-batch').textContent = '-';
            document.getElementById('report-user-role').textContent = '-';
            document.getElementById('report-user-branch').textContent = '-';
            
            reportModal.show();
        });
        
       
        document.getElementById('reports-link').addEventListener('click', function(e) {
            e.preventDefault();
            document.getElementById('generate-report-btn').click();
        });
        
    
        document.getElementById('generate-pdf-btn').addEventListener('click', function() {
            alert('PDF report generation started! This would typically download a PDF file.');
        });
        
        document.getElementById('generate-csv-btn').addEventListener('click', function() {
            alert('CSV export started! This would typically download a CSV file.');
        });
        
        document.getElementById('view-report-btn').addEventListener('click', function() {
            alert('Report preview would be displayed here!');
        });
        
       
        const today = new Date();
        const oneMonthAgo = new Date();
        oneMonthAgo.setMonth(today.getMonth() - 1);
        
        document.getElementById('report-start-date').valueAsDate = oneMonthAgo;
        document.getElementById('report-end-date').valueAsDate = today;
    </script>
</body>
</html>