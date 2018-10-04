package com.pace2car.entity;


public class FspAnswer {

    private Integer id;
    private String answer;
    private Integer fspId;
    private String examNo;
    private Integer userId;

    public FspAnswer() {
    }

    public FspAnswer(Integer id, String answer, Integer fspId, String examNo, Integer userId) {
        this.id = id;
        this.answer = answer;
        this.fspId = fspId;
        this.examNo = examNo;
        this.userId = userId;
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

    @Override
    public String toString() {
        return "FspAnswer{" +
                "id=" + id +
                ", answer='" + answer + '\'' +
                ", fspId=" + fspId +
                ", examNo='" + examNo + '\'' +
                ", userId=" + userId +
                '}';
    }
}
