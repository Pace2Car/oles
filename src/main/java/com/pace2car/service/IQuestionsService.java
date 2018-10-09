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

    FspQuestions selectByFspQuesId(FspQuestions fspQuestions);

    FspAnswer selectByFspOpt(Integer fspId);

    SmdQuestions selectBySmdQuesI(Integer id);

    int updateSmdQues(SmdQuestions questions);

    int updateSmdOpt(SmdOptions options);

    FspQuestions selectByFspQuesI(Integer id);

    int updateFspQues(FspQuestions questions);

    int deleteSmdQues(SmdQuestions questions);

    int deleteSmdOpt(Integer id);

    int deleteFspQues(FspQuestions questions);
}
