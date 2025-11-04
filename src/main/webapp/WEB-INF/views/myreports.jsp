<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>My Reports</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>
</head>
<body>
<div class="container mt-5">
    <h2>Reports for Student</h2>

    <c:if test="${empty reportList}">
        <div class="alert alert-info">No reports found for this student.</div>
    </c:if>

    <c:if test="${not empty reportList}">
        <table class="table table-bordered table-striped">
            <thead>
            <tr>
                <th>#</th>
                <th>Title</th>
                <th>Description</th>
                <th>Date</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="report" items="${reportList}" varStatus="status">
                <tr>
                    <td>${status.index + 1}</td>
                    <td>${report.title}</td>
                    <td>${report.description}</td>
                    <td>${report.date}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>

    <a href="liststudents" class="btn btn-secondary">Back to Student List</a>
</div>
</body>
</html>
