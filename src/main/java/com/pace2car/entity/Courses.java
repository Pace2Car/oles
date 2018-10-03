package com.pace2car.entity;

import java.math.BigDecimal;

public class Courses {
    private BigDecimal id;

    private String courseName;

    public BigDecimal getId() {
        return id;
    }

    public void setId(BigDecimal id) {
        this.id = id;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName == null ? null : courseName.trim();
    }
}