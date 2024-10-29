<%-- 
    Document   : newjspschedule_input.jsp
    Created on : Oct 29, 2024, 12:03:51 AM
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Input Plan ID</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                background-color: #f0f2f5;
                margin: 0;
            }
            .form-container {
                padding: 20px;
                border: 1px solid #ccc;
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }
            input[type="text"] {
                padding: 5px;
                margin-right: 10px;
            }
            input[type="submit"] {
                padding: 5px 10px;
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 3px;
                cursor: pointer;
            }
            input[type="submit"]:hover {
                background-color: #0056b3;
            }
            .error-message {
                color: red;
                font-size: 0.9em;
            }
        </style>
        <script>
            function validateForm() {
                var planId = document.forms["planForm"]["planId"].value;
                if (planId == null || planId.trim() === "") {
                    document.getElementById("error").textContent = "Please input Plan ID.";
                    return false;
                }
                document.getElementById("error").textContent = "";
                return true;
            }
        </script>
    </head>
    <body>
        <div class="form-container">
            <form name="planForm" action="schedule" method="POST" onsubmit="return validateForm()">
                <label for="planId">Input Plan ID:</label>
                <input type="text" id="planId" name="planId"/>
                <input type="submit" value="Search"/>
                <div id="error" class="error-message"></div>
            </form>
        </div>
    </body>
</html>
    