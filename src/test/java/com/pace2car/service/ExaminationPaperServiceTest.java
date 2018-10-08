package com.pace2car.service;

import com.pace2car.entity.Examination;
import com.pace2car.entity.SmdOptions;
import com.pace2car.entity.SmdQuestions;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@ContextConfiguration("classpath:applicationContext.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class ExaminationPaperServiceTest {

    @Autowired
    private IExaminationPaperService examinationPaperService;

    @Autowired
    private IQuestionsService questionsService;

    @Test
    public void testSelectCourses() {
        Map<Integer, SmdOptions> optList = new HashMap<>();
        Examination examination = examinationPaperService.selectPaper();
        String examNo = examination.getExamNo();

        String singleIds = examination.getSingleId();
        String[] sglsId = singleIds.split(",");

        String multipleIds = examination.getMultipleId();
        String[] mtpsId = multipleIds.split(",");

        System.out.println(examNo);
        for (String s : sglsId) {
            System.out.println(s);
        }
        List<SmdQuestions> sq = new ArrayList<>();

        for (String s : sglsId) {
            Integer i = Integer.valueOf(s);
            sq.add(questionsService.selectBySmdQuesId(new SmdQuestions(i)));
        }

        for (String m : mtpsId) {
            Integer i = Integer.valueOf(m);
            sq.add(questionsService.selectBySmdQuesId(new SmdQuestions(i)));
        }

        SmdOptions options = new SmdOptions();
        for (SmdQuestions question : sq) {
            options.setQuestionId(question.getId());
            SmdOptions details = questionsService.selectBySmdOpt(options.getQuestionId());
            optList.put(question.getId(), details);
        }

        for (SmdQuestions question : sq) {
            System.out.println(question);
            SmdOptions options1 = optList.get(question.getId());
            System.out.println(options1);
        }
    }
}
