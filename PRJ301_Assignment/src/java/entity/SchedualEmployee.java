/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.ArrayList;

/**
 *
 * @author TruongNTHE186777 <truongthuankhiet@gmail.com>
 */
public class SchedualEmployee {

    private int id;
    private SchedualCampaign schedualCampaign;
    private Employee employee;
    private double quantity;
    private Attendance attendance;
    private String status;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public SchedualCampaign getSchedualCampaign() {
        return schedualCampaign;
    }

    public void setSchedualCampaign(SchedualCampaign schedualCampaign) {
        this.schedualCampaign = schedualCampaign;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public double getQuantity() {
        return quantity;
    }

    public void setQuantity(double quantity) {
        this.quantity = quantity;
    }

    public Attendance getAttendance() {
        return attendance;
    }

    public void setAttendance(Attendance attendance) {
        this.attendance = attendance;
    }

}
