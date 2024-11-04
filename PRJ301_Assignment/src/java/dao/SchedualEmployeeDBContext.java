/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.Attendance;
import entity.Department;
import entity.Employee;
import entity.PlanCampaign;
import entity.Product;
import entity.SchedualCampaign;
import entity.SchedualEmployee;
import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.ResultSet;

/**
 *
 * @author TruongNTHE186777 <truongthuankhiet@gmail.com>
 */
public class SchedualEmployeeDBContext extends DBContext<SchedualEmployee> {

    @Override
    public void insert(SchedualEmployee entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(SchedualEmployee entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(SchedualEmployee entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<SchedualEmployee> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public SchedualEmployee get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public ArrayList<SchedualEmployee> getAttendanceInfo(int departmentId, String date, int shift) {
        ArrayList<SchedualEmployee> schedualEmployees = new ArrayList<>();
        PreparedStatement stm = null;
        String sql = """
         SELECT 
             e.EmployeeID,
             se.SchEmpID,
             e.EmployeeID, 
             e.EmployeeName, 
             d.DepartmentName,
             d.DepartmentID,
             sc.Date,
             sc.ScID,
             sc.Shift,
             se.Quantity AS PlannedQuantity,
             pr.ProductID,
             pr.ProductName,
             a.Quantity AS CompletedQuantity,
             CASE 
                 WHEN a.Alpha = 1 THEN 'Achieved the target'
                 WHEN a.Alpha < 1 THEN 'Not achieved the target'  
                 ELSE 'Exceeded the target' 
             END AS TargetStatus
         FROM 
             Employee e
         JOIN 
             Department d ON e.DepartmentID = d.DepartmentID
         JOIN 
             SchedualEmployee se ON e.EmployeeID = se.EmployeeID
         JOIN 
             SchedualCampaign sc ON se.ScID = sc.ScID
         JOIN 
             PlanCampaign pc ON sc.PlanCampaignID = pc.PlanCampaignID
         JOIN 
             Product pr ON pr.ProductID = pc.ProductID
         LEFT JOIN 
             Attendence a ON se.SchEmpID = a.SchEmpID
         WHERE 
             d.DepartmentID = ?
             AND sc.Date = ?
             AND sc.Shift = ?
         """;
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, departmentId);
            stm.setString(2, date);
            stm.setInt(3, shift);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                SchedualEmployee se = new SchedualEmployee();
                se.setId(rs.getInt("SchEmpID"));
                se.setQuantity(rs.getInt("PlannedQuantity"));
                se.setStatus(rs.getString("TargetStatus"));

                SchedualCampaign sc = new SchedualCampaign();
                sc.setId(rs.getInt("ScID"));
                sc.setDate(rs.getDate("Date"));
                sc.setShift(shift);

                // Tạo PlanCampaign object
                PlanCampaign pc = new PlanCampaign();

                // Tạo Product object và set thông tin
                Product p = new Product();
                p.setId(rs.getInt("ProductID"));
                p.setName(rs.getString("ProductName"));

                // Set Product vào PlanCampaign
                pc.setProduct(p);

                // Set PlanCampaign vào SchedualCampaign
                sc.setPlanCampaign(pc);

                se.setSchedualCampaign(sc);

                Department d = new Department();
                d.setId(rs.getInt("DepartmentID"));
                d.setName(rs.getString("DepartmentName"));

                Employee e = new Employee();
                e.setDepartment(d);
                e.setId(rs.getInt("EmployeeID"));
                e.setEmployeeName(rs.getString("EmployeeName"));
                se.setEmployee(e);

                Attendance a = new Attendance();
                a.setQuantity(rs.getDouble("CompletedQuantity"));
                se.setAttendance(a);

                schedualEmployees.add(se);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SchedualEmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (stm != null) {
                    stm.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(dao.SchedualEmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return schedualEmployees;
    }

    /*public ArrayList<SchedualEmployee> getEmployeeAttendanceHistory(int employeeId) {
        ArrayList<SchedualEmployee> attendanceHistory = new ArrayList<>();
        String sql = """
                SELECT 
                    se.SchEmpID,
                    sc.Date,
                    sc.Shift,
                    se.Quantity AS PlannedQuantity,
                    COALESCE(a.Quantity, 0) AS CompletedQuantity,
                CASE 
                    WHEN a.Alpha = 1 THEN 'Achieved the target'
                    WHEN a.Alpha < 1 THEN 'Not achieved the target'  
                    ELSE 'Exceeded the target' 
                END AS TargetStatus
                FROM 
                    SchedualEmployee se
                JOIN 
                    SchedualCampaign sc ON se.ScID = sc.ScID
                LEFT JOIN 
                    Attendence a ON se.SchEmpID = a.SchEmpID
                WHERE 
                    se.EmployeeID = ?
                ORDER BY 
                    sc.Date DESC, sc.Shift ASC;
                 """;

        try (PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, employeeId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                SchedualEmployee se = new SchedualEmployee();
                se.setId(rs.getInt("SchEmpID"));
                se.setQuantity(rs.getInt("PlannedQuantity"));
                se.setStatus(rs.getString("TargetStatus"));

                SchedualCampaign sc = new SchedualCampaign();
                sc.setDate(rs.getDate("Date"));
                sc.setShift(rs.getInt("Shift"));
                se.setSchedualCampaign(sc);

                Attendance attendance = new Attendance();
                attendance.setQuantity(rs.getDouble("CompletedQuantity"));
                se.setAttendance(attendance);

                attendanceHistory.add(se);
            }
        } catch (SQLException e) {
        }
        return attendanceHistory;
    }*/
    public ArrayList<SchedualEmployee> getEmployeeAttendanceHistory(int employeeId) {
        ArrayList<SchedualEmployee> attendanceHistory = new ArrayList<>();
        String sql = """
                SELECT 
                    se.SchEmpID,
                    sc.ScID,
                    sc.Date,
                    sc.Shift,
                    sc.Quantity AS CampaignQuantity,
                    se.Quantity AS PlannedQuantity,
                    COALESCE(a.Quantity, 0) AS CompletedQuantity,
                    COALESCE(a.Alpha, 0) AS Alpha,
                    pc.PlanCampaignID,
                    pc.Quantity AS PlanQuantity,
                    p.ProductID,
                    p.ProductName,
                CASE 
                    WHEN a.Alpha = 1 THEN 'Achieved the target'
                    WHEN a.Alpha < 1 THEN 'Not achieved the target'  
                    ELSE 'Exceeded the target' 
                END AS TargetStatus
                FROM 
                    SchedualEmployee se
                JOIN 
                    SchedualCampaign sc ON se.ScID = sc.ScID
                JOIN 
                    PlanCampaign pc ON sc.PlanCampaignID = pc.PlanCampaignID
                JOIN 
                    Product p ON pc.ProductID = p.ProductID   
                LEFT JOIN 
                    Attendence a ON se.SchEmpID = a.SchEmpID
                WHERE 
                    se.EmployeeID = ?
                ORDER BY 
                    sc.Date DESC, sc.Shift ASC;
                 """;
        try (PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, employeeId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                // Tạo Product
                Product product = new Product();
                product.setId(rs.getInt("ProductID"));
                product.setName(rs.getString("ProductName"));

                // Tạo PlanCampaign
                PlanCampaign planCampaign = new PlanCampaign();
                planCampaign.setId(rs.getInt("PlanCampaignID"));
                planCampaign.setProduct(product);
                planCampaign.setQuantity(rs.getInt("PlanQuantity"));

                // Tạo SchedualCampaign
                SchedualCampaign schedualCampaign = new SchedualCampaign();
                schedualCampaign.setId(rs.getInt("ScID"));
                schedualCampaign.setPlanCampaign(planCampaign);
                schedualCampaign.setDate(rs.getDate("Date"));
                schedualCampaign.setShift(rs.getInt("Shift"));
                schedualCampaign.setQuantity(rs.getInt("CampaignQuantity"));

                // Tạo Attendance nếu có
                Attendance attendance = new Attendance();
                attendance.setQuantity(rs.getDouble("CompletedQuantity"));
                attendance.setAlpha(rs.getDouble("Alpha"));
               

                // Tạo SchedualEmployee
                SchedualEmployee schedualEmployee = new SchedualEmployee();
                schedualEmployee.setId(rs.getInt("SchEmpID"));
                schedualEmployee.setSchedualCampaign(schedualCampaign);
                schedualEmployee.setQuantity(rs.getDouble("PlannedQuantity"));
                schedualEmployee.setAttendance(attendance);
                schedualEmployee.setStatus(rs.getString("TargetStatus"));
                // Add vào list kết quả
                attendanceHistory.add(schedualEmployee);
            }
        } catch (SQLException e) {
        }
        return attendanceHistory;
    }

    public void updateAttendance(int schEmpId, double completedQuantity) {
        PreparedStatement stm = null;
        String sql = "UPDATE Attendence SET Quantity = ? WHERE SchEmpID = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setDouble(1, completedQuantity);
            stm.setInt(2, schEmpId);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SchedualEmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (stm != null) {
                    stm.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(SchedualEmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    public Employee getEmployeeName(int employeeID){
        String sql = """
                     select DISTINCT e.EmployeeName
                     from Employee e join SchedualEmployee se on e.EmployeeID = se.EmployeeID
                     where se.EmployeeID = ?
                     """;
        PreparedStatement stm = null;
        Employee e = new Employee();
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, employeeID);
            ResultSet rs = stm.executeQuery();
            
            if (rs.next()) {
                
                e.setId(employeeID);
                e.setEmployeeName(rs.getString("EmployeeName"));
             
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(SchedualEmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return  e;
    }
}
