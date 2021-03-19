/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kynqh.dtos;

/**
 *
 * @author KyNQH
 */
public class OrderDetail {

    private long orderDetailID;
    private long ordID;
    private int proID;
    private int price;
    private int quantity;
    

    public OrderDetail() {
    }

    public OrderDetail(long orderDetailID, long ordID, int proID, int price, int quantity) {
        this.orderDetailID = orderDetailID;
        this.ordID = ordID;
        this.proID = proID;
        this.price = price;
        this.quantity = quantity;
    
    }


    public long getOrderDetailID() {
        return orderDetailID;
    }

    public void setOrderDetailID(long orderDetailID) {
        this.orderDetailID = orderDetailID;
    }

    public long getOrdID() {
        return ordID;
    }

    public void setOrdID(long ordID) {
        this.ordID = ordID;
    }

    public int getProID() {
        return proID;
    }

    public void setProID(int proID) {
        this.proID = proID;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

}
