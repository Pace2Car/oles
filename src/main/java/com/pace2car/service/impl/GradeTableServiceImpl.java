package com.pace2car.service.impl;

import com.pace2car.entity.OltsScore;
import com.pace2car.mapper.GradeTableMapper;
import com.pace2car.service.IGradeTableService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("gradeTableService")
public class GradeTableServiceImpl implements IGradeTableService {

    @Autowired(required = false)
    private GradeTableMapper gradeTableMapper;

    @Override
    public List<OltsScore> findStudentGrade(OltsScore oltsScore) {
        return gradeTableMapper.findStudentGrade(oltsScore);
    }
}
