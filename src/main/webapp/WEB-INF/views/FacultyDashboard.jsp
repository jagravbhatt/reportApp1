<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Faculty Dashboard - Student Portal</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .sidebar {
            background-color: #343a40;
            min-height: 100vh;
            color: white;
        }
        .sidebar .nav-link {
            color: #adb5bd;
            padding: 10px 15px;
            margin: 5px 0;
        }
        .sidebar .nav-link:hover, .sidebar .nav-link.active {
            color: #fff;
            background-color: #495057;
        }
        .sidebar .nav-link i {
            margin-right: 10px;
        }
        .dashboard-card {
            border-radius: 10px;
            transition: transform 0.3s;
            border: none;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .dashboard-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
        }
        .welcome-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-radius: 15px;
            padding: 2rem !important;
        }
        .stat-number {
            font-size: 2.5rem;
            font-weight: bold;
            margin-bottom: 0.5rem;
        }
        .recent-activity-item {
            border-left: 3px solid #007bff;
            padding-left: 15px;
            margin-bottom: 15px;
        }
        .quick-action-btn {
            transition: all 0.3s ease;
        }
        .quick-action-btn:hover {
            transform: scale(1.05);
        }
        .notification-badge {
            position: absolute;
            top: -5px;
            right: -5px;
        }
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <!-- Include Sidebar -->
            <jsp:include page="sidebar.jsp" />

            <!-- Main Content -->
            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                <!-- Welcome Header -->
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-4">
                    <div class="welcome-header w-100">
                        <div class="row align-items-center">
                            <div class="col-md-8">
                                <h1 class="h2 mb-3">Welcome back, Dr. <%= session.getAttribute("facultyName") != null ? session.getAttribute("facultyName") : "Faculty" %>! <i class="fas fa-hand-wave text-warning"></i></h1>
                                <p class="lead mb-2">Here's what's happening with your students today</p>
                                <small class="d-block">
                                    <i class="fas fa-calendar me-1"></i>
                                    <span id="currentDate"><%= new SimpleDateFormat("EEEE, MMMM d, yyyy").format(new Date()) %></span>
                                </small>
                            </div>
                            <div class="col-md-4 text-end">
                                <div class="bg-white text-dark rounded p-3 d-inline-block">
                                    <i class="fas fa-clock me-2 text-primary"></i>
                                    <span id="currentTime" class="fw-bold"><%= new SimpleDateFormat("hh:mm:ss a").format(new Date()) %></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Quick Stats -->
                <div class="row mb-4">
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card dashboard-card border-primary">
                            <div class="card-body">
                                <div class="d-flex justify-content-between">
                                    <div>
                                        <div class="stat-number text-primary">24</div>
                                        <p class="mb-0 text-muted">Total Reports</p>
                                        <small class="text-success"><i class="fas fa-arrow-up"></i> 12% from last month</small>
                                    </div>
                                    <div class="align-self-center">
                                        <i class="fas fa-file-alt fa-3x text-primary opacity-75"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card dashboard-card border-warning">
                            <div class="card-body">
                                <div class="d-flex justify-content-between">
                                    <div>
                                        <div class="stat-number text-warning">8</div>
                                        <p class="mb-0 text-muted">Pending Reports</p>
                                        <small class="text-danger">Need attention</small>
                                    </div>
                                    <div class="align-self-center">
                                        <i class="fas fa-clock fa-3x text-warning opacity-75"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card dashboard-card border-success">
                            <div class="card-body">
                                <div class="d-flex justify-content-between">
                                    <div>
                                        <div class="stat-number text-success">45</div>
                                        <p class="mb-0 text-muted">Total Students</p>
                                        <small class="text-success">All sections</small>
                                    </div>
                                    <div class="align-self-center">
                                        <i class="fas fa-users fa-3x text-success opacity-75"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card dashboard-card border-info">
                            <div class="card-body">
                                <div class="d-flex justify-content-between">
                                    <div>
                                        <div class="stat-number text-info">16</div>
                                        <p class="mb-0 text-muted">Completed</p>
                                        <small class="text-success">This week</small>
                                    </div>
                                    <div class="align-self-center">
                                        <i class="fas fa-check-circle fa-3x text-info opacity-75"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <!-- Recent Reports & Activities -->
                    <div class="col-lg-8">
                        <!-- Recent Reports -->
                        <div class="card mb-4">
                            <div class="card-header bg-white d-flex justify-content-between align-items-center">
                                <h5 class="card-title mb-0">
                                    <i class="fas fa-file-contract me-2 text-primary"></i>Recent Student Reports
                                </h5>
                                <a href="viewReports.jsp" class="btn btn-sm btn-outline-primary">View All</a>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead class="table-light">
                                            <tr>
                                                <th>Student</th>
                                                <th>Report Type</th>
                                                <th>Submission Date</th>
                                                <th>Status</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <div class="d-flex align-items-center">
                                                        <img src="https://via.placeholder.com/35" class="rounded-circle me-2" alt="Student">
                                                        <div>
                                                            <strong>John Doe</strong>
                                                            <br><small class="text-muted">STU001</small>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>Progress Report</td>
                                                <td>Jan 15, 2024</td>
                                                <td><span class="badge bg-success">Completed</span></td>
                                                <td>
                                                    <button class="btn btn-sm btn-outline-primary"><i class="fas fa-eye"></i></button>
                                                    <button class="btn btn-sm btn-outline-warning"><i class="fas fa-edit"></i></button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="d-flex align-items-center">
                                                        <img src="https://via.placeholder.com/35" class="rounded-circle me-2" alt="Student">
                                                        <div>
                                                            <strong>Jane Smith</strong>
                                                            <br><small class="text-muted">STU002</small>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>Performance Review</td>
                                                <td>Jan 14, 2024</td>
                                                <td><span class="badge bg-warning">Pending</span></td>
                                                <td>
                                                    <button class="btn btn-sm btn-outline-primary"><i class="fas fa-eye"></i></button>
                                                    <button class="btn btn-sm btn-outline-warning"><i class="fas fa-edit"></i></button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="d-flex align-items-center">
                                                        <img src="https://via.placeholder.com/35" class="rounded-circle me-2" alt="Student">
                                                        <div>
                                                            <strong>Mike Johnson</strong>
                                                            <br><small class="text-muted">STU003</small>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>Assessment</td>
                                                <td>Jan 13, 2024</td>
                                                <td><span class="badge bg-success">Completed</span></td>
                                                <td>
                                                    <button class="btn btn-sm btn-outline-primary"><i class="fas fa-eye"></i></button>
                                                    <button class="btn btn-sm btn-outline-warning"><i class="fas fa-edit"></i></button>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <!-- Recent Activity -->
                        <div class="card">
                            <div class="card-header bg-white">
                                <h5 class="card-title mb-0">
                                    <i class="fas fa-history me-2 text-info"></i>Recent Activity
                                </h5>
                            </div>
                            <div class="card-body">
                                <div class="recent-activity-item">
                                    <div class="d-flex justify-content-between">
                                        <h6 class="mb-1">Report Submitted</h6>
                                        <small class="text-muted">2 hours ago</small>
                                    </div>
                                    <p class="mb-1">Progress report for Sarah Wilson has been submitted</p>
                                </div>
                                <div class="recent-activity-item">
                                    <div class="d-flex justify-content-between">
                                        <h6 class="mb-1">New Student Added</h6>
                                        <small class="text-muted">5 hours ago</small>
                                    </div>
                                    <p class="mb-1">David Brown has been assigned to your class</p>
                                </div>
                                <div class="recent-activity-item">
                                    <div class="d-flex justify-content-between">
                                        <h6 class="mb-1">Report Updated</h6>
                                        <small class="text-muted">1 day ago</small>
                                    </div>
                                    <p class="mb-1">Updated assessment report for Emily Davis</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Quick Actions & Notifications -->
                    <div class="col-lg-4">
                        <!-- Quick Actions -->
                        <div class="card mb-4">
                            <div class="card-header bg-white">
                                <h5 class="card-title mb-0">
                                    <i class="fas fa-bolt me-2 text-warning"></i>Quick Actions
                                </h5>
                            </div>
                            <div class="card-body">
                                <div class="d-grid gap-3">
                                    <a href="createReport.jsp" class="btn btn-primary btn-lg quick-action-btn">
                                        <i class="fas fa-plus me-2"></i>Create New Report
                                    </a>
                                    <a href="students.jsp" class="btn btn-outline-primary quick-action-btn">
                                        <i class="fas fa-user-graduate me-2"></i>Manage Students
                                    </a>
                                    <a href="reports.jsp" class="btn btn-outline-success quick-action-btn">
                                        <i class="fas fa-chart-bar me-2"></i>View Analytics
                                    </a>
                                    <a href="templates.jsp" class="btn btn-outline-info quick-action-btn">
                                        <i class="fas fa-file-alt me-2"></i>Report Templates
                                    </a>
                                </div>
                            </div>
                        </div>

                        <!-- Notifications -->
                        <div class="card">
                            <div class="card-header bg-white d-flex justify-content-between align-items-center">
                                <h5 class="card-title mb-0">
                                    <i class="fas fa-bell me-2 text-danger"></i>Notifications
                                    <span class="badge bg-danger notification-badge">3</span>
                                </h5>
                                <a href="#" class="btn btn-sm btn-outline-secondary">Clear All</a>
                            </div>
                            <div class="card-body p-0">
                                <div class="list-group list-group-flush">
                                    <a href="#" class="list-group-item list-group-item-action">
                                        <div class="d-flex w-100 justify-content-between">
                                            <h6 class="mb-1 text-danger"><i class="fas fa-exclamation-circle me-2"></i>Deadline Approaching</h6>
                                            <small class="text-muted">1 hour ago</small>
                                        </div>
                                        <p class="mb-1">Progress reports due in 2 days</p>
                                        <small class="text-muted">Complete pending reports</small>
                                    </a>
                                    <a href="#" class="list-group-item list-group-item-action">
                                        <div class="d-flex w-100 justify-content-between">
                                            <h6 class="mb-1 text-success"><i class="fas fa-user-plus me-2"></i>New Assignment</h6>
                                            <small class="text-muted">3 hours ago</small>
                                        </div>
                                        <p class="mb-1">5 new students assigned to your class</p>
                                        <small class="text-muted">View student profiles</small>
                                    </a>
                                    <a href="#" class="list-group-item list-group-item-action">
                                        <div class="d-flex w-100 justify-content-between">
                                            <h6 class="mb-1 text-info"><i class="fas fa-sync-alt me-2"></i>System Update</h6>
                                            <small class="text-muted">1 day ago</small>
                                        </div>
                                        <p class="mb-1">Portal updated to version 2.1</p>
                                        <small class="text-muted">New features available</small>
                                    </a>
                                </div>
                            </div>
                        </div>

                        <!-- Upcoming Deadlines -->
                        <div class="card mt-4">
                            <div class="card-header bg-white">
                                <h5 class="card-title mb-0">
                                    <i class="fas fa-calendar-alt me-2 text-success"></i>Upcoming Deadlines
                                </h5>
                            </div>
                            <div class="card-body">
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <div>
                                        <h6 class="mb-1">Progress Reports</h6>
                                        <small class="text-muted">Due in 2 days</small>
                                    </div>
                                    <span class="badge bg-warning">8 pending</span>
                                </div>
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <div>
                                        <h6 class="mb-1">Mid-term Assessments</h6>
                                        <small class="text-muted">Due in 1 week</small>
                                    </div>
                                    <span class="badge bg-info">Not started</span>
                                </div>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div>
                                        <h6 class="mb-1">Final Evaluations</h6>
                                        <small class="text-muted">Due in 3 weeks</small>
                                    </div>
                                    <span class="badge bg-secondary">Upcoming</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Update current time every second
        function updateTime() {
            const now = new Date();
            const timeString = now.toLocaleTimeString('en-US', { 
                hour: '2-digit', 
                minute: '2-digit', 
                second: '2-digit',
                hour12: true 
            });
            document.getElementById('currentTime').textContent = timeString;
        }
        
        // Update time immediately and then every second
        updateTime();
        setInterval(updateTime, 1000);

        // Add some interactive features
        document.addEventListener('DOMContentLoaded', function() {
            // Add click animation to cards
            const cards = document.querySelectorAll('.dashboard-card');
            cards.forEach(card => {
                card.addEventListener('click', function() {
                    this.style.transform = 'translateY(-8px)';
                    setTimeout(() => {
                        this.style.transform = 'translateY(-5px)';
                    }, 150);
                });
            });
        });
    </script>
</body>
</html>