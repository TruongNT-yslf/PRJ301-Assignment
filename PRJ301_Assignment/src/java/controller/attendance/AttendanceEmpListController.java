/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.attendance;

import controller.accesscontrol.AccessControlController;
import dao.SchedualEmployeeDBContext;
import dao.UserDBContext;
import entity.SchedualEmployee;
import entity.accesscontrol.Role;
import entity.accesscontrol.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author TruongNT <truongnthe186777 at fpt.edu.vn>
 */
public class AttendanceEmpListController extends AccessControlController {

    @Override
    protected boolean isAuthorized(HttpServletRequest req, User account) {
        UserDBContext db = new UserDBContext();
        ArrayList<Role> roles = db.getRoles(account.getUsername());
        account.setRoles(roles);

        for (Role role : account.getRoles()) {
            if (role.getName().equals("WS Manager")) {
                return true;
            }
        }
        return false;
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    @Override
    protected void doAuthorizedGet(HttpServletRequest req, HttpServletResponse resp, User account) throws ServletException, IOException {
        req.getRequestDispatcher("../view/attendance/attendance_history.jsp").forward(req, resp);
    }

    @Override
    protected void doAuthorizedPost(HttpServletRequest req, HttpServletResponse resp, User account) throws ServletException, IOException {
        String employeeIdParam = req.getParameter("employeeId");

        if (employeeIdParam == null || employeeIdParam.isEmpty()) {
            req.setAttribute("error", "Employee ID is required.");
            req.getRequestDispatcher("../view/attendance/attendance_history.jsp").forward(req, resp);
            return;
        }

        try {
            int employeeId = Integer.parseInt(employeeIdParam);

            SchedualEmployeeDBContext db = new SchedualEmployeeDBContext();
            ArrayList<SchedualEmployee> employeeAttendanceHistory = db.getEmployeeAttendanceHistory(employeeId);

            req.setAttribute("attendanceHistory", employeeAttendanceHistory);
            req.setAttribute("employeeId", employeeId);
        } catch (NumberFormatException e) {
            req.setAttribute("error", "Invalid Employee ID format.");
        }

        req.getRequestDispatcher("../view/attendance/attendance_history.jsp").forward(req, resp);
    }

}
