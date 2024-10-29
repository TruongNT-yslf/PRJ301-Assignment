/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.productionplan;

import dao.PlanDBContext;
import entity.Plan;
import entity.Product;
import entity.SchedualCampaign;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author TruongNT <truongnthe186777 at fpt.edu.vn>
 */
public class ScheduleController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        request.getRequestDispatcher("../view/productionplan/schedule_input.jsp").forward(request, response);
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
        int planId = Integer.parseInt(request.getParameter("planId"));
        PlanDBContext planDBContext = new PlanDBContext();
        Plan plan = planDBContext.getPlanInfo(planId);
        List<Product> listProduct = planDBContext.getProductsByPlanId(planId);
        Map<Integer, List<SchedualCampaign>> map = new HashMap();

        for (Product product : listProduct) {
            List<SchedualCampaign> lst = planDBContext.getSchedualCampaignsByPlanIdnProductId(planId, product.getId());
            map.put(product.getId(), lst);
        }
        List<Date> dateList = new ArrayList<>();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(plan.getStart());

        while (!calendar.getTime().after(plan.getEnd())) {
            dateList.add(calendar.getTime());
            calendar.add(Calendar.DAY_OF_MONTH, 1);
        }
        request.setAttribute("dateList", dateList);
        request.setAttribute("map", map);
        request.setAttribute("plan", plan);
        request.setAttribute("listProduct", listProduct);
        request.getRequestDispatcher("../view/productionplan/schedule.jsp").forward(request, response);
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
