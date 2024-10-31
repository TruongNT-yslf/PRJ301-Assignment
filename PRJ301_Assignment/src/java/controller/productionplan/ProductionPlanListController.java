/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.productionplan;

import controller.accesscontrol.AccessControlController;
import dao.PlanDBContext;
import dao.UserDBContext;
import entity.Plan;
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
public class ProductionPlanListController extends AccessControlController {

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

    @Override
    protected void doAuthorizedGet(HttpServletRequest req, HttpServletResponse resp, User account) throws ServletException, IOException {
        PlanDBContext db = new PlanDBContext();
        ArrayList<Plan> plans = db.planInfo();
        req.setAttribute("plans", plans);
        req.getRequestDispatcher("../view/productionplan/list.jsp").forward(req, resp);
    }

    @Override
    protected void doAuthorizedPost(HttpServletRequest req, HttpServletResponse resp, User account) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
