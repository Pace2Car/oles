package com.pace2car.service.impl;


import com.pace2car.entity.FspAnswer;
import com.pace2car.mapper.SubjectiveAnswerMapper;
import com.pace2car.service.ISubjectiveAnswerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("subjectiveAnswerService")
public class SubjectiveAnswerServiceImpl implements ISubjectiveAnswerService {

    @Autowired(required = false)
    private SubjectiveAnswerMapper subjectiveAnswerMapper;


    @Override
    public List<FspAnswer> findSubAnswer(FspAnswer fspAnswer) {
        return subjectiveAnswerMapper.selectAnswer(fspAnswer);
    }
}
