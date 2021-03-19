/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kynqh.dtos;

import java.sql.Timestamp;

/**
 *
 * @author KyNQH
 */
public class Order {

    private long ordID;
    private String customerName;
    private float amount;
    private String fullName;
    private String address;
    private String phoneNumber;
    private Timestamp date;
    private int status;

    public Order(long ordID, String customerName, float amount, String fullName, String address, String phoneNumber, Timestamp date, int status) {
        this.ordID = ordID;
        this.customerName = customerName;
        this.amount = amount;
        this.fullName = fullName;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.date = date;
        this.status = status;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Order(long ordID, float amount, String fullName, String address, String phoneNumber, Timestamp date, int status) {
        this.ordID = ordID;
        this.amount = amount;
        this.fullName = fullName;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.date = date;
        this.status = status;
    }

    public Order() {
    }

    public Order(long ordID, String customerName, float amount, String fullName, String address, String phoneNumber, Timestamp date) {
        this.ordID = ordID;
        this.customerName = customerName;
        this.amount = amount;
        this.fullName = fullName;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.date = date;

    }

    public long getOrdID() {
        return ordID;
    }

    public void setOrdID(long ordID) {
        this.ordID = ordID;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public float getAmount() {
        return amount;
    }

    public void setAmount(float amount) {
        this.amount = amount;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

}
