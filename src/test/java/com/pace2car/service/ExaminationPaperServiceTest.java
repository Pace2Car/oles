package com.pace2car.service;

import com.pace2car.entity.Examination;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;


@ContextConfiguration("classpath:applicationContext.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class ExaminationPaperServiceTest {

    @Autowired
    private IExaminationPaperService examinationPaperService;

    @Test
    public void testSelectCourses() {
        List<Examination> examinations = examinationPaperService.selectPaper(null);
        for (Examination examination : examinations) {
            System.out.println(examination);
        }
    }
}
