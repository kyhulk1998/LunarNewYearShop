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
public class RegisterErrorObject implements Serializable {

    private String usernameErr;

    public RegisterErrorObject() {
    }

    public String getUsernameErr() {
        return usernameErr;
    }

    public void setUsernameErr(String usernameErr) {
        this.usernameErr = usernameErr;
    }

}
