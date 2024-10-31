/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import entity.accesscontrol.Role;
import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author TruongNTHE186777 <truongthuankhiet@gmail.com>
 */
public class Employee {

    private int id;
    private String employeeName;
    private boolean gender;
    private String address;
    private java.sql.Date dob;
    private Role role;
    private Department department;
    private double salary;
    private ArrayList<SchedualEmployee> schedualEmployees = new ArrayList<>();
    private double productivity;

    
    public double getProductivity() {
        return productivity;
    }

    public void setProductivity(double productivity) {
        this.productivity = productivity;
    }   

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    public ArrayList<SchedualEmployee> getSchedualEmployees() {
        return schedualEmployees;
    }

    public void setSchedualEmployees(ArrayList<SchedualEmployee> schedualEmployees) {
        this.schedualEmployees = schedualEmployees;
    }

}
