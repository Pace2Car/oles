package com.pace2car.service.impl;


import com.pace2car.entity.Examination;
import com.pace2car.mapper.ExaminationMapper;
import com.pace2car.service.IExaminationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("examinationPaperService")
public class ExaminationServiceImpl implements IExaminationService {

    @Autowired(required = false)
    private ExaminationMapper examinationMapper;


    @Override
    public List<Examination> selectAllExamination() {
        return examinationMapper.selectAllExamination();
    }

    @Override
    public int insertExamination(Examination examination) {
        return examinationMapper.insertExamination(examination);
    }

    @Override
    public int updateExamination(Examination examination) {
        return examinationMapper.updateExamination(examination);
    }

    @Override
    public int deleteExamination(Examination examination) {
        return examinationMapper.deleteExamination(examination);
    }

    @Override
    public Examination selectExaminationByExamNo(Examination examination) {
        return examinationMapper.selectExaminationByExamNo(examination);
    }

    @Override
    public Examination selectCurrentExamination() {
        return examinationMapper.selectCurrentExamination();
    }
}
