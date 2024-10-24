/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package entity;

/**
 * 
 * @author TruongNTHE186777 <truongthuankhiet@gmail.com>
 */
public class Attendance {
    private int id;
    private int schEmpID;
    private double quantity;
    private double alpha;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSchEmpID() {
        return schEmpID;
    }

    public void setSchEmpID(int schEmpID) {
        this.schEmpID = schEmpID;
    }

    public double getQuantity() {
        return quantity;
    }

    public void setQuantity(double quantity) {
        this.quantity = quantity;
    }

    public double getAlpha() {
        return alpha;
    }

    public void setAlpha(double alpha) {
        this.alpha = alpha;
    }
}
