package com.pace2car.service;

import com.pace2car.entity.OltsScore;

import java.util.List;

public interface IGradeTableService {

    List<OltsScore> findStudentGrade(OltsScore oltsScore);

}
