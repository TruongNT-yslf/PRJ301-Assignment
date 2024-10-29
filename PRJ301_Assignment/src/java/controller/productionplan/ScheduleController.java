/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.productionplan;

import controller.accesscontrol.AccessControlController;
import dao.PlanDBContext;
import dao.UserDBContext;
import entity.Plan;
import entity.Product;
import entity.SchedualCampaign;
import entity.accesscontrol.Role;
import entity.accesscontrol.User;
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
public class ScheduleController extends AccessControlController {
        @Override
    protected boolean isAuthorized(HttpServletRequest req, User account) {
        UserDBContext db = new UserDBContext();
        ArrayList<Role> roles = db.getRoles(account.getUsername());
        account.setRoles(roles);

        for (Role role : account.getRoles()) {
            if (role.getName().equals("Production Manager")) {
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
        req.getRequestDispatcher("../view/productionplan/schedule_input.jsp").forward(req, resp);
    }

    @Override
    protected void doAuthorizedPost(HttpServletRequest req, HttpServletResponse resp, User account) throws ServletException, IOException {
        int planId = Integer.parseInt(req.getParameter("planId"));
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
        req.getSession().setAttribute("dateList", dateList);
        req.getSession().setAttribute("map", map);
        req.getSession().setAttribute("plan", plan);
        req.getSession().setAttribute("listProduct", listProduct);
        req.getRequestDispatcher("../view/productionplan/schedule.jsp").forward(req, resp);
    }

}
