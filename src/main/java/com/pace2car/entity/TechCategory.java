package com.pace2car.entity;


import java.io.Serializable;

public class TechCategory implements Serializable {

    private Integer id;
    private String techCtgr;
    private Integer courseId;

    private Courses course;

    public TechCategory() {
    }

    public TechCategory(Integer id, String techCtgr, Integer courseId) {
        this.id = id;
        this.techCtgr = techCtgr;
        this.courseId = courseId;
    }

    public Courses getCourse() {
        return course;
    }

    public void setCourse(Courses course) {
        this.course = course;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }


    public String getTechCtgr() {
        return techCtgr;
    }

    public void setTechCtgr(String techCtgr) {
        this.techCtgr = techCtgr;
    }


    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    @Override
    public String toString() {
        return "TechCategory{" +
                "id=" + id +
                ", techCtgr='" + techCtgr + '\'' +
                ", courseId=" + courseId +
                ", course=" + course +
                '}';
    }
}
