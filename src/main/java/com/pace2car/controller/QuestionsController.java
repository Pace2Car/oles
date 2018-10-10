package com.pace2car.controller;


import com.github.pagehelper.Page;
import com.pace2car.entity.*;
import com.pace2car.service.ICoursesService;
import com.pace2car.service.IExaminationService;
import com.pace2car.service.IQuestionsService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/ques")
public class QuestionsController {

    static Logger logger = Logger.getLogger(QuestionsController.class);

    @Autowired(required = false)
    IQuestionsService questionsService;

    @Autowired(required = false)
    ICoursesService coursesService;

    @Autowired(required = false)
    IExaminationService examinationService;

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

    @RequestMapping("/searchRadio")
    public String searchRadio(SmdQuestions questions,SmdOptions options,Integer pageNum, ModelMap modelMap){
        Map<Integer, SmdOptions> optList = new HashMap<>();
        Page<SmdQuestions> page = null;
        //查询
        if (pageNum == null) {
            pageNum = 1;
        }
        page = (Page<SmdQuestions>)questionsService.selectBySmdQues(questions, pageNum, 5);
        modelMap.addAttribute("ques", page);
        for (SmdQuestions h : page.getResult()) {
            SmdOptions details = new SmdOptions();
            options.setQuestionId(h.getId());
            details = questionsService.selectBySmdOpt(options.getQuestionId());
            optList.put(h.getId(),details);
        }
        modelMap.addAttribute("optList",optList);
        return "searchRadio";
    }

    @RequestMapping("/searchCheckBox")
    public String searchCheckBox(SmdQuestions questions,SmdOptions options,Integer pageNum, ModelMap modelMap){
        Map<Integer, SmdOptions> optList = new HashMap<>();
        Page<SmdQuestions> page = null;
        //查询
        if (pageNum == null) {
            pageNum = 1;
        }
        page = (Page<SmdQuestions>)questionsService.selectBySmdQues(questions, pageNum, 5);
        modelMap.addAttribute("ques", page);
        for (SmdQuestions h : page.getResult()) {
            SmdOptions details = new SmdOptions();
            options.setQuestionId(h.getId());
            details = questionsService.selectBySmdOpt(options.getQuestionId());
            optList.put(h.getId(),details);
        }
        modelMap.addAttribute("optList",optList);
        return "searchCheckBox";
    }


    @RequestMapping("/searchJudge")
    public String searchJudge(SmdQuestions questions,SmdOptions options,Integer pageNum, ModelMap modelMap){
        Map<Integer, SmdOptions> optList = new HashMap<>();
        Page<SmdQuestions> page = null;
        //查询
        if (pageNum == null) {
            pageNum = 1;
        }
        page = (Page<SmdQuestions>)questionsService.selectBySmdQues(questions, pageNum, 5);
        modelMap.addAttribute("ques", page);
        for (SmdQuestions h : page.getResult()) {
            SmdOptions details = new SmdOptions();
            options.setQuestionId(h.getId());
            details = questionsService.selectBySmdOpt(options.getQuestionId());
            optList.put(h.getId(),details);
        }
        modelMap.addAttribute("optList",optList);
        return "searchJudge";
    }

    @RequestMapping("/searchShort")
    public String searchShort(FspQuestions questions,FspAnswer answer,Integer pageNum, ModelMap modelMap){
        Map<Integer, FspAnswer> optList = new HashMap<>();
        Page<FspQuestions> page = null;
        //查询
        if (pageNum == null) {
            pageNum = 1;
        }
        page = (Page<FspQuestions>)questionsService.selectByFspQues(questions, pageNum, 5);
        modelMap.addAttribute("ques", page);
//        for (FspQuestions h : page.getResult()) {
//            FspAnswer details = new FspAnswer();
//            answer.setFspId(h.getId());
//            details = questionsService.selectByFspOpt(answer.getFspId());
//            optList.put(h.getId(),details);
//        }
//        modelMap.addAttribute("optList",optList);
        return "searchShort";
    }

    @RequestMapping("/searchProgram")
    public String searchProgram(FspQuestions questions,FspAnswer answer,Integer pageNum, ModelMap modelMap){
        Map<Integer, FspAnswer> optList = new HashMap<>();
        Page<FspQuestions> page = null;
        //查询
        if (pageNum == null) {
            pageNum = 1;
        }
        page = (Page<FspQuestions>)questionsService.selectByFspQues(questions, pageNum, 5);
        modelMap.addAttribute("ques", page);
        return "searchProgram";
    }

    @RequestMapping("/toUpdateRadio/{id}")
    public String toUpdate(@PathVariable Integer id, ModelMap modelMap,SmdQuestions questions) {
        questionsService.selectBySmdQuesId(id);
        modelMap.addAttribute("ques", questions);
        return "updateRadio";
    }

    @RequestMapping("/toAdd")
    public void updateExam(Examination examination,HttpServletResponse response){
        Examination exam = examinationService.selectExaminationByExamNo(examination);
        if(examination.getSingleId() != null) {
            String singleId = exam.getSingleId();
            if (singleId == null) {
                singleId = examination.getSingleId();
            }else{
                StringBuffer newSingleId = new StringBuffer(singleId);
                newSingleId.append(","+examination.getSingleId());
            }
        }

        if (examination.getMultipleId() != null) {
            String multipleId = exam.getMultipleId();
            if(multipleId != null) {
                StringBuffer newMultipleId = new StringBuffer(multipleId);
                newMultipleId.append(","+examination.getMultipleId());
            }else {
                multipleId=examination.getMultipleId();
            }
        }

        if (examination.getTrueFalseId() != null) {
            String trueFalseId = exam.getTrueFalseId();
            if (trueFalseId == null) {
                trueFalseId = examination.getTrueFalseId();
            }else {
                StringBuffer newTrueFalseId = new StringBuffer(trueFalseId);
                newTrueFalseId.append(","+examination.getTrueFalseId());
            }
        }

        if (examination.getSimpleAnwserId() != null) {
            String simpleAnwserId = exam.getSimpleAnwserId();
            if (simpleAnwserId == null) {
                simpleAnwserId = examination.getSimpleAnwserId();
            }else{
                StringBuffer newSimpleAnwserId = new StringBuffer(simpleAnwserId);
                newSimpleAnwserId.append(","+examination.getSimpleAnwserId());
            }
        }

        try {
            int i = questionsService.updateExam(examination);
            if (
                i > 0) {
                response.getWriter().write("{\"actionFlag\": true}");
            } else {
                response.getWriter().write("{\"actionFlag\": false}");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}

