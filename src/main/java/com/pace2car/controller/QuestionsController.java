package com.pace2car.controller;


import com.pace2car.entity.*;
import com.pace2car.service.ICoursesService;
import com.pace2car.service.IQuestionsService;
import com.pace2car.service.ITechCategoryService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/ques")
public class QuestionsController {

    static Logger logger = Logger.getLogger(UserController.class);

    @Resource
    IQuestionsService questionsService;
    @Resource
    ICoursesService coursesService;

    @RequestMapping(value = {"/load_courses"}, method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public List<Courses> loadCouses() {
        return coursesService.selectCourses(null);
    }

    @RequestMapping(value = {"/load_tech_by_id"},method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public List<TechCategory> loadTech(@RequestParam("courseId") Integer id){
        return questionsService.selectTech(id);
    }

    @RequestMapping("/addRadio")
    public void insertRadio(SmdQuestions questions, SmdOptions options,HttpServletResponse response){
        try {
            questionsService.insertRadio(questions);
            options.setQuestionId(questions.getId());
            if (
                questionsService.insertRadioOpt(options) > 0) {
                response.getWriter().write("{\"actionFlag\": true}");
            } else {
                response.getWriter().write("{\"actionFlag\": false}");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/addCheckBox")
    public void insertCheckBox(SmdQuestions questions, SmdOptions options,HttpServletResponse response){
        try {
            questionsService.insertCheckBox(questions);
            options.setQuestionId(questions.getId());
            if (
                    questionsService.insertCheckBoxOpt(options) > 0) {
                response.getWriter().write("{\"actionFlag\": true}");
            } else {
                response.getWriter().write("{\"actionFlag\": false}");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/addJudge")
    public void insertJudge(SmdQuestions questions,HttpServletResponse response){
        try {
            if (
                    questionsService.insertJudge(questions) > 0) {
                response.getWriter().write("{\"actionFlag\": true}");
            } else {
                response.getWriter().write("{\"actionFlag\": false}");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }



    @RequestMapping("/addShort")
    public void insertShort(FspQuestions questions, HttpServletResponse response){
        try {

            if (questionsService.insertShort(questions) > 0) {
                response.getWriter().write("{\"actionFlag\": true}");
            } else {
                response.getWriter().write("{\"actionFlag\": false}");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/addProgram")
    public void insertProgram(FspQuestions questions,HttpServletResponse response){
        try {

            if (questionsService.insertProgram(questions) > 0) {
                response.getWriter().write("{\"actionFlag\": true}");
            } else {
                response.getWriter().write("{\"actionFlag\": false}");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

