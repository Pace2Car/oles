package com.pace2car.controller;


import com.github.pagehelper.Page;
import com.pace2car.entity.*;
import com.pace2car.service.ICoursesService;
import com.pace2car.service.IQuestionsService;
import com.pace2car.service.ITechCategoryService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/ques")
public class QuestionsController {

    static Logger logger = Logger.getLogger(QuestionsController.class);

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
    public String toUpdateRadio(@PathVariable Integer id,ModelMap modelMap) {
        SmdQuestions q = questionsService.selectBySmdQuesI(id);
        SmdOptions o = questionsService.selectBySmdOpt(id);
        modelMap.addAttribute("quesId", q);
        modelMap.addAttribute("optId", o);
        return "updateRadio";
    }

    @RequestMapping("/toUpdateCheckBox/{id}")
    public String toUpdateCheckBox(@PathVariable Integer id,ModelMap modelMap) {
        SmdQuestions q = questionsService.selectBySmdQuesI(id);
        SmdOptions o = questionsService.selectBySmdOpt(id);
        modelMap.addAttribute("quesId", q);
        modelMap.addAttribute("optId", o);
        return "updateCheckBox";
    }

    @RequestMapping("/toUpdateJudge/{id}")
    public String toUpdateJudge(@PathVariable Integer id,ModelMap modelMap) {
        SmdQuestions q = questionsService.selectBySmdQuesI(id);
        modelMap.addAttribute("quesId", q);
        return "updateJudge";
    }

    @RequestMapping("/toUpdateShort/{id}")
    public String toUpdateShort(@PathVariable Integer id,ModelMap modelMap) {
        FspQuestions q = questionsService.selectByFspQuesI(id);
        modelMap.addAttribute("quesId", q);
        return "updateShort";
    }

    @RequestMapping("/toUpdateProgram/{id}")
    public String toUpdateProgram(@PathVariable Integer id,ModelMap modelMap) {
        FspQuestions q = questionsService.selectByFspQuesI(id);
        modelMap.addAttribute("quesId", q);
        return "updateProgram";
    }

    @RequestMapping(value="/updateSmd", method = RequestMethod.POST)
    public void updateSmd(SmdQuestions questions,SmdOptions options,HttpServletResponse response){
        try {
            int i = questionsService.updateSmdQues(questions);
            options.setQuestionId(questions.getId());
            i =i + questionsService.updateSmdOpt(options);
            if (i >= 0) {
                response.getWriter().write("{\"actionFlag\": true}");
            } else {
                response.getWriter().write("{\"actionFlag\": false}");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value="/updateJugde", method = RequestMethod.POST)
    public void updateJugde(SmdQuestions questions,HttpServletResponse response){
        try {
            int i = questionsService.updateSmdQues(questions);
            if (i >= 0) {
                response.getWriter().write("{\"actionFlag\": true}");
            } else {
                response.getWriter().write("{\"actionFlag\": false}");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value="/updateFsp", method = RequestMethod.POST)
    public void updateFsp(FspQuestions questions,HttpServletResponse response){
        try {
            int i = questionsService.updateFspQues(questions);
            if (i > 0) {
                response.getWriter().write("{\"actionFlag\": true}");
            } else {
                response.getWriter().write("{\"actionFlag\": false}");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value="/deleteSmd", method = RequestMethod.GET)
    public void deleteSmd(SmdQuestions questions, Integer id,HttpServletResponse response){
        try {
            int i = questionsService.deleteSmdOpt(id);
            i += questionsService.deleteSmdQues(questions);
            if (i > 0) {
                response.getWriter().write("{\"actionFlag\": true}");
            } else {
                response.getWriter().write("{\"actionFlag\": false}");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value="/deleteFsp", method = RequestMethod.GET)
    public void deleteFsp(FspQuestions questions, HttpServletResponse response){
        try {
            int i = questionsService.deleteFspQues(questions);
            if (i > 0) {
                response.getWriter().write("{\"actionFlag\": true}");
            } else {
                response.getWriter().write("{\"actionFlag\": false}");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

