package com.Ecom.model;

import java.sql.Date;

public class Shop {

    private int shop_id;
    private String email;
    private String shop_name;
    private int type;
    private byte[] business_license;
    private Date establish_date;
    private String description;
    private int status;

    public int getShop_id() {
        return shop_id;
    }

    public void setShop_id(int shop_id) {
        this.shop_id = shop_id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getShop_name() {
        return shop_name;
    }

    public void setShop_name(String shop_name) {
        this.shop_name = shop_name;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public byte[] getBusiness_license() {
        return business_license;
    }

    public void setBusiness_license(byte[] business_license) {
        this.business_license = business_license;
    }

    public Date getEstablish_date() {
        return establish_date;
    }

    public void setEstablish_date(Date establish_date) {
        this.establish_date = establish_date;
    }

    public String getDescription() { return description; }

    public void setDescription(String description) { this.description = description; }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
