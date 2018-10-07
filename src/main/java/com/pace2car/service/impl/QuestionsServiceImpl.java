package com.pace2car.service.impl;

import com.pace2car.entity.FspQuestions;
import com.pace2car.entity.SmdOptions;
import com.pace2car.entity.SmdQuestions;
import com.pace2car.entity.TechCategory;
import com.pace2car.mapper.QuestionsMapper;
import com.pace2car.service.IQuestionsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("questionsService")
public class QuestionsServiceImpl implements IQuestionsService {


    @Resource
    private QuestionsMapper questionsMapper;

    @Override
    public List<TechCategory> selectTech(Integer courseId) {
        return questionsMapper.selectTech(courseId);
    }

    @Override
    public int insertShort(FspQuestions questions) {
        return questionsMapper.insertShort(questions);
    }

    @Override
    public int insertRadio(SmdQuestions questions) {
        return questionsMapper.insertRadio(questions);
    }

    @Override
    public int insertRadioOpt(SmdOptions options) {
        return questionsMapper.insertRadioOpt(options);
    }

    @Override
    public int insertCheckBoxOpt(SmdOptions options) {
        return questionsMapper.insertCheckBoxOpt(options);
    }

    @Override
    public int insertCheckBox(SmdQuestions questions) {
        return questionsMapper.insertCheckBox(questions);
    }

    @Override
    public int insertJudge(SmdQuestions questions) {
        return questionsMapper.insertJudge(questions);
    }

    @Override
    public int insertProgram(FspQuestions questions) {
        return questionsMapper.insertProgram(questions);
    }


}
