package com.pace2car.service;

import com.pace2car.entity.Examination;
import com.pace2car.entity.FspQuestions;
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

        String trueFalseId = examination.getTrueFalseId();
        String[] tfId = trueFalseId.split(",");

        String simpleAnwserId = examination.getSimpleAnwserId();
        String[] saId = simpleAnwserId.split(",");

        String programId = examination.getProgramId();
        String[] pgId = programId.split(",");

        System.out.println(examNo);
        for (String s : sglsId) {
            System.out.println(s);
        }
        List<SmdQuestions> sq = new ArrayList<>();

        List<FspQuestions> fq = new ArrayList<>();

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

        for (String t : tfId) {
            Integer i = Integer.valueOf(t);
            sq.add(questionsService.selectBySmdQuesId(new SmdQuestions(i)));
            System.out.println(sq);
        }

        for (String sa : saId) {
            Integer i = Integer.valueOf(sa);
            fq.add(questionsService.selectByFspQuesId(new FspQuestions(i)));
            System.out.println(fq);
        }

        for (String p : pgId) {
            Integer i = Integer.valueOf(p);
            fq.add(questionsService.selectByFspQuesId(new FspQuestions(i)));
            System.out.println(fq);
        }

    }
}
