package com.pace2car.mapper;

import com.pace2car.entity.FspQuestions;
import com.pace2car.entity.SmdOptions;
import com.pace2car.entity.SmdQuestions;
import com.pace2car.entity.TechCategory;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface QuestionsMapper {

    int insertShort(FspQuestions questions);

    List<TechCategory> selectTech(Integer courseId);

    int insertRadio(SmdQuestions questions);

    int insertRadioOpt(SmdOptions options);

    int insertCheckBoxOpt(SmdOptions options);

    int insertCheckBox(SmdQuestions questions);

    int insertJudge(SmdQuestions questions);

    int insertProgram(FspQuestions questions);
}
