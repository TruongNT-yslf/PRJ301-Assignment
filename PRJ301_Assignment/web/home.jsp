<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Home</title>
        <style>
            /* Cấu trúc tổng thể */
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: #f0f4f8;
                color: #333;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                position: relative;
            }

            /* Container chính */
            .container {
                max-width: 700px;
                width: 90%;
                background-color: #ffffff;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
                text-align: center;
                animation: fadeIn 0.5s ease;
            }

            /* Hiệu ứng vào màn hình */
            @keyframes fadeIn {
                from {
                    opacity: 0;
                }
                to {
                    opacity: 1;
                }
            }

            /* Tiêu đề chính */
            h1 {
                color: #0056b3;
                font-size: 2.2em;
                margin-bottom: 15px;
                font-weight: 700;
            }

            /* Tin nhắn chào mừng */
            .welcome-message {
                font-size: 1.3em;
                color: #2d87f0;
                margin-bottom: 20px;
                font-weight: bold;
                background-color: #e0f3ff;
                padding: 10px 15px;
                border-radius: 8px;
                box-shadow: 0 2px 6px rgba(0, 123, 255, 0.1);
                display: inline-block;
            }

            /* Nút Logout ở góc phải dưới */
            .logout-link {
                position: absolute;
                bottom: 20px;
                right: 20px;
                padding: 10px 20px;
                background-color: #ff4d4d;
                color: #fff;
                text-decoration: none;
                border-radius: 5px;
                font-weight: bold;
                transition: background-color 0.3s;
            }

            .logout-link:hover {
                background-color: #e63946;
            }

            /* Danh sách vai trò */
            ul.role-list {
                list-style-type: none;
                padding: 0;
                margin: 0;
            }

            /* Vai trò */
            li.role-item {
                margin-bottom: 25px;
                padding: 20px;
                background-color: #f9fbfd;
                border-radius: 10px;
                box-shadow: 0 3px 6px rgba(0, 0, 0, 0.1);
                text-align: left;
                transition: transform 0.3s;
            }

            li.role-item:hover {
                transform: scale(1.02);
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.15);
            }

            /* Tiêu đề vai trò */
            .role-title {
                font-size: 1.3em;
                color: #444;
                margin-bottom: 5px;
                font-weight: 600;
            }

            /* Mô tả tính năng */
            .feature-list-title {
                color: #0073e6;
                font-size: 1.1em;
                font-weight: bold;
                margin-bottom: 10px;
                padding: 5px;
                border-left: 4px solid #0073e6;
                background-color: #f0f7ff;
                display: inline-block;
            }

            /* Danh sách tính năng của vai trò */
            ul.feature-list {
                list-style-type: none;
                margin: 0;
                padding: 0;
            }

            li.feature-item {
                background-color: #e9f5ff;
                margin: 6px 0;
                padding: 10px;
                border-radius: 5px;
                transition: background-color 0.3s;
            }

            li.feature-item:hover {
                background-color: #d4ebff;
            }

            /* Liên kết tính năng */
            a.feature-link {
                text-decoration: none;
                color: #0073e6;
                font-weight: 500;
                transition: color 0.3s;
            }

            a.feature-link:hover {
                color: #0056b3;
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Home Page</h1>
            <p class="welcome-message">Chào mừng, ${sessionScope.account.employee.employeeName}!</p>

            <ul class="role-list">
                <!-- Lặp qua từng vai trò trong requestScope.roles -->
                <c:forEach var="role" items="${requestScope.roles}">
                    <li class="role-item">
                        <div class="role-title">Your role: ${role.name}</div>
                        <div class="feature-list-title">Available Features:</div>
                        <ul class="feature-list">
                            <c:forEach var="feature" items="${role.features}">
                                <li class="feature-item">
                                    <a class="feature-link" href="/assignment${feature.url}">${feature.name}</a>
                                </li>
                            </c:forEach>
                        </ul>
                    </li>
                </c:forEach>
            </ul>

            <a href="/assignment/logout" class="logout-link">Logout</a>
        </div>
    </body>
</html>
