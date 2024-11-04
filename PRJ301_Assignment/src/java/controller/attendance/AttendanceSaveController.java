/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.attendance;

import dao.SchedualEmployeeDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author TruongNT <truongnthe186777 at fpt.edu.vn>
 */
@WebServlet(name = "AttendanceSaveController", urlPatterns = {"/attendance/save"})
public class AttendanceSaveController extends HttpServlet {

@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    String[] schEmpIds = req.getParameterValues("schEmpId");
    String[] completedQuantities = req.getParameterValues("completedQuantity");

    if (schEmpIds != null && completedQuantities != null && schEmpIds.length == completedQuantities.length) {
        SchedualEmployeeDBContext dbContext = new SchedualEmployeeDBContext();
        
        for (int i = 0; i < schEmpIds.length; i++) {
                int schEmpId = Integer.parseInt(schEmpIds[i]);
                double completedQuantity = Double.parseDouble(completedQuantities[i]);
                dbContext.updateAttendance(schEmpId, completedQuantity);
        }
    }
    resp.sendRedirect(req.getContextPath() + "/attendance/attendanceinfo");
}


}
