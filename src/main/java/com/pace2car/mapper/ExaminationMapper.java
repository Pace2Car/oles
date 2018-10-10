package com.pace2car.mapper;


import com.pace2car.entity.Examination;

import java.util.List;

public interface ExaminationMapper {
    Examination selectExaminationByExamNo(Examination examination);

    Examination selectCurrentExamination();
}
