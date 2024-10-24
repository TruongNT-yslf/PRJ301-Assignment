/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.productionplan;

import dao.DepartmentDBContext;
import dao.PlanDBContext;
import dao.ProductDBContext;
import entity.Department;
import entity.Plan;
import entity.PlanCampaign;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;

/**
 *
 * @author TruongNT <truongnthe186777 at fpt.edu.vn>
 */
public class ProductionPlanCreateController extends HttpServlet {

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
        ProductDBContext dbProduct = new ProductDBContext();
        DepartmentDBContext dbDepts = new DepartmentDBContext();

        request.setAttribute("products", dbProduct.list());
        request.setAttribute("depts", dbDepts.get("WS"));

        request.getRequestDispatcher("../view/productionplan/create.jsp").forward(request, response);
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
        Plan plan = new Plan();
        plan.setName(request.getParameter("name"));
        plan.setStart(Date.valueOf(request.getParameter("from")));
        plan.setEnd(Date.valueOf(request.getParameter("to")));
        Department d = new Department();
        d.setId(Integer.parseInt(request.getParameter("did")));
        plan.setDept(d);

        String[] pids = request.getParameterValues("pid");
        for (String pid : pids) {
            PlanCampaign c = new PlanCampaign();

            Product p = new Product();
            p.setId(Integer.parseInt(pid));
            c.setProduct(p);
            c.setPlan(plan);

            String raw_quantity = request.getParameter("quantity" + pid);
            String raw_cost = request.getParameter("cost" + pid);

            c.setQuantity(raw_quantity != null && raw_quantity.length() > 0 ? Integer.parseInt(raw_quantity) : 0);
            c.setCost(raw_cost != null && raw_cost.length() > 0 ? Float.parseFloat(raw_cost) : 0);

            if (c.getQuantity() > 0 && c.getCost() > 0) {
                plan.getCampains().add(c);
            }
        }

        if (plan.getCampains().size() > 0) {
            //insert
            PlanDBContext db = new PlanDBContext();
            db.insert(plan);
            response.getWriter().println("your plan has been added!");
        } else {
            response.getWriter().println("your plan does not have any products / campains");
        }
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
