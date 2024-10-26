/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.Attendance;
import entity.Department;
import entity.Employee;
import entity.Plan;
import entity.PlanCampaign;
import entity.Product;
import entity.SchedualCampaign;
import entity.SchedualEmployee;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author TruongNTHE186777 <truongthuankhiet@gmail.com>
 */
public class PlanDBContext extends DBContext<Plan> {

    @Override
    public void insert(Plan entity) {
        try {
            connection.setAutoCommit(false);

            String sql_insert_plan = "INSERT INTO [Plan]\n"
                    + "           ([PlanName]\n"
                    + "           ,[StartDate]\n"
                    + "           ,[EndDate]\n"
                    + "           ,[DepartmentID])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement stm_insert_plan = connection.prepareStatement(sql_insert_plan);
            stm_insert_plan.setString(1, entity.getName());
            stm_insert_plan.setDate(2, entity.getStart());
            stm_insert_plan.setDate(3, entity.getEnd());
            stm_insert_plan.setInt(4, entity.getDept().getId());
            stm_insert_plan.executeUpdate();

            String sql_select_plan = "SELECT @@IDENTITY as PlanID";
            PreparedStatement stm_select_plan = connection.prepareStatement(sql_select_plan);
            ResultSet rs = stm_select_plan.executeQuery();
            if (rs.next()) {
                entity.setId(rs.getInt("PlanID"));
            }

            for (PlanCampaign campain : entity.getCampaigns()) {
                String sql_insert_campain = "INSERT INTO [PlanCampain]\n"
                        + "           ([PlanID]\n"
                        + "           ,[ProductID]\n"
                        + "           ,[Quantity]\n"
                        + "           ,[Estimate])\n"
                        + "     VALUES\n"
                        + "           (?\n"
                        + "           ,?\n"
                        + "           ,?\n"
                        + "           ,?)";

                PreparedStatement stm_insert_campain = connection.prepareStatement(sql_insert_campain);
                stm_insert_campain.setInt(1, entity.getId());
                stm_insert_campain.setInt(2, campain.getProduct().getId());
                stm_insert_campain.setInt(3, campain.getQuantity());
                stm_insert_campain.setFloat(4, campain.getCost());
                stm_insert_campain.executeUpdate();
            }

            connection.commit();
        } catch (SQLException ex) {
            Logger.getLogger(PlanDBContext.class.getName()).log(Level.SEVERE, null, ex);
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(PlanDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(PlanDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(PlanDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    public void update(Plan entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Plan entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Plan> list() {

        String sql = """
                 SELECT 
                     p.PlanID, 
                     p.PlanName, 
                     p.StartDate, 
                     p.EndDate, 
                     pc.PlanCampaignID, 
                     pc.Quantity AS PlanQuantity, 
                     sc.ScID, 
                     sc.[Date] AS SchedualDate, 
                     sc.[Shift], 
                     se.SchEmpID, 
                     se.Quantity AS EmployeeQuantity, 
                     a.AttendentID, 
                     a.Quantity AS AttendanceQuantity 
                 FROM 
                     [Plan] p 
                 JOIN 
                     PlanCampaign pc ON p.PlanID = pc.PlanID 
                 LEFT JOIN 
                     SchedualCampaign sc ON pc.PlanCampaignID = sc.PlanCampaignID
                 LEFT JOIN
                     SchedualEmployee se ON sc.ScID = se.ScID 
                 LEFT JOIN 
                     Attendence a ON se.SchEmpID = a.SchEmpID
                 ORDER BY 
                     p.PlanID, 
                     pc.PlanCampaignID, 
                     sc.ScID, 
                     se.SchEmpID;
                 """;
        PreparedStatement stm = null;
        ArrayList<Plan> plans = new ArrayList<>();
        try {
            stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            Plan currentPlan = new Plan();
            currentPlan.setId(-1);
            PlanCampaign currentCampaign = new PlanCampaign();
            currentCampaign.setId(-1);
            SchedualCampaign currentSchedualCampaign = new SchedualCampaign();
            currentSchedualCampaign.setId(-1);

            while (rs.next()) {
                int planID = rs.getInt("PlanID");

                if (planID != currentPlan.getId()) {
                    currentPlan = new Plan();
                    currentPlan.setId(planID);
                    currentPlan.setName(rs.getString("PlanName"));
                    currentPlan.setStart(rs.getDate("StartDate"));
                    currentPlan.setEnd(rs.getDate("EndDate"));
                    currentPlan.setCampaigns(new ArrayList<>());

                    plans.add(currentPlan);
                }

                int campaignID = rs.getInt("PlanCampaignID");
                if (campaignID != currentCampaign.getId()) {
                    currentCampaign = new PlanCampaign();
                    currentCampaign.setId(campaignID);
                    currentCampaign.setQuantity(rs.getInt("PlanQuantity"));
                    currentCampaign.setSchedualCampaigns(new ArrayList<>());
                    currentPlan.getCampaigns().add(currentCampaign);
                }

                int schedualID = rs.getInt("ScID");
                if (schedualID != currentSchedualCampaign.getId()) {
                    currentSchedualCampaign = new SchedualCampaign();
                    currentSchedualCampaign.setId(schedualID);
                    currentSchedualCampaign.setDate(rs.getDate("SchedualDate"));
                    currentSchedualCampaign.setShift(rs.getInt("Shift"));
                    currentSchedualCampaign.setSchedualEmployees(new ArrayList<>());
                    currentCampaign.getSchedualCampaigns().add(currentSchedualCampaign);
                }

                SchedualEmployee schedualEmployee = new SchedualEmployee();
                schedualEmployee.setId(rs.getInt("SchEmpID"));
                schedualEmployee.setQuantity(rs.getDouble("EmployeeQuantity"));

                Attendance attendance = new Attendance();
                attendance.setId(rs.getInt("AttendentID"));
                attendance.setQuantity(rs.getDouble("AttendanceQuantity"));
                schedualEmployee.setAttendance(attendance);

                currentSchedualCampaign.getSchedualEmployees().add(schedualEmployee);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PlanDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (stm != null) {
                    stm.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(PlanDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return plans;
    }

    public ArrayList<Plan> planInfo() {
        ArrayList<Plan> plans = list();

        for (Plan plan : plans) {
            int totalProduced = 0;
            int totalPlanned = 0;

            for (PlanCampaign campaign : plan.getCampaigns()) {
                totalPlanned += campaign.getQuantity();
                for (SchedualCampaign sc : campaign.getSchedualCampaigns()) {
                    for (SchedualEmployee se : sc.getSchedualEmployees()) {
                        Attendance att = se.getAttendance();
                        totalProduced += att.getQuantity();
                    }
                }
            }

            plan.setTotalAccumulate(totalProduced);
            plan.setRemainingQuantity(totalPlanned - totalProduced);

            if (totalProduced >= totalPlanned) {
                plan.setStatus("Completed");
            } else if (plan.getEnd().before(new java.util.Date())) {
                plan.setStatus("Late");
            } else {
                plan.setStatus("On Going");
            }
        }

        return plans;
    }

    @Override
    public Plan get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
