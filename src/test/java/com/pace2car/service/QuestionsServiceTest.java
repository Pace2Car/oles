package com.pace2car.service;


import com.pace2car.entity.FspQuestions;
import com.pace2car.entity.SmdOptions;
import com.pace2car.entity.SmdQuestions;
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

    @Test
    public void selectByPage() throws Exception {
        // 第1页，每页5条
        // <a>First</a>
        SmdQuestions smdQuestions = new SmdQuestions(null,null,null,null,null,null,null);
        smdQuestions.setQuestion("1");
        smdQuestions.setTechCateId(3);
        com.github.pagehelper.Page<SmdQuestions> page = (com.github.pagehelper.Page<SmdQuestions>)questionsService.selectBySmdQues(smdQuestions, 1, 5);
        System.out.println(">>>>" + page);
        System.out.println("===========");

        for (SmdQuestions h : page.getResult()) {
            System.out.println(h.getId());
        }
    }

    @Test
    public void selectBySmdOpt() throws Exception {
        // 第1页，每页5条
        // <a>First</a>
        SmdOptions list= questionsService.selectBySmdOpt(44);
        System.out.println("===========");
        System.out.println(list.getOptionA());
    }
}
