/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.Department;
import entity.Employee;
import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author TruongNTHE186777 <truongthuankhiet@gmail.com>
 */
public class EmployeeDBContext extends DBContext<Employee> {

    @Override
    public void insert(Employee entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Employee entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Employee entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Employee> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Employee get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

public ArrayList<Employee> getTopEmployeesByDepartment(int limit) {
    ArrayList<Employee> emps = new ArrayList<>();
    PreparedStatement stm = null;
    String sql = """
                    SELECT 
                        DepartmentID, DepartmentName, EmployeeID, EmployeeName, Productivity
                    FROM (
                        SELECT 
                            d.DepartmentID,
                            d.DepartmentName,
                            e.EmployeeID,
                            e.EmployeeName,
                            SUM(a.Alpha) / COUNT(DISTINCT a.AttendentID) AS Productivity,
                            ROW_NUMBER() OVER (PARTITION BY d.DepartmentID ORDER BY SUM(a.Alpha) / COUNT(DISTINCT a.AttendentID) DESC) as rn
                        FROM 
                            Department d
                        JOIN 
                            Employee e ON d.DepartmentID = e.DepartmentID
                        JOIN 
                            SchedualEmployee se ON e.EmployeeID = se.EmployeeID
                        JOIN 
                            Attendence a ON se.SchEmpID = a.SchEmpID
                        GROUP BY 
                            d.DepartmentID, d.DepartmentName, e.EmployeeID, e.EmployeeName
                    ) AS ranked
                    WHERE rn <= ?
                    ORDER BY DepartmentName, Productivity DESC;
                 """;
    try {
        stm = connection.prepareStatement(sql);
        stm.setInt(1, limit);
        ResultSet rs = stm.executeQuery();
        while (rs.next()) {
            Department d = new Department();
            d.setId(rs.getInt("DepartmentID"));
            d.setName(rs.getString("DepartmentName"));
            Employee e = new Employee();
            e.setId(rs.getInt("EmployeeID"));
            e.setEmployeeName(rs.getString("EmployeeName"));
            e.setProductivity(rs.getDouble("Productivity"));
            e.setDepartment(d);
            emps.add(e);
        }
    } catch (SQLException ex) {
        Logger.getLogger(EmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
    }
    return emps;
}

}
