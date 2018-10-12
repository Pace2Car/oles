package com.pace2car.service;

import com.pace2car.entity.Examination;
import com.pace2car.entity.FspAnswer;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;


@ContextConfiguration("classpath:applicationContext.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class SubjectiveAnswerServiceTest {

    @Autowired
    private IFspAnswerService subjectiveAnswerService;

    @Test
    public void testSelectCourses() {
        List<FspAnswer> answer = subjectiveAnswerService.selectAnswerByUser(null);
        for (FspAnswer fspAnswer : answer) {
            System.out.println(fspAnswer);
        }
    }

    @Test
    public void testSelectUserInExam() throws Exception {
        Examination e = new Examination();
        e.setExamNo("Test18101202");
        List<FspAnswer> userList = subjectiveAnswerService.selectUserInExam(e);
        for (FspAnswer user : userList) {
            System.out.println(user+"----------------------------------");
            List<FspAnswer> fspAnswers = subjectiveAnswerService.selectAnswerByUser(null);
            for (FspAnswer answer : fspAnswers) {
                System.out.println(answer);
            }
        }
    }
}
