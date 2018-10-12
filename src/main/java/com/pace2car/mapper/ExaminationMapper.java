package com.pace2car.mapper;


import com.pace2car.entity.Examination;
import com.pace2car.entity.FspQuestions;
import com.pace2car.entity.SmdQuestions;

import java.util.List;

public interface ExaminationMapper {

    List<Examination> selectAllExamination();

    int insertExamination(Examination examination);

    int updateExamination(Examination examination);

    int deleteExamination(Examination examination);

    int clearAllFlag();

    int setNowExam(Examination examination);

    Examination selectExaminationByExamNo(Examination examination);

    Examination selectCurrentExamination();

    List<SmdQuestions> selectSmdIdByQuestionType(Integer questionType);

    String selectSmdQuestionById(Integer id);

    List<FspQuestions> selectFspIdByQuestionType(Integer questionType);

    String selectFspQuestionById(Integer id);
}
