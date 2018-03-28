package com.Ecom.model;

import java.io.Serializable;

public class Order implements Serializable {
    private int order_id;
    private String email;
    private int shop_id;
    private String shop_name;
    private int product_id;
    private String product_name;
    private String property_name;
    private float unit_price;
    private int amount;
    private float shipping_fee;
    private float actual_pay;
    private int address_id;
    private String receiver_name;
    private String phone;
    private int zip_code;
    private String address;
    private String Time;
    private int status;
    private byte[] file;

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getShop_id() {
        return shop_id;
    }

    public void setShop_id(int shop_id) {
        this.shop_id = shop_id;
    }

    public String getShop_name() {
        return shop_name;
    }

    public void setShop_name(String shop_name) {
        this.shop_name = shop_name;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getProperty_name() {
        return property_name;
    }

    public void setProperty_name(String property_name) {
        this.property_name = property_name;
    }

    public float getUnit_price() {
        return unit_price;
    }

    public void setUnit_price(float unit_price) {
        this.unit_price = unit_price;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public float getShipping_fee() {
        return shipping_fee;
    }

    public void setShipping_fee(float shipping_fee) {
        this.shipping_fee = shipping_fee;
    }

    public float getActual_pay() {
        return actual_pay;
    }

    public void setActual_pay(float actual_pay) {
        this.actual_pay = actual_pay;
    }

    public int getAddress_id() {
        return address_id;
    }

    public void setAddress_id(int address_id) {
        this.address_id = address_id;
    }

    public String getReceiver_name() {
        return receiver_name;
    }

    public void setReceiver_name(String receiver_name) {
        this.receiver_name = receiver_name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getZip_code() {
        return zip_code;
    }

    public void setZip_code(int zip_code) {
        this.zip_code = zip_code;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getTime() {
        return Time;
    }

    public void setTime(String time) {
        Time = time;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public byte[] getFile() {
        return file;
    }

    public void setFile(byte[] file) {
        this.file = file;
    }
}
