/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kynqh.dtos;

import java.io.Serializable;
import java.sql.Time;
import java.util.HashMap;

/**
 *
 * @author ACER
 */
public class CartObj implements Serializable{
    private String customerName;
    private HashMap<Integer,Product> cart;

    public CartObj() {
        this.customerName = "Guest";
        this.cart = new HashMap<>();
    }

    public CartObj(String customerName) {
        this.customerName = customerName;
        this.cart = new HashMap<>();
    }
    
    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public HashMap<Integer, Product> getCart() {
        return cart;
    }
    
    public void addCart(Product dto) throws Exception {
        if(this.cart.containsKey(dto.getProID())){
            int quantity = this.cart.get(dto.getProID()).getQuantity() + 1;
            dto.setQuantity(quantity);
        }
        this.cart.put(dto.getProID(), dto);
    }
    
    public void remove(int id) throws Exception {
        if(this.cart.containsKey(id)){
            this.cart.remove(id);
        }
    }
    
    public float getTotal() throws Exception {
        float result = 0;
        for(Product dto: this.cart.values()){
            result += dto.getPrice() * dto.getQuantity();
        }
        return result;
    }
    
    public void updateCart(int id, int newQuantity) throws Exception{
        if(this.cart.containsKey(id)){
            this.cart.get(id).setQuantity(newQuantity);
        }
    }
}
