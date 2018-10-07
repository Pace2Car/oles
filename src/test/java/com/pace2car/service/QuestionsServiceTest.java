package com.pace2car.service;


import com.pace2car.entity.FspQuestions;
import com.pace2car.entity.TechCategory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

@ContextConfiguration("classpath:applicationContext.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class QuestionsServiceTest {

    @Resource
    IQuestionsService questionsService;

    @Test
    public void insertShortTest(){
        int i =  questionsService.insertShort(new FspQuestions(1,"2222","2222",5,2,"222"));
        System.out.println(i);
    }
    @Test
    public void select(){
        List<TechCategory> list = questionsService.selectTech(1);
        System.out.println(list);
    }
}
