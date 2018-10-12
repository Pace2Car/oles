package com.pace2car.service;

import com.pace2car.entity.OltsScore;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IGradeTableService {

    List<OltsScore> findStudentGrade(@Param("oltsScore") OltsScore oltsScore);

}
