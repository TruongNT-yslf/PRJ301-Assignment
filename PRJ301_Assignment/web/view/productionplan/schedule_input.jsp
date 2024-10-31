<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Production Plan Schedule</title>
        <style>
            /* Reset CSS */
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Arial', sans-serif;
            }

            body {
                background-color: #f5f5f5;
                min-height: 100vh;
                padding: 20px;
                padding-bottom: 80px;
                position: relative;
            }

            /* Header Styles */
            .header {
                display: flex;
                justify-content: space-between; /* Tạo khoảng cách giữa các phần tử */
                align-items: center;
                background-color: #ffffff;
                padding: 20px 40px; /* Tăng padding hai bên */
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                margin-bottom: 30px;
                position: relative; /* Để căn giữa tiêu đề */
            }

            /* Title styles - đặt ở giữa */
            .header h1 {
                color: #333;
                font-size: 24px;
                position: absolute;
                left: 50%;
                transform: translateX(-50%);
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

            /* Logout Link Styles */
            .logout-link {
                position: fixed;
                bottom: 20px;
                right: 20px;
                padding: 12px 24px;
                background-color: #dc3545;
                color: white;
                text-decoration: none;
                border-radius: 50px;
                transition: all 0.3s;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
                z-index: 1000;
                font-size: 16px;
            }

            .logout-link:hover {
                background-color: #c82333;
                transform: translateY(-2px);
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            }

            /* Form Container Styles */
            .form-container {
                background-color: #ffffff;
                padding: 30px;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                max-width: 600px;
                margin: 0 auto;
            }

            .form-title {
                color: #333;
                margin-bottom: 20px;
                font-size: 20px;
            }

            /* Form Elements Styles */
            select {
                width: 100%;
                padding: 12px;
                border: 1px solid #ddd;
                border-radius: 4px;
                margin-bottom: 15px;
                font-size: 16px;
                color: #333;
            }

            select:focus {
                border-color: #4CAF50;
                outline: none;
                box-shadow: 0 0 0 2px rgba(76, 175, 80, 0.2);
            }

            .submit-btn {
                width: 100%;
                padding: 12px;
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
                transition: background-color 0.3s;
            }

            .submit-btn:hover {
                background-color: #0056b3;
            }

            /* Error Message Styles */
            .error-message {
                color: #dc3545;
                margin-bottom: 15px;
                font-size: 14px;
                min-height: 20px;
            }

            /* Responsive Design */
            @media screen and (max-width: 768px) {
                .header {
                    flex-direction: column;
                    padding: 20px;
                    gap: 15px;
                }

                .header h1 {
                    position: static;
                    transform: none;
                    margin: 10px 0;
                }

                .form-container {
                    padding: 20px;
                    margin: 0 10px;
                }

                .logout-link {
                    padding: 10px 20px;
                    font-size: 14px;
                    bottom: 15px;
                    right: 15px;
                }
            }
        </style>
        <script>
            function validateForm() {
                var planId = document.forms["planForm"]["planId"].value;
                if (planId == null || planId === "") {
                    document.getElementById("error").textContent = "Please select a Plan.";
                    return false;
                }
                document.getElementById("error").textContent = "";
                return true;
            }
        </script>
    </head>
    <body>
        <button class="home-button" onclick="window.location.href = '/assignment/home'">Home</button>
        <div class="header">
            <h1>Production Plan Schedule</h1>
            <a href="/assignment/logout" class="logout-link">Logout</a>
        </div>

        <div class="form-container">
            <h2 class="form-title">Select Production Plan</h2>
            <form name="planForm" action="schedule" method="POST" onsubmit="return validateForm()">
                <select id="planId" name="planId">
                    <option value="">-- Select Plan --</option>
                    <c:forEach items="${sessionScope.plans}" var="plan">
                        <option value="${plan.id}">${plan.name}</option>
                    </c:forEach>
                </select>
                <div id="error" class="error-message"></div>
                <button type="submit" class="submit-btn">Search</button>
            </form>
        </div>
    </body>
</html>