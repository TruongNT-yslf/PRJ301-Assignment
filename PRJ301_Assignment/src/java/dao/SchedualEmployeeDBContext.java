/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.Attendance;
import entity.Department;
import entity.Employee;
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
                stm.close();
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(dao.SchedualEmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return schedualEmployees;
    }

    public ArrayList<SchedualEmployee> getEmployeeAttendanceHistory(int employeeId) {
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
    }

}
