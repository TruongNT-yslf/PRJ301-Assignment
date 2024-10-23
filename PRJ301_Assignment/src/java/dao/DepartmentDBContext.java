/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package dao;

import entity.Department;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * 
 * @author TruongNTHE186777 <truongthuankhiet@gmail.com>
 */
public class DepartmentDBContext extends DBContext<Department>{

    @Override
    public void insert(Department entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Department entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Department entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Department> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Department get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
        public ArrayList<Department> get(String type) {
        ArrayList<Department> depts = new ArrayList<>();
        PreparedStatement command = null;
        try {
            String sql = "SELECT [DepartmentID]\n"
                    + "      ,[DepartmentName]\n"
                    + "      ,[type]\n"
                    + "  FROM [Department] WHERE [type] = ?";

            command = connection.prepareStatement(sql);
            command.setString(1, type);
            ResultSet rs = command.executeQuery();
            while (rs.next()) {
                Department d = new Department();
                d.setId(rs.getInt("DepartmentID"));
                d.setName(rs.getString("DepartmentName"));
                d.setType(type);
                depts.add(d);
            }

        } catch (SQLException ex) {
            Logger.getLogger(dao.DepartmentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                command.close();
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(dao.DepartmentDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return depts;
    }

}
