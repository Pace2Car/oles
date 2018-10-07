package com.pace2car.service;

import com.pace2car.entity.OltsScore;
import com.pace2car.entity.OltsUsers;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;


@ContextConfiguration("classpath:applicationContext.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class GradeTableServiceTest {

    @Autowired
    private IGradeTableService gradeTableService;

    @Test
    public void testSelectCourses() {
        List<OltsScore> studentGrade = gradeTableService.findStudentGrade(new OltsScore(1,88,1,new OltsUsers(1,"卢阳","男","计算机","四川工商")));
        for (OltsScore oltsScore : studentGrade) {
            System.out.println(oltsScore);
        }
    }
}
