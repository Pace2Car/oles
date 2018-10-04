package com.pace2car.entity;

import java.math.BigDecimal;
import java.util.Date;

public class Examination {
    private String examNo;

    private Integer userId;

    private Date examDate;

    private String singleId;

    private String multipleId;

    private String trueFalseId;

    private String fillInGapsId;

    private String simpleAnwserId;

    private String programId;

    private String descrpt;

    private Integer validFlag;

    public Examination() {
    }

    public Examination(String examNo, Integer userId, Date examDate, String singleId, String multipleId, String trueFalseId, String fillInGapsId, String simpleAnwserId, String programId, String descrpt, Integer validFlag) {
        this.examNo = examNo;
        this.userId = userId;
        this.examDate = examDate;
        this.singleId = singleId;
        this.multipleId = multipleId;
        this.trueFalseId = trueFalseId;
        this.fillInGapsId = fillInGapsId;
        this.simpleAnwserId = simpleAnwserId;
        this.programId = programId;
        this.descrpt = descrpt;
        this.validFlag = validFlag;
    }

    public String getExamNo() {
        return examNo;
    }

    public void setExamNo(String examNo) {
        this.examNo = examNo == null ? null : examNo.trim();
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Date getExamDate() {
        return examDate;
    }

    public void setExamDate(Date examDate) {
        this.examDate = examDate;
    }

    public String getSingleId() {
        return singleId;
    }

    public void setSingleId(String singleId) {
        this.singleId = singleId == null ? null : singleId.trim();
    }

    public String getMultipleId() {
        return multipleId;
    }

    public void setMultipleId(String multipleId) {
        this.multipleId = multipleId == null ? null : multipleId.trim();
    }

    public String getTrueFalseId() {
        return trueFalseId;
    }

    public void setTrueFalseId(String trueFalseId) {
        this.trueFalseId = trueFalseId == null ? null : trueFalseId.trim();
    }

    public String getFillInGapsId() {
        return fillInGapsId;
    }

    public void setFillInGapsId(String fillInGapsId) {
        this.fillInGapsId = fillInGapsId == null ? null : fillInGapsId.trim();
    }

    public String getSimpleAnwserId() {
        return simpleAnwserId;
    }

    public void setSimpleAnwserId(String simpleAnwserId) {
        this.simpleAnwserId = simpleAnwserId == null ? null : simpleAnwserId.trim();
    }

    public String getProgramId() {
        return programId;
    }

    public void setProgramId(String programId) {
        this.programId = programId == null ? null : programId.trim();
    }

    public String getDescrpt() {
        return descrpt;
    }

    public void setDescrpt(String descrpt) {
        this.descrpt = descrpt == null ? null : descrpt.trim();
    }

    public Integer getValidFlag() {
        return validFlag;
    }

    public void setValidFlag(Integer validFlag) {
        this.validFlag = validFlag;
    }

    @Override
    public String toString() {
        return "Examination{" +
                "examNo='" + examNo + '\'' +
                ", userId=" + userId +
                ", examDate=" + examDate +
                ", singleId='" + singleId + '\'' +
                ", multipleId='" + multipleId + '\'' +
                ", trueFalseId='" + trueFalseId + '\'' +
                ", fillInGapsId='" + fillInGapsId + '\'' +
                ", simpleAnwserId='" + simpleAnwserId + '\'' +
                ", programId='" + programId + '\'' +
                ", descrpt='" + descrpt + '\'' +
                ", validFlag=" + validFlag +
                '}';
    }
}