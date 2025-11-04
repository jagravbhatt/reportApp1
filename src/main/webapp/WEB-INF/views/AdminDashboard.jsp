<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel - Student Management</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: #f5f7fa;
            color: #333;
            line-height: 1.6;
        }
        
        .container {
            display: flex;
            min-height: 100vh;
        }
        
        /* Sidebar Styles */
        .sidebar {
            width: 250px;
            background: linear-gradient(to bottom, #2c3e50, #3498db);
            color: white;
            padding: 20px 0;
            box-shadow: 2px 0 10px rgba(0, 0, 0, 0.1);
        }
        
        .sidebar-header {
            padding: 0 20px 20px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            margin-bottom: 20px;
        }
        
        .sidebar-header h2 {
            font-size: 1.5rem;
            display: flex;
            align-items: center;
        }
        
        .sidebar-header h2 i {
            margin-right: 10px;
            font-size: 1.8rem;
        }
        
        .sidebar-menu {
            list-style: none;
        }
        
        .sidebar-menu li {
            padding: 12px 20px;
            transition: all 0.3s;
            cursor: pointer;
            display: flex;
            align-items: center;
        }
        
        .sidebar-menu li:hover {
            background-color: rgba(255, 255, 255, 0.1);
        }
        
        .sidebar-menu li.active {
            background-color: rgba(255, 255, 255, 0.2);
            border-left: 4px solid #e74c3c;
        }
        
        .sidebar-menu li i {
            margin-right: 10px;
            font-size: 1.2rem;
        }
        
        /* Main Content Styles */
        .main-content {
            flex: 1;
            padding: 20px;
            overflow-y: auto;
        }
        
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            padding-bottom: 15px;
            border-bottom: 1px solid #e0e0e0;
        }
        
        .header h1 {
            color: #2c3e50;
            font-size: 1.8rem;
        }
        
        .user-info {
            display: flex;
            align-items: center;
        }
        
        .user-info img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin-right: 10px;
            border: 2px solid #3498db;
        }
        
        /* Card Styles */
        .card {
            background: white;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            overflow: hidden;
        }
        
        .card-header {
            padding: 15px 20px;
            background-color: #3498db;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .card-body {
            padding: 20px;
        }
        
        /* Table Styles */
        table {
            width: 100%;
            border-collapse: collapse;
        }
        
        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #e0e0e0;
        }
        
        th {
            background-color: #f8f9fa;
            font-weight: 600;
            color: #2c3e50;
        }
        
        tr:hover {
            background-color: #f8f9fa;
        }
        
        /* Button Styles */
        .btn {
            padding: 8px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: 500;
            transition: all 0.3s;
            margin: 2px;
        }
        
        .btn-edit {
            background-color: #f39c12;
            color: white;
        }
        
        .btn-delete {
            background-color: #e74c3c;
            color: white;
        }
        
        .btn-report {
            background-color: #3498db;
            color: white;
        }
        
        .btn:hover {
            opacity: 0.9;
            transform: translateY(-2px);
        }
        
       
        .pagination {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 20px;
            padding: 10px 0;
        }
        
        .pagination-info {
            color: #7f8c8d;
        }
        
        .pagination-controls {
            display: flex;
            gap: 10px;
        }
        
        .pagination-btn {
            padding: 8px 15px;
            background-color: #ecf0f1;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: all 0.3s;
        }
        
        .pagination-btn:hover {
            background-color: #bdc3c7;
        }
        
      
        .pdf-viewer {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.8);
            z-index: 1000;
            justify-content: center;
            align-items: center;
        }
        
        .pdf-container {
            width: 80%;
            height: 90%;
            background-color: white;
            border-radius: 8px;
            overflow: hidden;
            display: flex;
            flex-direction: column;
        }
        
        .pdf-header {
            padding: 15px;
            background-color: #2c3e50;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .pdf-content {
            flex: 1;
            padding: 20px;
            overflow-y: auto;
        }
        
        .pdf-actions {
            display: flex;
            gap: 10px;
        }
        
        .close-btn {
            background: none;
            border: none;
            color: white;
            font-size: 1.5rem;
            cursor: pointer;
        }
        
       
        @media (max-width: 992px) {
            .container {
                flex-direction: column;
            }
            
            .sidebar {
                width: 100%;
                height: auto;
            }
            
            .sidebar-menu {
                display: flex;
                overflow-x: auto;
            }
            
            .sidebar-menu li {
                white-space: nowrap;
            }
        }
        
        @media (max-width: 768px) {
            table {
                display: block;
                overflow-x: auto;
            }
            
            .header {
                flex-direction: column;
                align-items: flex-start;
            }
            
            .user-info {
                margin-top: 10px;
            }
            
            .btn {
                padding: 6px 10px;
                font-size: 0.8rem;
            }
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <div class="container">
        <!-- Sidebar -->
        <div class="sidebar">
            <div class="sidebar-header">
                <h2><i class="fas fa-user-shield"></i> Admin Panel</h2>
            </div>
            <ul class="sidebar-menu">
                <li class="active"><i class="fas fa-tachometer-alt"></i> Dashboard</li>
                <li><i class="fas fa-users"></i> All Students</li>
                <li><i class="fas fa-user-plus"></i> Add User</li>
                <li id="reports-menu"><i class="fas fa-file-pdf"></i> Reports</li>
                <li><i class="fas fa-cog"></i> Settings</li>
                <li><i class="fas fa-sign-out-alt"></i> Logout</li>
            </ul>
        </div>
        
        
        <div class="main-content">
            <div class="header">
                <h1>Tool Students</h1>
                <div class="user-info">
                    <img src="https://ui-avatars.com/api/?name=Admin+User&background=3498db&color=fff" alt="Admin User">
                    <span>Admin User</span>
                </div>
            </div>
            
         
            <div class="card">
                <div class="card-header">
                    <h3>All Students</h3>
                    <button class="btn btn-report" id="add-report-btn">
                        <i class="fas fa-plus"></i> Add Report
                    </button>
                </div>
                <div class="card-body">
                    <table>
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
                                <td>nagariya</td>
                                <td>-</td>
                                <td>Male</td>
                                <td>dev@gmail.com</td>
                                <td>123457654</td>
                                <td>cub</td>
                                <td>Student</td>
                                <td>Electronics</td>
                                <td>
                                    <button class="btn btn-edit"><i class="fas fa-edit"></i> Edit</button>
                                    <button class="btn btn-delete"><i class="fas fa-trash"></i> Delete</button>
                                    <button class="btn btn-report add-report" data-student="nagariya">
                                        <i class="fas fa-file-pdf"></i> Add Report
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td>baxi</td>
                                <td>-</td>
                                <td>Male</td>
                                <td>y@gmail.com</td>
                                <td>1234567087654</td>
                                <td>one to one</td>
                                <td>Student</td>
                                <td>ahmedabad</td>
                                <td>
                                    <button class="btn btn-edit"><i class="fas fa-edit"></i> Edit</button>
                                    <button class="btn btn-delete"><i class="fas fa-trash"></i> Delete</button>
                                    <button class="btn btn-report add-report" data-student="baxi">
                                        <i class="fas fa-file-pdf"></i> Add Report
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td>popat</td>
                                <td>-</td>
                                <td>Male</td>
                                <td>y@gmail.com</td>
                                <td>1234567564534</td>
                                <td>gen 25</td>
                                <td>Student</td>
                                <td>ahmedabad</td>
                                <td>
                                    <button class="btn btn-edit"><i class="fas fa-edit"></i> Edit</button>
                                    <button class="btn btn-delete"><i class="fas fa-trash"></i> Delete</button>
                                    <button class="btn btn-report add-report" data-student="popat">
                                        <i class="fas fa-file-pdf"></i> Add Report
                                    </button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    
                    <div class="pagination">
                        <div class="pagination-info">
                            Showing 1 to 6 of 6 entries
                        </div>
                        <div class="pagination-controls">
                            <button class="pagination-btn">Back to Dashboard</button>
                            <button class="pagination-btn">Previous</button>
                            <button class="pagination-btn">Next</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
   
    <div class="pdf-viewer" id="pdfViewer">
        <div class="pdf-container">
            <div class="pdf-header">
                <h3 id="pdf-title">Student Report</h3>
                <div class="pdf-actions">
                    <button class="btn btn-report" id="download-pdf"><i class="fas fa-download"></i> Download</button>
                    <button class="btn btn-edit" id="print-pdf"><i class="fas fa-print"></i> Print</button>
                    <button class="close-btn" id="close-pdf"><i class="fas fa-times"></i></button>
                </div>
            </div>
            <div class="pdf-content" id="pdf-content">
                
            </div>
        </div>
    </div>

    <script>
        
        const pdfViewer = document.getElementById('pdfViewer');
        const pdfTitle = document.getElementById('pdf-title');
        const pdfContent = document.getElementById('pdf-content');
        const addReportButtons = document.querySelectorAll('.add-report');
        const addReportBtn = document.getElementById('add-report-btn');
        const reportsMenu = document.getElementById('reports-menu');
        const closePdfBtn = document.getElementById('close-pdf');
        const downloadPdfBtn = document.getElementById('download-pdf');
        const printPdfBtn = document.getElementById('print-pdf');

   
        function showPdfViewer(studentName) {
         
            pdfTitle.textContent = `Student Report - ${studentName}`;
            
          
            let studentData = getStudentData(studentName);
            
          
            pdfContent.innerHTML = `
                <h4>Student Performance Report</h4>
                <p><strong>Name:</strong> ${studentData.name}</p>
                <p><strong>Email:</strong> ${studentData.email}</p>
                <p><strong>Batch:</strong> ${studentData.batch}</p>
                <p><strong>Branch:</strong> ${studentData.branch}</p>
                
                <h5>Academic Performance</h5>
                <table>
                    <thead>
                        <tr>
                            <th>Subject</th>
                            <th>Marks</th>
                            <th>Grade</th>
                        </tr>
                    </thead>
                    <tbody>
                        ${studentData.subjects.map(subject => `
                            <tr>
                                <td>${subject.name}</td>
                                <td>${subject.marks}</td>
                                <td>${subject.grade}</td>
                            </tr>
                        `).join('')}
                    </tbody>
                </table>
                
                <h5>Attendance Summary</h5>
                <p>Overall Attendance: ${studentData.attendance}%</p>
                
                <h5>Teacher's Remarks</h5>
                <p>${studentData.remarks}</p>
            `;
            
           
            pdfViewer.style.display = 'flex';
        }

        
        function getStudentData(studentName) {
            const studentData = {
                'nagariya': {
                    name: 'nagariya',
                    email: 'dev@gmail.com',
                    batch: 'cub',
                    branch: 'Electronics',
                    attendance: '92',
                    subjects: [
                        { name: 'Mathematics', marks: '85/100', grade: 'A' },
                        { name: 'Physics', marks: '78/100', grade: 'B+' },
                        { name: 'Electronics', marks: '92/100', grade: 'A+' }
                    ],
                    remarks: 'Nagariya is a diligent student with excellent problem-solving skills. He shows great potential in electronics and has consistently performed well in practical assignments.'
                },
                'baxi': {
                    name: 'baxi',
                    email: 'y@gmail.com',
                    batch: 'one to one',
                    branch: 'ahmedabad',
                    attendance: '88',
                    subjects: [
                        { name: 'Mathematics', marks: '75/100', grade: 'B' },
                        { name: 'Physics', marks: '82/100', grade: 'B+' },
                        { name: 'Computer Science', marks: '90/100', grade: 'A' }
                    ],
                    remarks: 'Baxi shows consistent improvement in his academic performance. He actively participates in class discussions and has good analytical skills.'
                },
                'popat': {
                    name: 'popat',
                    email: 'y@gmail.com',
                    batch: 'gen 25',
                    branch: 'ahmedabad',
                    attendance: '95',
                    subjects: [
                        { name: 'Mathematics', marks: '92/100', grade: 'A' },
                        { name: 'Chemistry', marks: '88/100', grade: 'B+' },
                        { name: 'Biology', marks: '94/100', grade: 'A' }
                    ],
                    remarks: 'Popat is an outstanding student with excellent academic records. He demonstrates strong leadership qualities and actively participates in extracurricular activities.'
                }
            };
            
            return studentData[studentName] || studentData['nagariya'];
        }

        
        function closePdfViewer() {
            pdfViewer.style.display = 'none';
        }

       
        document.addEventListener('DOMContentLoaded', function() {
            
            addReportButtons.forEach(button => {
                button.addEventListener('click', function() {
                    const studentName = this.getAttribute('data-student');
                    showPdfViewer(studentName);
                });
            });
            
            
            addReportBtn.addEventListener('click', function() {
                showPdfViewer('nagariya'); 
            });
            
           
            reportsMenu.addEventListener('click', function() {
                showPdfViewer('nagariya'); // Default to first student
            });
            
           
            closePdfBtn.addEventListener('click', closePdfViewer);
            
           
            downloadPdfBtn.addEventListener('click', function() {
                alert('PDF download functionality would be implemented here');
                
            });
            
            
            printPdfBtn.addEventListener('click', function() {
                window.print();
            });
            
         
            pdfViewer.addEventListener('click', function(e) {
                if (e.target === this) {
                    closePdfViewer();
                }
            });
            
            
            const sidebarItems = document.querySelectorAll('.sidebar-menu li');
            sidebarItems.forEach(item => {
                item.addEventListener('click', function() {
                    sidebarItems.forEach(i => i.classList.remove('active'));
                    this.classList.add('active');
                });
            });
        });
    </script>
</body>
</html>