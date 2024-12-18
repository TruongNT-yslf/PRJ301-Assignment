/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.attendance;

import controller.accesscontrol.AccessControlController;
import dao.DepartmentDBContext;
import dao.SchedualEmployeeDBContext;
import dao.ScheduleCampaignDBContext;
import dao.UserDBContext;
import entity.Department;
import entity.SchedualEmployee;
import entity.accesscontrol.Role;
import entity.accesscontrol.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.sql.Date;

/**
 *
 * @author TruongNT <truongnthe186777 at fpt.edu.vn>
 */
public class AttendanceListController extends AccessControlController {

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
        SchedualEmployeeDBContext schedualEmployeeDBContext = new SchedualEmployeeDBContext();
        DepartmentDBContext departmentDBContext = new DepartmentDBContext();
        ScheduleCampaignDBContext dbcam = new ScheduleCampaignDBContext();

        // Lấy danh sách phòng ban và ngày làm việc
        ArrayList<Department> depts = departmentDBContext.getDepartmentWithType("WS");
        ArrayList<Date> dates = dbcam.getDates();
        req.getSession().setAttribute("departments", depts);
        req.getSession().setAttribute("dates", dates);

        // Lấy các tham số từ yêu cầu, hoặc cung cấp giá trị mặc định
        String departmentIdStr = req.getParameter("departmentId");
        String dateStr = req.getParameter("date");
        String shiftStr = req.getParameter("shift");

        int departmentId = (departmentIdStr != null) ? Integer.parseInt(departmentIdStr) : depts.get(0).getId();
        String selectedDateStr = (dateStr != null) ? dateStr : dates.get(0).toString();
        int shift = (shiftStr != null) ? Integer.parseInt(shiftStr) : 1;

        // Tải thông tin điểm danh
        Date date = Date.valueOf(selectedDateStr);
        ArrayList<SchedualEmployee> attendanceInfo = schedualEmployeeDBContext.getAttendanceInfo(departmentId, selectedDateStr, shift);

        req.setAttribute("attendanceInfo", attendanceInfo);
        req.setAttribute("selectedDepartmentId", departmentId);
        req.setAttribute("selectedDate", selectedDateStr);
        req.setAttribute("selectedShift", shift);

        req.getRequestDispatcher("../view/attendance/attendance_info.jsp").forward(req, resp);
    }

     @Override
    protected void doAuthorizedPost(HttpServletRequest req, HttpServletResponse resp, User account) throws ServletException, IOException {
        // Lấy danh sách các SchEmpID và CompletedQuantity từ yêu cầu
        String[] schEmpIds = req.getParameterValues("schEmpId");
        String[] completedQuantities = req.getParameterValues("completedQuantity");

        if (schEmpIds != null && completedQuantities != null) {
            SchedualEmployeeDBContext dbContext = new SchedualEmployeeDBContext();
            for (int i = 0; i < schEmpIds.length; i++) {
                int schEmpId = Integer.parseInt(schEmpIds[i]);
                double completedQuantity = Double.parseDouble(completedQuantities[i]);

                // Cập nhật thông tin vào cơ sở dữ liệu
                dbContext.updateAttendance(schEmpId, completedQuantity);
            }
        }

        // Sau khi cập nhật, tải lại thông tin và chuyển tiếp lại trang
        doAuthorizedGet(req, resp, account);
    }
   

    /* @Override
    protected void doAuthorizedGet(HttpServletRequest req, HttpServletResponse resp, User account) throws ServletException, IOException {
        SchedualEmployeeDBContext schedualEmployeeDBContext = new SchedualEmployeeDBContext();
        DepartmentDBContext departmentDBContext = new DepartmentDBContext();
        ScheduleCampaignDBContext dbcam = new ScheduleCampaignDBContext();
        ArrayList<Department> depts = departmentDBContext.getDepartmentWithType("WS");
        ArrayList<Date> dates = dbcam.getDates();
        req.getSession().setAttribute("departments", depts);
        req.getSession().setAttribute("dates", dates);
        req.getRequestDispatcher("../view/attendance/attendance_info.jsp").forward(req, resp);
    }

     @Override
    protected void doAuthorizedPost(HttpServletRequest req, HttpServletResponse resp, User account) throws ServletException, IOException {
        int departmentId = Integer.parseInt(req.getParameter("departmentId"));
        String dateStr = req.getParameter("date");
        int shift = Integer.parseInt(req.getParameter("shift"));

        Date date = Date.valueOf(dateStr);

        SchedualEmployeeDBContext schedualEmployeeDBContext = new SchedualEmployeeDBContext();
        ArrayList<SchedualEmployee> attendanceInfo = schedualEmployeeDBContext.getAttendanceInfo(departmentId, dateStr, shift);

        req.setAttribute("attendanceInfo", attendanceInfo);
        req.setAttribute("selectedDepartmentId", departmentId);
        req.setAttribute("selectedDate", dateStr);
        req.setAttribute("selectedShift", shift);

        req.getRequestDispatcher("../view/attendance/attendance_info.jsp").forward(req, resp);
    }*/
}
