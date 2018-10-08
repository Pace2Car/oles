package com.pace2car.mapper;


import com.pace2car.entity.Examination;

import java.util.List;

public interface ExaminationPaperMapper {
    List<Examination> selectPaper(Examination Examination);
}
