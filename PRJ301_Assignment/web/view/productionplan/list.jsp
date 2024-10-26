<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Danh sách Kế hoạch Sản xuất</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            padding: 20px;
            background-color: #f8f9fa;
        }
        h1 {
            margin-bottom: 20px;
            color: #343a40;
        }
        table {
            margin-top: 20px;
            border-radius: 0.5rem;
            overflow: hidden;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }
        thead {
            background-color: #007bff;
            color: white;
        }
        th, td {
            vertical-align: middle;
            text-align: center;
            padding: 15px 20px; /* Tăng padding để làm to các ô */
        }
        tbody tr:hover {
            background-color: #e9ecef;
        }
        .status-completed {
            background-color: #28a745;
            color: white;
            border-radius: 0.25rem;
            padding: 5px 10px;
        }
        .status-late {
            background-color: #dc3545;
            color: white;
            border-radius: 0.25rem;
            padding: 5px 10px;
        }
        .status-on-going {
            background-color: #ffc107;
            color: black;
            border-radius: 0.25rem;
            padding: 5px 10px;
        }
    </style>
</head>
<body>
    <h1>Danh sách Kế hoạch Sản xuất</h1>
    <table class="table table-bordered table-striped">
        <thead>
            <tr>
                <th>Plan ID</th>
                <th>Plan Name</th>
                <th>Start</th>
                <th>End</th>
                <th>Tổng lũy kế</th>
                <th>Số lượng còn lại so với kế hoạch</th>
                <th>Trạng thái</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="plan" items="${plans}">
                <tr>
                    <td>${plan.id}</td>
                    <td>${plan.name}</td>
                    <td>${plan.start}</td>
                    <td>${plan.end}</td>
                    <td>${plan.totalAccumulate}</td>
                    <td>${plan.remainingQuantity}</td>
                    <td>
                        <c:choose>
                            <c:when test="${plan.status == 'Completed'}">
                                <span class="status-completed">Completed</span>
                            </c:when>
                            <c:when test="${plan.status == 'Late'}">
                                <span class="status-late">Late</span>
                            </c:when>
                            <c:otherwise>
                                <span class="status-on-going">On Going</span>
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
