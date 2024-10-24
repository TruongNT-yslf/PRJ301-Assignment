/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package dao;
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
public class PlanDBContext extends DBContext<Plan>{

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
            
            for (PlanCampaign campain : entity.getCampains()) {
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
        List<Plan> plans = new ArrayList<>();
        try {
            // SQL với các JOIN để lấy tất cả thông tin cần thiết
            String sql = "SELECT p.PlanID, p.PlanName, p.StartDate, p.EndDate, d.DepartmentID, d.DepartmentName, d.DepartmentType, "
                       + "       pc.PlanCampainID, pc.Quantity AS PlanQuantity, pc.Estimate AS CostPerProduct, "
                       + "       pr.ProductID, pr.ProductName, "
                       + "       sc.SchedualCampainID, sc.WorkDate, sc.Shift, "
                       + "       se.SchedualEmployeeID, se.Quantity AS AssignedQuantity, "
                       + "       e.EmployeeID, e.EmployeeName, "
                       + "       a.AttendanceID, a.QuantityProduced "
                       + "FROM [Plan] p "
                       + "INNER JOIN Department d ON p.DepartmentID = d.DepartmentID "
                       + "INNER JOIN PlanCampain pc ON p.PlanID = pc.PlanID "
                       + "INNER JOIN Product pr ON pc.ProductID = pr.ProductID "
                       + "INNER JOIN SchedualCampain sc ON pc.PlanCampainID = sc.PlanCampainID "
                       + "INNER JOIN SchedualEmployee se ON sc.SchedualCampainID = se.SchedualCampainID "
                       + "INNER JOIN Employee e ON se.EmployeeID = e.EmployeeID "
                       + "LEFT JOIN Attendance a ON se.SchedualEmployeeID = a.SchedualEmployeeID";
            
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            // Tạo map để lưu các Plan và tránh duplicate
            Map<Integer, Plan> planMap = new HashMap<>();
            
            while (rs.next()) {
                int planId = rs.getInt("PlanID");
                
                // Kiểm tra xem Plan đã có trong map chưa
                Plan plan = planMap.get(planId);
                if (plan == null) {
                    plan = new Plan();
                    plan.setId(planId);
                    plan.setName(rs.getString("PlanName"));
                    plan.setStart(rs.getDate("StartDate"));
                    plan.setEnd(rs.getDate("EndDate"));
                    
                    // Tạo entity Department
                    Department dept = new Department();
                    dept.setId(rs.getInt("DepartmentID"));
                    dept.setName(rs.getString("DepartmentName"));
                    dept.setType(rs.getString("DepartmentType"));
                    plan.setDept(dept);

                    // Thêm Plan vào map
                    planMap.put(planId, plan);
                }

                // Tạo entity Product
                Product product = new Product();
                product.setId(rs.getInt("ProductID"));
                product.setName(rs.getString("ProductName"));

                // Tạo entity PlanCampaign
                PlanCampaign campain = new PlanCampaign();
                campain.setId(rs.getInt("PlanCampainID"));
                campain.setQuantity(rs.getInt("PlanQuantity"));
                campain.setCost(rs.getFloat("CostPerProduct"));
                campain.setProduct(product);

                // Tạo entity SchedualCampaign
                SchedualCampaign sc = new SchedualCampaign();
                sc.setId(rs.getInt("SchedualCampainID"));
                sc.setDate(rs.getDate("WorkDate"));
                sc.setShift(rs.getString("Shift"));

                // Tạo entity SchedualEmployee
                SchedualEmployee se = new SchedualEmployee();
                se.setId(rs.getInt("SchedualEmployeeID"));
                se.setQuantity(rs.getInt("AssignedQuantity"));

                // Tạo entity Employee
                Employee employee = new Employee();
                employee.setId(rs.getInt("EmployeeID"));
                employee.setName(rs.getString("EmployeeName"));
                se.setEmployee(employee);

                // Tạo entity Attendance
                Attendance attendance = new Attendance();
                attendance.setId(rs.getInt("AttendanceID"));
                attendance.setQuantityProduced(rs.getInt("QuantityProduced"));
                se.getAttendances().add(attendance);

                sc.getSchedualEmployees().add(se);
                campain.getSchedualCampaigns().add(sc);
                plan.getCampains().add(campain);
            }
            
            // Thêm tất cả các Plan từ map vào list kết quả
            plans.addAll(planMap.values());
            
        } catch (SQLException ex) {
            Logger.getLogger(PlanDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(PlanDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return plans;
    
    }

    @Override
    public Plan get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
