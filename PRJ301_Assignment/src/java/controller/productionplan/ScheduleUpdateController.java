package controller.productionplan;

import dao.PlanDBContext;
import entity.SchedualCampaign;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

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
                e.printStackTrace();
                log("Error updating SchedualCampaign data: " + e.getMessage());
            } finally {
                if (db != null) {
                    try {
                        db.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Thêm thông báo vào session
        if (updateSuccess) {
            response.getWriter().println("Update Successfully!");
            request.getSession().setAttribute("message", "Cập nhật thành công!");
            request.getSession().setAttribute("updateSuccess", true);
        } else {
            response.getWriter().println("Update Fail!");
            request.getSession().setAttribute("message", "Cập nhật thất bại!");
            request.getSession().setAttribute("updateSuccess", false);
        }
        // response.sendRedirect(request.getContextPath() + "/view/productionplan/schedule.jsp");
        //response.sendRedirect(request.getContextPath() + "/productionplan/schedule");
    }

    @Override
    public String getServletInfo() {
        return "Handles updates to production schedule.";
    }
}
