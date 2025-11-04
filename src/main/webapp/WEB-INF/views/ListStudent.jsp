<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel - Student Management</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        <%-- Insert your CSS here (copy from the original HTML you provided) --%>
        /* You can paste the entire CSS from your original file here for styling */
        /* For brevity, not duplicating it in this message */
    </style>
</head>

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

        <!-- Main Content -->
        <div class="main-content">
            <div class="header">
                <h1>Tool Students</h1>
                <div class="user-info">
                    <img src="https://ui-avatars.com/api/?name=Admin+User&background=3498db&color=fff" alt="Admin User">
                    <span>Admin User</span>
                </div>
            </div>

            <!-- Students Table Card -->
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
                            <c:forEach var="student" items="${studentsList}">
                                <tr>
                                    <td>${student.name}</td>
                                    <td>${student.lastName}</td>
                                    <td>${student.gender}</td>
                                    <td>${student.email}</td>
                                    <td>${student.contact}</td>
                                    <td>${student.batch}</td>
                                    <td>${student.role}</td>
                                    <td>${student.branch}</td>
                                    <td>
                                        <button class="btn btn-edit"><i class="fas fa-edit"></i> Edit</button>
                                        <button class="btn btn-delete"><i class="fas fa-trash"></i> Delete</button>
                                        <button class="btn btn-report add-report" data-student="${student.name}">
                                            <i class="fas fa-file-pdf"></i> Add Report
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <div class="pagination">
                        <div class="pagination-info">
                            Showing ${fn:length(studentsList)} of ${fn:length(studentsList)} entries
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

    <!-- PDF Viewer Modal -->
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
                <!-- PDF content will be dynamically generated here -->
            </div>
        </div>
    </div>

    <!-- JS Script -->
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

        function getStudentData(name) {
            const students = {
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
                    remarks: 'Excellent student with good technical skills.'
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
                    remarks: 'Consistent improvement seen in assignments.'
                },
                'popat': {
                    name: 'popat',
                    email: 'y@gmail.com',
                    batch: 'gen 25',
                    branch: 'ahmedabad',
                    attendance: '95',
                    subjects: [
                        { name: 'Mathematics', marks: '92/100', grade: 'A
