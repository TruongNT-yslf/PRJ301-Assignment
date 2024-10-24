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
public class PlanCampaign {
    private int id;
    private Plan plan;
    private Product product;
    private int quantity;
    private float cost;
    private ArrayList<SchedualCampaign> schedualCampaigns = new ArrayList<>();

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Plan getPlan() {
        return plan;
    }

    public void setPlan(Plan plan) {
        this.plan = plan;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getCost() {
        return cost;
    }

    public void setCost(float cost) {
        this.cost = cost;
    }

    public ArrayList<SchedualCampaign> getSchedualCampaigns() {
        return schedualCampaigns;
    }

    public void setSchedualCampaigns(ArrayList<SchedualCampaign> schedualCampaigns) {
        this.schedualCampaigns = schedualCampaigns;
    }


    
}
