package com.pace2car.service.impl;


import com.pace2car.entity.FspAnswer;
import com.pace2car.mapper.FspAnswerMapper;
import com.pace2car.service.IFspAnswerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("subjectiveAnswerService")
public class FspAnswerServiceImpl implements IFspAnswerService {

    @Autowired(required = false)
    private FspAnswerMapper fspAnswerMapper;


    @Override
    public List<FspAnswer> findSubAnswer(FspAnswer fspAnswer) {
        return fspAnswerMapper.selectAnswer(fspAnswer);
    }
}
