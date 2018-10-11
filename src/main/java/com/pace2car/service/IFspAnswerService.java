package com.pace2car.service;

import com.pace2car.entity.FspAnswer;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


public interface IFspAnswerService {
    List<FspAnswer> findSubAnswer(FspAnswer fspAnswer);

    int insertAnswer(FspAnswer answer,HttpServletRequest request);
}
