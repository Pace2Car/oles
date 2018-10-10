package com.pace2car.mapper;


import com.pace2car.entity.Examination;

import java.util.List;

public interface ExaminationMapper {

    List<Examination> selectAllExamination();

    int insertExamination(Examination examination);

    int updateExamination(Examination examination);

    int deleteExamination(Examination examination);

    Examination selectExaminationByExamNo(Examination examination);

    Examination selectCurrentExamination();
}
