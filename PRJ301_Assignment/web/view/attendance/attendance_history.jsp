<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Attendance History and Performance Analysis</title>
        <style>
            /* Định dạng chung cho trang */
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 20px;
                background-color: #f7f9fc;
            }

            h2 {
                color: #333;
                text-align: center;
            }

            /* Định dạng form */
            form {
                text-align: center;
                margin-bottom: 20px;
            }

            label {
                font-weight: bold;
                margin-right: 10px;
            }

            input[type="number"] {
                padding: 8px;
                font-size: 14px;
                width: 120px;
                border: 1px solid #ccc;
                border-radius: 4px;
                margin-right: 10px;
            }

            button {
                padding: 8px 15px;
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 14px;
            }

            button:hover {
                background-color: #0056b3;
            }

            /* Định dạng bảng */
            table {
                width: 100%;
                max-width: 1000px;
                margin: 0 auto;
                border-collapse: collapse;
                background-color: white;
                box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
                overflow: hidden;
            }

            th, td {
                padding: 12px;
                border: 1px solid #ddd;
                text-align: center;
                font-size: 14px;
            }

            th {
                background-color: #007bff;
                color: white;
                font-weight: bold;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            /* Định dạng cho các trạng thái */
            .status-achieved {
                color: green;
                font-weight: bold;
            }

            .status-not-achieved {
                color: red;
                font-weight: bold;
            }

            .status-exceeded {
                color: blue;
                font-weight: bold;
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
        <button class="home-button" onclick="window.location.href = '/assignment/home'">Home</button>
        <h2>Attendance History and Performance Analysis</h2>
        <form action="emphistory" method="post">
            <label for="employeeId">Select Employee ID:</label>
            <input type="number" name="employeeId" id="employeeId" value="${employeeId}" required>
            <button type="submit">View History</button>
        </form>
        <table>
            <thead>
                <tr>
                    <th>Date</th>
                    <th>Shift</th>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Planned Quantity</th>
                    <th>Completed Quantity</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="se" items="${attendanceHistory}">
                    <tr>
                        <td>${se.schedualCampaign.date}</td>
                        <td>${se.schedualCampaign.shift}</td>
                        <td>${se.schedualCampaign.planCampaign.product.id}</td>
                        <td>${se.schedualCampaign.planCampaign.product.name}</td>
                        <td>${se.quantity}</td>
                        <td>${se.attendance.quantity}</td>
                        <td>
                            <span class="${se.status == 'Achieved the target' ? 'status-achieved' : (se.status == 'Not achieved the target' ? 'status-not-achieved' : 'status-exceeded')}">
                                ${se.status}
                            </span>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="/assignment/logout" class="logout-link">Logout</a>
    </body>
</html>
