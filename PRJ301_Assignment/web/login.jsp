<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link rel="stylesheet" href="styles.css"> 
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #e9ecef;
            margin: 0;
            padding: 20px;
        }
        .login-container {
            max-width: 400px;
            margin: auto;
            background: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            text-align: center;
        }
        h2 {
            color: #343a40;
            margin-bottom: 20px;
            font-size: 24px;
        }
        .form-group {
            margin-bottom: 20px;
            display: flex;
            flex-direction: column;
            align-items: stretch; /* Đặt căn chỉnh để các ô nhập chiếm chiều rộng tối đa */
            width: 100%;
        }
        .form-group label {
            font-weight: bold;
            color: #495057;
            margin-bottom: 5px;
            width: 100%; /* Đặt chiều rộng 100% cho label */
            text-align: left; /* Căn trái label */
        }
        .form-group input {
            width: 100%; /* Đặt chiều rộng 100% cho input */
            padding: 12px;
            border: 2px solid #ced4da;
            border-radius: 5px;
            transition: border-color 0.3s;
            box-sizing: border-box; /* Đảm bảo padding không làm lệch chiều rộng */
        }
        .form-group input:focus {
            border-color: #80bdff;
            outline: none;
        }
        .error-message {
            color: #dc3545;
            margin-bottom: 15px;
            font-size: 14px;
        }
        .btn {
            width: 60%;
            padding: 12px;
            background-color: #28a745;
            border: none;
            border-radius: 5px;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.2s;
        }
        .btn:hover {
            background-color: #218838;
            transform: translateY(-1px);
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>My Login Page</h2>

        <div class="error-message">
            <c:if test="${not empty errorMessage}">
                ${errorMessage}
            </c:if>
        </div>

        <form action="login" method="post">
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit" class="btn">Login</button>
        </form>
    </div>
</body>
</html>
