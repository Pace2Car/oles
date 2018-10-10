package com.pace2car.service;

import com.pace2car.entity.Examination;

import java.util.List;


public interface IExaminationService {
    Examination selectExaminationByExamNo(Examination examination);

    Examination selectCurrentExamination();
}
