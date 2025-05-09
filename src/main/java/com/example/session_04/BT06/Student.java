package com.example.session_04.BT06;

public class Student {
    private int id;
    private String name;
    private int age;
    private double avg;

    public Student() {
    }

    public Student(int id, java.lang.String name, int age, double avg) {
        this.id = id;
        this.name = name;
        this.age = age;
        this.avg = avg;
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

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public double getAvg() {
        return avg;
    }

    public void setAvg(double avg) {
        this.avg = avg;
    }
}
