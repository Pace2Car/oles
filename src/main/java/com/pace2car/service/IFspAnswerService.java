package com.pace2car.service;

import com.pace2car.entity.Examination;
import com.pace2car.entity.FspAnswer;
import com.pace2car.entity.OltsScore;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


public interface IFspAnswerService {
    List<FspAnswer> selectAnswerByUser(FspAnswer fspAnswer);

    int insertAnswer(FspAnswer answer,HttpServletRequest request);

    List<FspAnswer> selectUserInExam(Examination examination);

    void updateStatus(OltsScore oltsScore);
}
