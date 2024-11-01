<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Danh sách Kế hoạch Sản xuất</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
    /* Định dạng chung */
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f7f9;
        margin: 0;
        padding: 20px;
        color: #333;
    }

    /* Tiêu đề trang */
    h1 {
        color: #4a5568;
        font-size: 2.2em;
        text-align: center;
        margin-bottom: 20px;
        font-weight: bold;
    }

    /* Định dạng nút Home */
    .home-button {
        background-color: #3498db;
        color: #fff;
        border: none;
        padding: 10px 18px;
        font-size: 1em;
        border-radius: 5px;
        cursor: pointer;
        margin-bottom: 20px;
        transition: background-color 0.3s ease;
    }

    .home-button:hover {
        background-color: #2980b9;
    }

    /* Bảng danh sách */
    .table {
        width: 100%;
        max-width: 1000px;
        margin: 0 auto;
        border-collapse: separate;
        border-spacing: 0;
        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
    }

    /* Định dạng tiêu đề và nội dung */
    .table th, .table td {
        padding: 15px;
        vertical-align: middle;
        border: 1px solid #dee2e6;
        text-align: center;
        font-size: 1em;
    }

    .table th {
        background-color: #3498db;
        color: #fff;
        font-weight: bold;
        font-size: 1.1em;
    }

    /* Cột tiêu đề hẹp */
    .table th, .table td {
        width: 10%;  /* Căn cứ cho các cột khác */
    }

    /* Cột “Số lượng còn lại” rộng hơn */
    .table td.remaining-column, .table th.remaining-column {
        width: 30%;  /* Tăng chiều rộng cho cột này */
    }

    /* Hàng sọc */
    .table-striped tbody tr:nth-of-type(odd) {
        background-color: #f9f9f9;
    }

    /* Định dạng trạng thái */
    .status-completed {
        color: #28a745;
        font-weight: bold;
    }

    .status-late {
        color: #e74c3c;
        font-weight: bold;
    }

    .status-on-going {
        color: #f39c12;
        font-weight: bold;
    }

    /* Định dạng liên kết đăng xuất */
    .logout-link {
        position: fixed;
        bottom: 20px;
        right: 20px;
        padding: 10px 25px;
        color: #e74c3c;
        font-weight: bold;
        border: 2px solid #e74c3c;
        border-radius: 5px;
        text-decoration: none;
        transition: background-color 0.3s, color 0.3s;
    }

    .logout-link:hover {
        background-color: #e74c3c;
        color: #fff;
    }
                /* Home Button Styles - bên trái */
            .home-button {
                padding: 10px 20px;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
                transition: all 0.3s;
                min-width: 100px; /* Đảm bảo nút có độ rộng nhất định */
            }

            .home-button:hover {
                background-color: #45a049;
                transform: translateY(-2px);
            }
</style>




    </head>
    <body>
        <button class="home-button" onclick="window.location.href = '/assignment/home'">Home</button>
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
        <a href="/assignment/logout" class="logout-link">Logout</a>
    </body>
</html>
