package com.pace2car.entity;


import java.io.Serializable;
import java.util.Date;

public class OltsScore implements Serializable {

  private Integer id;
  private Integer score;
  private Integer fspScore;
  private Date testDate;
  private String descrpt;
  private Integer userId;
  private String examNo;
  OltsUsers oltsUsers;

  public OltsScore(){};

  public OltsScore(Integer id, Integer score, Integer userId, OltsUsers oltsUsers) {
    this.id = id;
    this.score = score;
    this.userId = userId;
    this.oltsUsers = oltsUsers;
  }

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }


  public Integer getScore() {
    return score;
  }

  public void setScore(Integer score) {
    this.score = score;
  }


  public Integer getFspScore() {
    return fspScore;
  }

  public void setFspScore(Integer fspScore) {
    this.fspScore = fspScore;
  }


  public Date getTestDate() {
    return testDate;
  }

  public void setTestDate(Date testDate) {
    this.testDate = testDate;
  }


  public String getDescrpt() {
    return descrpt;
  }

  public void setDescrpt(String descrpt) {
    this.descrpt = descrpt;
  }


  public Integer getUserId() {
    return userId;
  }

  public void setUserId(Integer userId) {
    this.userId = userId;
  }


  public String getExamNo() {
    return examNo;
  }

  public void setExamNo(String examNo) {
    this.examNo = examNo;
  }

  public OltsUsers getOltsUsers() {
    return oltsUsers;
  }

  public void setOltsUsers(OltsUsers oltsUsers) {
    this.oltsUsers = oltsUsers;
  }

  @Override
  public String toString() {
    return "OltsScore{" +
            "id=" + id +
            ", score=" + score +
            ", fspScore=" + fspScore +
            ", testDate=" + testDate +
            ", descrpt='" + descrpt + '\'' +
            ", userId=" + userId +
            ", examNo='" + examNo + '\'' +
            ", oltsUsers=" + oltsUsers +
            '}';
  }
}
