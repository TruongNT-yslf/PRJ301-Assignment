/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.productionplan;

import dao.DepartmentDBContext;
import dao.SchedualEmployeeDBContext;
import dao.ScheduleCampaignDBContext;
import entity.Department;
import entity.SchedualEmployee;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.sql.Date;

/**
 *
 * @author TruongNT <truongnthe186777 at fpt.edu.vn>
 */
public class AttendanceController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AttendanceController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AttendanceController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        SchedualEmployeeDBContext schedualEmployeeDBContext = new SchedualEmployeeDBContext();
        DepartmentDBContext departmentDBContext = new DepartmentDBContext();
        ScheduleCampaignDBContext dbcam = new ScheduleCampaignDBContext();
        ArrayList<Department> depts = departmentDBContext.getDepartmentWithType("WS");
        ArrayList<Date> dates = dbcam.getDates();
        request.getSession().setAttribute("departments", depts);
        request.getSession().setAttribute("dates", dates);
        request.getRequestDispatcher("../view/attendance/attendance_info.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int departmentId = Integer.parseInt(request.getParameter("departmentId"));
        String dateStr = request.getParameter("date");
        int shift = Integer.parseInt(request.getParameter("shift"));

        Date date = Date.valueOf(dateStr);

        SchedualEmployeeDBContext schedualEmployeeDBContext = new SchedualEmployeeDBContext();
        ArrayList<SchedualEmployee> attendanceInfo = schedualEmployeeDBContext.getAttendanceInfo(departmentId, dateStr, shift);

        request.setAttribute("attendanceInfo", attendanceInfo);
        request.setAttribute("selectedDepartmentId", departmentId);
        request.setAttribute("selectedDate", dateStr);
        request.setAttribute("selectedShift", shift);

        request.getRequestDispatcher("../view/attendance/attendance_info.jsp").forward(request, response);
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

}
