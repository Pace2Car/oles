package com.pace2car.service;

import com.pace2car.entity.FspAnswer;
import java.util.List;


public interface IFspAnswerService {
    List<FspAnswer> findSubAnswer(FspAnswer fspAnswer);
}
