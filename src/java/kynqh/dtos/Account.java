/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kynqh.dtos;

import java.io.Serializable;

/**
 *
 * @author USER
 */
public class Account implements Serializable {

    private String username;
    private String password;
    private int isSell;
    private int isAdmin;
    private int isActive;
    private String usrAddress, phoneNumber, fullName;

    public Account(String username, String fullName, String usrAddress, String phoneNumber, int isSell, int isAdmin, int isActive) {
        this.username = username;
        this.fullName = fullName;
        this.usrAddress = usrAddress;
        this.phoneNumber = phoneNumber;
        this.isSell = isSell;
        this.isAdmin = isAdmin;
        this.isActive = isActive;
    }

    public Account() {
    }

    public Account(String username, int isSell, int isAdmin, int isActive) {
        this.username = username;
        this.isSell = isSell;
        this.isAdmin = isAdmin;
        this.isActive = isActive;
    }
    
        public Account(String username, String password, int isSell, int isAdmin, int isActive) {
        this.username = username;
        this.password = password;
        this.isSell = isSell;
        this.isAdmin = isAdmin;
        this.isActive = isActive;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getIsSell() {
        return isSell;
    }

    public void setIsSell(int isSell) {
        this.isSell = isSell;
    }

    public int getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(int isAdmin) {
        this.isAdmin = isAdmin;
    }

    public int getIsActive() {
        return isActive;
    }

    public void setIsActive(int isActive) {
        this.isActive = isActive;
    }
}
