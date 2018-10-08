package com.pace2car.entity;


import java.io.Serializable;

public class FspAnswer implements Serializable {

    private Integer id;
    private String answer;
    private Integer fspId;
    private String examNo;
    private Integer userId;
    private Integer status;
    OltsUsers oltsUsers;
    FspQuestions fspQuestions;

    public FspAnswer() {
    }

    public FspAnswer(Integer id, String answer, Integer fspId, String examNo, Integer userId, Integer status, OltsUsers oltsUsers, FspQuestions fspQuestions) {
        this.id = id;
        this.answer = answer;
        this.fspId = fspId;
        this.examNo = examNo;
        this.userId = userId;
        this.status = status;
        this.oltsUsers = oltsUsers;
        this.fspQuestions = fspQuestions;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }


    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }


    public Integer getFspId() {
        return fspId;
    }

    public void setFspId(Integer fspId) {
        this.fspId = fspId;
    }


    public String getExamNo() {
        return examNo;
    }

    public void setExamNo(String examNo) {
        this.examNo = examNo;
    }


    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public OltsUsers getOltsUsers() {
        return oltsUsers;
    }

    public void setOltsUsers(OltsUsers oltsUsers) {
        this.oltsUsers = oltsUsers;
    }

    public FspQuestions getFspQuestions() {
        return fspQuestions;
    }

    public void setFspQuestions(FspQuestions fspQuestions) {
        this.fspQuestions = fspQuestions;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "FspAnswer{" +
                "id=" + id +
                ", answer='" + answer + '\'' +
                ", fspId=" + fspId +
                ", examNo='" + examNo + '\'' +
                ", userId=" + userId +
                ", status=" + status +
                ", oltsUsers=" + oltsUsers +
                ", fspQuestions=" + fspQuestions +
                '}';
    }
}
