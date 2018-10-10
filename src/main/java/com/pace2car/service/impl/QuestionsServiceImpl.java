package com.pace2car.service.impl;

import com.github.pagehelper.PageHelper;
import com.pace2car.entity.*;
import com.pace2car.mapper.QuestionsMapper;
import com.pace2car.service.IQuestionsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("questionsService")
public class QuestionsServiceImpl implements IQuestionsService {


    @Autowired(required = false)
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

    @Override
    public List<SmdQuestions> selectBySmdQues(SmdQuestions questions, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);

        return questionsMapper.selectBySmdQues(questions, pageNum, pageSize);
    }

    @Override
    public SmdQuestions selectBySmdQuesId(SmdQuestions questions) {
        return questionsMapper.selectBySmdQuesId(questions);
    }

    @Override
    public SmdOptions selectBySmdOpt(Integer questionId) {

        return questionsMapper.selectBySmdOpt(questionId);
    }

    @Override
    public List<FspQuestions> selectByFspQues(FspQuestions questions, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);

        return questionsMapper.selectByFspQues(questions, pageNum, pageSize);
    }

    @Override
    public FspQuestions selectByFspQuesId(FspQuestions fspQuestions) {
        return questionsMapper.selectByFspQuesId(fspQuestions);
    }

    @Override
    public FspAnswer selectByFspOpt(Integer fspId) {
        return questionsMapper.selectByFspOpt(fspId);
    }

    @Override
    public SmdQuestions selectBySmdQuesI(Integer id) {
        return questionsMapper.selectBySmdQuesI(id);
    }

    @Override
    public int updateSmdQues(SmdQuestions questions) {
        return questionsMapper.updateSmdQues(questions);
    }

    @Override
    public int updateSmdOpt(SmdOptions options) {
        return questionsMapper.updateSmdOpt(options);
    }

    @Override
    public FspQuestions selectByFspQuesI(Integer id) {
        return questionsMapper.selectByFspQuesI(id);
    }

    @Override
    public int updateFspQues(FspQuestions questions) {
        return questionsMapper.updateFspQues(questions);
    }

    @Override
    public int deleteSmdQues(SmdQuestions questions) {
        return questionsMapper.deleteSmdQues(questions);
    }

    @Override
    public int deleteSmdOpt(Integer id) {
        return questionsMapper.deleteSmdOpt(id);
    }

    @Override
    public int deleteFspQues(FspQuestions questions) {
        return questionsMapper.deleteFspQues(questions);
    }

    @Override
    public int updateExam(Examination examination) {
        return questionsMapper.updateExam(examination);
    }
}
