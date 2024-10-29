<%--  
    Document   : schedule
    Created on : Oct 28, 2024, 11:02:27 PM
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>
<%@page import="java.util.List" %>
<%@page import="java.util.Map" %>
<%@page import="entity.Plan" %>
<%@page import="entity.Product" %>
<%@page import="entity.SchedualCampaign" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lịch sản xuất</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f7fa;
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;
                margin: 0;
                padding: 20px;
            }
            h2 {
                color: #333;
                font-size: 24px;
                font-weight: bold;
                margin-bottom: 5px;
            }
            p {
                color: #666;
                font-size: 16px;
                margin-top: 0;
            }
            table {
                width: 100%;
                max-width: 800px;
                border-collapse: collapse;
                margin-top: 20px;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);
                border-radius: 8px;
                overflow: hidden;
            }
            th, td {
                padding: 12px;
                text-align: center;
                border: 1px solid #ddd;
                font-size: 14px;
            }
            th {
                background-color: #4CAF50;
                color: white;
                font-weight: bold;
                font-size: 16px;
            }
            .header-date {
                background-color: #f2f2f2;
                font-weight: bold;
                color: #333;
            }
            .product-column {
                background-color: #eaf4e9;
                font-weight: bold;
                color: #333;
            }
            tr:nth-child(even) td {
                background-color: #f9f9f9;
            }
            tr:nth-child(odd) td {
                background-color: #fff;
            }
            tr:hover td {
                background-color: #f1f7ff;
            }
        </style>
    </head>
    <body>
        <h2>Kế Hoạch: ${plan.name}</h2>
        <p>Thời gian: <fmt:formatDate value="${plan.start}" pattern="dd/MM/yyyy"/> đến <fmt:formatDate value="${plan.end}" pattern="dd/MM/yyyy"/></p>

        <table>
            <tr>
                <th class="product-column"></th>
                <c:forEach var="date" items="${dateList}">
                    <th colspan="3" class="header-date"><fmt:formatDate value="${date}" pattern="dd/MM/yyyy"/></th>
                </c:forEach>
            </tr>
            <tr>
                <td class="product-column"></td>
                <c:forEach var="date" items="${dateList}">
                    <th>Ca 1</th>
                    <th>Ca 2</th>
                    <th>Ca 3</th>
                </c:forEach>
            </tr>
            <c:forEach var="product" items="${listProduct}">
                <tr>
                    <td class="product-column">${product.name}</td>
                    <c:forEach var="date" items="${dateList}">
                        <c:forEach var="shift" begin="1" end="3">
                            <td>
                                <c:set var="campaignList" value="${map[product.id]}" />
                                <c:forEach var="sc" items="${campaignList}">
                                    <c:if test="${sc.date.time == date.time && sc.shift == shift}">
                                        ${sc.quantity}
                                    </c:if>
                                </c:forEach>
                            </td>
                        </c:forEach>
                    </c:forEach>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
