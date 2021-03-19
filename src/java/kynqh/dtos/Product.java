/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kynqh.dtos;

import java.io.Serializable;

/**
 *
 * @author KyNQH
 */
public class Product implements Serializable {

    private String proName, proOwner, description, imgName;
    private int proID, price, cateID, quantity;

    public Product(String proName, int proID, int price) {
        this.proName = proName;
        this.proID = proID;
        this.price = price;
    }

    public Product(String proName, String imgName, int proID, int price, int quantity) {
        this.proName = proName;
        this.imgName = imgName;
        this.proID = proID;
        this.price = price;
        this.quantity = quantity;
    }

    public Product(int cateID) {
        this.cateID = cateID;
    }

    public Product(int proID, String proName, String imgName, String description, int price, int cateID) {
        this.proID = proID;
        this.proName = proName;
        this.imgName = imgName;
        this.description = description;
        this.price = price;
        this.cateID = cateID;
    }

    public Product(String description, int price, int quantity, int proID) {
        this.description = description;
        this.price = price;
        this.quantity = quantity;
        this.proID = proID;
    }

    public Product(int proID, String proName, int price, String proOwner, String description, int cateID, String imgName, int quantity) {
        this.proID = proID;
        this.proName = proName;
        this.price = price;
        this.proOwner = proOwner;
        this.description = description;
        this.cateID = cateID;
        this.imgName = imgName;
        this.quantity = quantity;
    }

    public Product(String proName, int price, String proOwner, String description, int cateID, String imgName, int quantity) {
        this.proName = proName;
        this.price = price;
        this.proOwner = proOwner;
        this.description = description;
        this.cateID = cateID;
        this.imgName = imgName;
        this.quantity = quantity;
    }

    public int getProID() {
        return proID;
    }

    public void setProID(int proID) {
        this.proID = proID;
    }

    public Product() {
    }

    public String getProName() {
        return proName;
    }

    public void setProName(String proName) {
        this.proName = proName;
    }

    public String getProOwner() {
        return proOwner;
    }

    public void setProOwner(String proOwner) {
        this.proOwner = proOwner;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImgName() {
        return imgName;
    }

    public void setImgName(String imgName) {
        this.imgName = imgName;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getCateID() {
        return cateID;
    }

    public void setCateID(int cateID) {
        this.cateID = cateID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

}
