/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author TruongNTHE186777 <truongthuankhiet@gmail.com>
 */
public class SchedualCampaign {

    private int id;
    private PlanCampaign planCampaign;
    private java.sql.Date date;
    private int shift;
    private int quantity;
    private ArrayList<SchedualEmployee> schedualEmployees = new ArrayList<>();

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public PlanCampaign getPlanCampaign() {
        return planCampaign;
    }

    public void setPlanCampaign(PlanCampaign planCampaign) {
        this.planCampaign = planCampaign;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getShift() {
        return shift;
    }

    public void setShift(int shift) {
        this.shift = shift;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public ArrayList<SchedualEmployee> getSchedualEmployees() {
        return schedualEmployees;
    }

    public void setSchedualEmployees(ArrayList<SchedualEmployee> schedualEmployees) {
        this.schedualEmployees = schedualEmployees;
    }

}
