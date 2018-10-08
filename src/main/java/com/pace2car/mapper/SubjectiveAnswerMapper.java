package com.pace2car.mapper;

import com.pace2car.entity.FspAnswer;

import java.util.List;

public interface SubjectiveAnswerMapper {
    List<FspAnswer> selectAnswer(FspAnswer fspAnswer);
}
