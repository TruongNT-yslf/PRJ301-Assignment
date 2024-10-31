<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Top Productivity Employees</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #e9f5ff; /* Light blue background */
                color: #333;
                margin: 0;
                padding: 20px;
            }
            h2 {
                color: #0056b3; /* Dark blue for headings */
                text-align: center;
            }
            .department {
                font-weight: bold;
                font-size: 1.5em;
                margin-top: 20px;
                color: #003366; /* Darker blue for department names */
            }
            .employee-table {
                width: 100%;
                border-collapse: collapse;
                margin: 20px 0;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* Subtle shadow for depth */
            }
            .employee-table th, .employee-table td {
                border: 1px solid #007bff; /* Blue border */
                padding: 12px;
                text-align: left;
            }
            .employee-table th {
                background-color: #007bff; /* Blue header background */
                color: white; /* White text for contrast */
            }
            .employee-table tr:nth-child(even) {
                background-color: #f2f9ff; /* Light blue for even rows */
            }
            .employee-table tr:hover {
                background-color: #d1e7ff; /* Light blue on hover */
            }
            .logout-link {
                position: fixed; /* Đặt vị trí cố định */
                bottom: 20px; /* Cách đáy 20px */
                right: 20px; /* Cách bên phải 20px */
                background-color: red; /* Màu đỏ */
                color: white; /* Màu chữ trắng */
                padding: 10px 15px; /* Padding cho nút */
                border: none;
                border-radius: 5px;
                cursor: pointer;
                text-decoration: none; /* Bỏ gạch chân */
                font-size: 16px;
            }

            .logout-link:hover {
                background-color: darkred; /* Màu đỏ đậm khi hover */
            }
            .home-button {
                position: absolute; /* Positioning the button */
                top: 20px; /* Distance from the top */
                left: 20px; /* Distance from the left */
                background-color: #007bff; /* Blue background */
                color: white; /* White text */
                border: none; /* No border */
                padding: 10px 15px; /* Padding for the button */
                font-size: 1em; /* Font size */
                cursor: pointer; /* Pointer cursor on hover */
                border-radius: 5px; /* Rounded corners */
                transition: background-color 0.3s; /* Smooth transition for hover effect */
            }
            .home-button:hover {
                background-color: #0056b3; /* Darker blue on hover */
            }
        </style>
    </head>
    <body>
        <button class="home-button" onclick="window.location.href = '/assignment/home'">Home</button>

        <h2>Top 3 Productivity Employees by Department</h2>

        <c:set var="prevDepartment" value="" />
        <c:forEach var="employee" items="${topEmployees}">
            <!-- If the department changes, display the department name and open a new table -->
            <c:if test="${employee.department.name != prevDepartment}">
                <c:if test="${prevDepartment != ''}">
                </tbody>
            </table>
        </c:if>
        <div class="department">${employee.department.name}</div>
        <table class="employee-table">
            <thead>
                <tr>
                    <th>Employee ID</th>
                    <th>Employee Name</th>
                    <th>Productivity</th>
                </tr>
            </thead>
            <tbody>
                <c:set var="prevDepartment" value="${employee.department.name}" />
            </c:if>

            <!-- Display employee details -->
            <tr>
                <td>${employee.id}</td>
                <td>${employee.employeeName}</td>
                <td>${employee.productivity}</td>
            </tr>
        </c:forEach>

        <!-- Close the last table -->
    </tbody>
</table>
<a href="/assignment/logout" class="logout-link">Logout</a>
</body>
</html>