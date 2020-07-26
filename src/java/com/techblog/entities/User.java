/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.techblog.entities;

import java.sql.Timestamp;


public class User {

    private int id;
    private String name;
    private String email;
    private String password;
    private int mobno;
    private String gender;
    private String profile;
    private Timestamp datTime;

    public User(int id, String name, String email, String password, int mobno, String gender, Timestamp datTime) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.mobno = mobno;
        this.gender = gender;
        this.datTime = datTime;
    }

    public User() {
    }

    public User(String name, String email, String password, int mobno, String gender) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.mobno = mobno;
        this.gender = gender;
       
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getMobno() {
        return mobno;
    }

    public void setMobno(int mobno) {
        this.mobno = mobno;
    }

    public String getGender() {
        return gender;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Timestamp getDatTime() {
        return datTime;
    }

    public void setDatTime(Timestamp datTime) {
        this.datTime = datTime;
    }
    
    
}
