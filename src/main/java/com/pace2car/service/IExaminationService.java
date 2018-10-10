package com.pace2car.service;

import com.pace2car.entity.Examination;

import java.util.List;


public interface IExaminationService {

    List<Examination> selectAllExamination();

    int insertExamination(Examination examination);

    int updateExamination(Examination examination);

    int deleteExamination(Examination examination);

    Examination selectExaminationByExamNo(Examination examination);

    Examination selectCurrentExamination();
}
