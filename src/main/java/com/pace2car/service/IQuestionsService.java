package com.pace2car.service;


import com.pace2car.entity.FspQuestions;
import com.pace2car.entity.SmdOptions;
import com.pace2car.entity.SmdQuestions;
import com.pace2car.entity.TechCategory;

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
}
