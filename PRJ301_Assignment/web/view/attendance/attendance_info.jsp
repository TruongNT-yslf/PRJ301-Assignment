<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Attendance Information</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
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
            .home-button {
                position: relative; /* Positioning the button */
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
        <div class="container-fluid mt-4">
            <h2 class="mb-4">Attendance Information</h2>

            <!-- Filter Form -->
            <form method="post" action="" class="mb-4">
                <div class="row g-3 align-items-center">
                    <div class="col-auto">
                        <label class="form-label">Department</label>
                        <select name="departmentId" class="form-select">
                            <c:forEach items="${departments}" var="dept">
                                <option value="${dept.id}" ${dept.id == selectedDepartmentId ? 'selected' : ''}>${dept.name}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="col-auto">
                        <label class="form-label">Date</label>
                        <select name="date" class="form-select">
                            <c:forEach items="${dates}" var="availableDate">
                                <option value="${availableDate}" ${availableDate == selectedDate ? 'selected' : ''}>
                                    <fmt:formatDate value="${availableDate}" pattern="yyyy-MM-dd"/>
                                </option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="col-auto">
                        <label class="form-label">Shift</label>
                        <select name="shift" class="form-select">
                            <option value="1" ${selectedShift == 1 ? 'selected' : ''}>Shift 1</option>
                            <option value="2" ${selectedShift == 2 ? 'selected' : ''}>Shift 2</option>
                            <option value="3" ${selectedShift == 3 ? 'selected' : ''}>Shift 3</option>
                        </select>
                    </div>

                    <div class="col-auto align-self-end">
                        <button type="submit" class="btn btn-primary">Search</button>
                    </div>
                </div>
            </form>

            <!-- Error Handling -->
            <c:if test="${not empty error}">
                <div class="alert alert-danger" role="alert">
                    ${error}
                </div>
            </c:if>

            <!-- Form Save bao quanh toàn bộ bảng -->
            <form action="${pageContext.request.contextPath}/attendance/save" method="post">
                <c:choose>
                    <c:when test="${not empty attendanceInfo}">
                        <!-- Table containing attendance info -->
                        <div class="table-responsive">
                            <table class="table table-striped table-hover">
                                <thead class="table-dark">
                                    <tr>
                                        <th>Employee ID</th>
                                        <th>Employee Name</th>
                                        <th>Department</th>
                                        <th>Product ID</th>
                                        <th>Product Name</th>
                                        <th>Planned Quantity</th>
                                        <th>Completed Quantity</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${attendanceInfo}" var="info">
                                        <tr>
                                            <td>${info.employee.id}</td>
                                            <td>${info.employee.employeeName}</td>
                                            <td>${info.employee.department.name}</td>
                                            <td>${info.schedualCampaign.planCampaign.product.id}</td>
                                            <td>${info.schedualCampaign.planCampaign.product.name}</td>
                                            <td>${info.quantity}</td>
                                            <td>
                                                <!-- Hidden field for schEmpId -->
                                                <input type="hidden" name="schEmpId" value="${info.id}" />
                                                <!-- Input for completedQuantity -->
                                                <input type="number" name="completedQuantity" value="${info.attendance.quantity}" min="0" class="form-control" />
                                            </td>
                                            <td>
                                                <span class="${info.status == 'Achieved the target' ? 'status-achieved' : info.status == 'Not achieved the target' ? 'status-not-achieved' : 'status-exceeded'}">
                                                    ${info.status}
                                                </span>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>

                        <!-- Summary Statistics -->
                        <div class="card mt-3">
                            <div class="card-header">
                                Summary Statistics
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-4">
                                        <strong>Total Employees:</strong> ${attendanceInfo.size()}
                                    </div>
                                    <div class="col-md-4">
                                        <strong>Achieved Targets:</strong> ${achievedCount}
                                    </div>
                                    <div class="col-md-4">
                                        <strong>Not Achieved Targets:</strong> ${notAchievedCount}
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-md-4">
                                        <strong>Exceeded Targets:</strong> ${exceededCount}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="alert alert-info" role="alert">
                            No attendance information found. Please adjust your search criteria.
                        </div>
                    </c:otherwise>
                </c:choose>

                <!-- Save button outside of the table -->
                <button type="submit" class="btn btn-primary mt-3">Save</button>
            </form>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

