package com.pace2car.service;


import com.pace2car.entity.*;

import java.util.List;

public interface IQuestionsService {

    List<TechCategory> selectTech(Integer courseId);

    int insertShort(FspQuestions questions);

    int insertRadio(SmdQuestions questions);

    int insertRadioOpt(SmdOptions options);

    int insertCheckBoxOpt(SmdOptions options);

    int insertCheckBox(SmdQuestions questions);

    int insertJudge(SmdQuestions questions);

    int insertProgram(FspQuestions questions);

    List<SmdQuestions> selectBySmdQues(SmdQuestions questions, int pageNum, int pageSize);

    SmdQuestions selectBySmdQuesId(SmdQuestions questions);

    SmdOptions selectBySmdOpt(Integer questionId);

    List<FspQuestions> selectByFspQues(FspQuestions questions, int pageNum, int pageSize);

    FspAnswer selectByFspOpt(Integer fspId);

    SmdQuestions selectBySmdQuesId(Integer id);
}
