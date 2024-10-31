<%-- 
    Document   : create
    Created on : Oct 16, 2024, 4:45:34 PM
    Author     : sonnt-local
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f0f2f5;
                color: #333;
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            form {
                margin-top: 20px;
                background-color: #ffffff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
                width: 400px;
            }

            form input[type="text"],
            form input[type="date"],
            form select {
                width: 100%;
                padding: 8px;
                margin-top: 8px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }

            form input[type="submit"] {
                margin-top: 20px;
                width: 100%;
                padding: 10px;
                background-color: #28a745;
                color: #ffffff;
                font-size: 16px;
                font-weight: bold;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            form input[type="submit"]:hover {
                background-color: #218838;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            table, th, td {
                border: 1px solid #ddd;
                padding: 10px;
                text-align: left;
            }

            th {
                background-color: #007bff;
                color: white;
            }

            .logout-link {
                position: fixed;
                bottom: 20px;
                right: 20px;
                padding: 10px 20px;
                font-size: 16px;
                color: #ffffff;
                background-color: #dc3545;
                border-radius: 5px;
                text-decoration: none;
                font-weight: bold;
            }

            .logout-link:hover {
                background-color: #c82333;
            }

        </style>
    </head>
    <body>
        <button class="home-button" onclick="window.location.href = '/assignment/home'">Home</button>
        <form action="create" method="POST">
            Plan title: <input type="text" name="name"/> <br/>
            From : <input type="date" name="from"/> To: <input type="date" name="to"/> <br/>
            Workshop: <select name="did">
                <c:forEach items="${requestScope.depts}" var="d">
                    <option value="${d.id}">${d.name}</option>
                </c:forEach>
            </select> <br/>
            <table border="1px">
                <tr>
                    <td>Product</td>
                    <td>Quantity</td>
                    <td>Cost</td>
                </tr>
                <c:forEach items="${requestScope.products}" var="p">
                    <tr>
                        <td>${p.name}<input type="hidden" value="${p.id}" name="pid"/></td>
                        <td><input type="text" name="quantity${p.id}"/></td>
                        <td><input type="text" name="cost${p.id}"/></td>
                    </tr>   
                </c:forEach>
            </table>
            <input type="submit" name="Save"/>
        </form>
        <a href="/assignment/logout" class="logout-link">Logout</a>
    </body>
</html>
