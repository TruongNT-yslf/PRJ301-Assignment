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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Servlet to handle updates to the schedule.
 */
public class ScheduleUpdateController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<SchedualCampaign> campaigns = new ArrayList<>();
        boolean updateSuccess = false;
        try {
            request.getParameterMap().forEach((key, value) -> {
                if (key.startsWith("quantity_")) {
                    String[] parts = key.split("_");
                    int productId = Integer.parseInt(parts[1]);
                    long date = Long.parseLong(parts[2]);
                    int shift = Integer.parseInt(parts[3]);
                    int quantity = Integer.parseInt(value[0]);

                    String scIdParam = "scId_" + productId + "_" + date + "_" + shift;
                    int scId = Integer.parseInt(request.getParameter(scIdParam));
                    SchedualCampaign sc = new SchedualCampaign();
                    sc.setId(scId);
                    sc.setQuantity(quantity);
                    campaigns.add(sc);
                }
            });
            PlanDBContext db = null;
            try {
                db = new PlanDBContext();
                updateSuccess = db.updateBatch(campaigns);
            } catch (Exception e) {
                log("Error updating SchedualCampaign data: " + e.getMessage());
            } finally {
                if (db != null) {
                    try {
                        db.close();
                    } catch (Exception e) {
                    }
                }
            }
        } catch (Exception e) {
        }
        // load lai du lieu 
        // set attt
        Plan plan = (Plan)request.getSession().getAttribute("plan");
        System.err.println("adasdas"+ plan);
        PlanDBContext planDBContext = new PlanDBContext();
        List<Product> listProduct = planDBContext.getProductsByPlanId(plan.getId());
        Map<Integer, List<SchedualCampaign>> map = new HashMap();


        for (Product product : listProduct) {
            List<SchedualCampaign> lst = planDBContext.getSchedualCampaignsByPlanIdnProductId(plan.getId(), product.getId());
            map.put(product.getId(), lst);
        }
        request.getSession().setAttribute("map", map);
        System.err.println("adasdas   sdsdsd" + listProduct);
        request.getSession().setAttribute("listProduct", listProduct);
        

        if (updateSuccess) {
            //response.getWriter().println("Update Successfully!");
            request.getSession().setAttribute("message", "Update Successfully!");
            request.getSession().setAttribute("updateSuccess", true);
        } else {
            //response.getWriter().println("Update Fail!");
            request.getSession().setAttribute("message", "Update Fail!");
            request.getSession().setAttribute("updateSuccess", false);
        }
         response.sendRedirect(request.getContextPath() + "/view/productionplan/schedule.jsp");
        //response.sendRedirect(request.getContextPath() + "/productionplan/schedule");
    }

    @Override
    public String getServletInfo() {
        return "Handles updates to production schedule.";
    }
}
