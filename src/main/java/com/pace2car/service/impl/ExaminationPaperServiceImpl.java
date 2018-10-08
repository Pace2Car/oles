package com.pace2car.service.impl;


import com.pace2car.entity.Examination;
import com.pace2car.mapper.ExaminationPaperMapper;
import com.pace2car.service.IExaminationPaperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("examinationPaperService")
public class ExaminationPaperServiceImpl implements IExaminationPaperService {

    @Autowired(required = false)
    private ExaminationPaperMapper examinationPaperMapper;


    @Override
    public List<Examination> selectPaper(Examination examination) {
        return examinationPaperMapper.selectPaper(examination);
    }
}
