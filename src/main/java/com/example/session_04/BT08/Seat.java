package com.example.session_04.BT08;

public class Seat {
    private String code;
    private String name;
    private double price;
    private boolean booked;

    public Seat() {
    }

    public Seat(java.lang.String name, java.lang.String code, double price, boolean booked) {
        this.name = name;
        this.code = code;
        this.price = price;
        this.booked = booked;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public boolean isBooked() {
        return booked;
    }

    public void setBooked(boolean booked) {
        this.booked = booked;
    }
}
