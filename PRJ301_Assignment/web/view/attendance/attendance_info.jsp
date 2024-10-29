<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Attendance</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f8ff; /* Màu nền nhẹ */
            margin: 0;
            padding: 20px;
            position: relative; /* Cần thiết để định vị các phần tử con */
        }
        
        h1 {
            color: #007acc; /* Xanh da trời đậm */
            text-align: center;
        }

        form {
            background-color: #e6f7ff; /* Nền cho form */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #005e99; /* Màu chữ cho label */
        }

        select {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #007acc; /* Viền chọn */
            border-radius: 4px;
        }

        button {
            background-color: #007acc; /* Màu nút */
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }

        button:hover {
            background-color: #005e99; /* Màu nút khi hover */
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #007acc; /* Viền cho table */
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #007acc; /* Nền cho header table */
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2; /* Nền cho hàng chẵn */
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
    </style>
</head>
<body>
    <h1>Attendance Management</h1>

    <form action="attendanceinfo" method="post">
        <!-- Dropdown for Department -->
        <label for="departmentId">Department:</label>
        <select name="departmentId" id="departmentId" required>
            <c:forEach var="department" items="${departments}">
                <option value="${department.id}"
                    <c:if test="${department.id == selectedDepartmentId}">selected</c:if> >
                    ${department.name}
                </option>
            </c:forEach>
        </select>

        <!-- Dropdown for Date -->
        <label for="date">Date:</label>
        <select name="date" id="date" required>
            <c:forEach var="date" items="${dates}">
                <option value="${date}" 
                    <c:if test="${date == selectedDate}">selected</c:if> >
                    ${date}
                </option>
            </c:forEach>
        </select>

        <!-- Dropdown for Shift -->
        <label for="shift">Shift:</label>
        <select name="shift" id="shift" required>
            <option value="1" <c:if test="${selectedShift == 1}">selected</c:if> >Shift 1</option>
            <option value="2" <c:if test="${selectedShift == 2}">selected</c:if> >Shift 2</option>
            <option value="3" <c:if test="${selectedShift == 3}">selected</c:if> >Shift 3</option>
        </select>

        <button type="submit">Get Attendance</button>
    </form>

    <hr>

    <!-- Attendance Information Table -->
    <c:if test="${not empty attendanceInfo}">
        <h2>Attendance Details</h2>
        <table>
            <thead>
                <tr>
                    <th>Employee ID</th>
                    <th>Employee Name</th>
                    <th>Department</th>
                    <th>Planned Quantity</th>
                    <th>Completed Quantity</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="se" items="${attendanceInfo}">
                    <tr>
                        <td>${se.employee.id}</td>
                        <td>${se.employee.employeeName}</td>
                        <td>${se.employee.department.name}</td>
                        <td>${se.quantity}</td>
                        <td>${se.attendance.quantity}</td>
                        <td>${se.status}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>
    <a href="/assignment/logout" class="logout-link">Logout</a>
</body>
</html>
