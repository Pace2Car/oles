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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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

    @RequestMapping(value = {"/load_tech_by_id"}, method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public List<TechCategory> loadTech(@RequestParam("courseId") Integer id) {
        return questionsService.selectTech(id);
    }

    @RequestMapping("/addRadio")
    public String insertRadio(SmdQuestions questions, SmdOptions options, HttpServletResponse response) {

        questionsService.insertRadio(questions);
        options.setQuestionId(questions.getId());
        questionsService.insertRadioOpt(options);
        return "addRadio";
    }

    @RequestMapping("/addCheckBox")
    public String insertCheckBox(SmdQuestions questions, SmdOptions options, HttpServletResponse response) {
        questionsService.insertCheckBox(questions);
        options.setQuestionId(questions.getId());
        questionsService.insertCheckBoxOpt(options);
        return "addCheckBox";
    }

    @RequestMapping("/addJudge")
    public String insertJudge(SmdQuestions questions, HttpServletResponse response) {
        questionsService.insertJudge(questions);
        return "addJudge";
    }


    @RequestMapping("/addShort")
    public String insertShort(FspQuestions questions, HttpServletResponse response) {
        questionsService.insertShort(questions);
        return "addShort";
    }

    @RequestMapping("/addProgram")
    public String insertProgram(FspQuestions questions, HttpServletResponse response) {
        questionsService.insertProgram(questions);
        return "addProgram";
    }

    @RequestMapping("/searchRadio")
    public String searchRadio(SmdQuestions questions, SmdOptions options, Integer pageNum, ModelMap modelMap) {
        Map<Integer, SmdOptions> optList = new HashMap<>();
        Page<SmdQuestions> page = null;
        //查询
        if (pageNum == null) {
            pageNum = 1;
        }
        page = (Page<SmdQuestions>) questionsService.selectBySmdQues(questions, pageNum, 5);
        modelMap.addAttribute("ques", page);
        for (SmdQuestions h : page.getResult()) {
            SmdOptions details = new SmdOptions();
            options.setQuestionId(h.getId());
            details = questionsService.selectBySmdOpt(options.getQuestionId());
            optList.put(h.getId(), details);
        }
        modelMap.addAttribute("optList", optList);
        return "forward:/examManage/radio";
    }

    @RequestMapping("/searchCheckBox")
    public String searchCheckBox(SmdQuestions questions, SmdOptions options, Integer pageNum, ModelMap modelMap) {
        Map<Integer, SmdOptions> optList = new HashMap<>();
        Page<SmdQuestions> page = null;
        //查询
        if (pageNum == null) {
            pageNum = 1;
        }
        page = (Page<SmdQuestions>) questionsService.selectBySmdQues(questions, pageNum, 5);
        modelMap.addAttribute("ques", page);
        for (SmdQuestions h : page.getResult()) {
            SmdOptions details = new SmdOptions();
            options.setQuestionId(h.getId());
            details = questionsService.selectBySmdOpt(options.getQuestionId());
            optList.put(h.getId(), details);
        }
        modelMap.addAttribute("optList", optList);
        return "forward:/examManage/checkBox";
    }


    @RequestMapping("/searchJudge")
    public String searchJudge(SmdQuestions questions, SmdOptions options, Integer pageNum, ModelMap modelMap) {
        Map<Integer, SmdOptions> optList = new HashMap<>();
        Page<SmdQuestions> page = null;
        //查询
        if (pageNum == null) {
            pageNum = 1;
        }
        page = (Page<SmdQuestions>) questionsService.selectBySmdQues(questions, pageNum, 5);
        modelMap.addAttribute("ques", page);
        for (SmdQuestions h : page.getResult()) {
            SmdOptions details = new SmdOptions();
            options.setQuestionId(h.getId());
            details = questionsService.selectBySmdOpt(options.getQuestionId());
            optList.put(h.getId(), details);
        }
        modelMap.addAttribute("optList", optList);
        return "forward:/examManage/judge";
    }

    @RequestMapping("/searchShort")
    public String searchShort(FspQuestions questions, FspAnswer answer, Integer pageNum, ModelMap modelMap) {
        Map<Integer, FspAnswer> optList = new HashMap<>();
        Page<FspQuestions> page = null;
        //查询
        if (pageNum == null) {
            pageNum = 1;
        }
        page = (Page<FspQuestions>) questionsService.selectByFspQues(questions, pageNum, 5);
        modelMap.addAttribute("ques", page);
//        for (FspQuestions h : page.getResult()) {
//            FspAnswer details = new FspAnswer();
//            answer.setFspId(h.getId());
//            details = questionsService.selectByFspOpt(answer.getFspId());
//            optList.put(h.getId(),details);
//        }
//        modelMap.addAttribute("optList",optList);
        return "forward:/examManage/shorts";
    }

    @RequestMapping("/searchProgram")
    public String searchProgram(FspQuestions questions, FspAnswer answer, Integer pageNum, ModelMap modelMap) {
        Map<Integer, FspAnswer> optList = new HashMap<>();
        Page<FspQuestions> page = null;
        //查询
        if (pageNum == null) {
            pageNum = 1;
        }
        page = (Page<FspQuestions>) questionsService.selectByFspQues(questions, pageNum, 5);
        modelMap.addAttribute("ques", page);
        return "forward:/examManage/program";
    }

    @RequestMapping("/toUpdateRadio/{id}")
    public String toUpdateRadio(@PathVariable Integer id, ModelMap modelMap) {
        SmdQuestions q = questionsService.selectBySmdQuesI(id);
        SmdOptions o = questionsService.selectBySmdOpt(id);
        modelMap.addAttribute("quesId", q);
        modelMap.addAttribute("optId", o);
        return "updateRadio";
    }

    @RequestMapping("/toUpdateCheckBox/{id}")
    public String toUpdateCheckBox(@PathVariable Integer id, ModelMap modelMap) {
        SmdQuestions q = questionsService.selectBySmdQuesI(id);
        SmdOptions o = questionsService.selectBySmdOpt(id);
        modelMap.addAttribute("quesId", q);
        modelMap.addAttribute("optId", o);
        return "updateCheckBox";
    }

    @RequestMapping("/toUpdateJudge/{id}")
    public String toUpdateJudge(@PathVariable Integer id, ModelMap modelMap) {
        SmdQuestions q = questionsService.selectBySmdQuesI(id);
        modelMap.addAttribute("quesId", q);
        return "updateJudge";
    }

    @RequestMapping("/toUpdateShort/{id}")
    public String toUpdateShort(@PathVariable Integer id, ModelMap modelMap) {
        FspQuestions q = questionsService.selectByFspQuesI(id);
        modelMap.addAttribute("quesId", q);
        return "updateShort";
    }

    @RequestMapping("/toUpdateProgram/{id}")
    public String toUpdateProgram(@PathVariable Integer id, ModelMap modelMap) {
        FspQuestions q = questionsService.selectByFspQuesI(id);
        modelMap.addAttribute("quesId", q);
        return "updateProgram";
    }

    @RequestMapping(value = "/updateSmd", method = RequestMethod.POST)
    public void updateSmd(SmdQuestions questions, SmdOptions options, HttpServletResponse response) {
        try {
            int i = questionsService.updateSmdQues(questions);
            options.setQuestionId(questions.getId());
            i = i + questionsService.updateSmdOpt(options);
            if (i >= 0) {
                response.getWriter().write("{\"actionFlag\": true}");
            } else {
                response.getWriter().write("{\"actionFlag\": false}");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "/updateJugde", method = RequestMethod.POST)
    public void updateJugde(SmdQuestions questions, HttpServletResponse response) {
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

    @RequestMapping(value = "/updateFsp", method = RequestMethod.POST)
    public void updateFsp(FspQuestions questions, HttpServletResponse response) {
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

    @RequestMapping(value = "/deleteSmd", method = RequestMethod.GET)
    public void deleteSmd(SmdQuestions questions, Integer id, HttpServletResponse response) {
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

    @RequestMapping(value = "/deleteFsp", method = RequestMethod.GET)
    public void deleteFsp(FspQuestions questions, HttpServletResponse response) {
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


    @RequestMapping("/toAdd")
    public void updateExam(Examination examination, HttpServletResponse response) {
        Examination exam = examinationService.selectExaminationByExamNo(examination);
        if (examination.getSingleId() != null) {
            String singleId = exam.getSingleId();
            if (singleId == null) {
                singleId = examination.getSingleId();
                exam.setSingleId(singleId);
            } else {
                StringBuffer newSingleId = new StringBuffer(singleId);
                newSingleId.append("," + examination.getSingleId());
                exam.setSingleId(newSingleId.toString());
            }
        }

        if (examination.getMultipleId() != null) {
            String multipleId = exam.getMultipleId();
            if (multipleId != null) {
                StringBuffer newMultipleId = new StringBuffer(multipleId);
                newMultipleId.append("," + examination.getMultipleId());
                exam.setMultipleId(newMultipleId.toString());
            } else {
                multipleId = examination.getMultipleId();
                exam.setMultipleId(multipleId);
            }
        }

        if (examination.getTrueFalseId() != null) {
            String trueFalseId = exam.getTrueFalseId();
            if (trueFalseId == null) {
                trueFalseId = examination.getTrueFalseId();
                exam.setTrueFalseId(trueFalseId);
            } else {
                StringBuffer newTrueFalseId = new StringBuffer(trueFalseId);
                newTrueFalseId.append("," + examination.getTrueFalseId());
                exam.setTrueFalseId(newTrueFalseId.toString());
            }
        }

        if (examination.getSimpleAnwserId() != null) {
            String simpleAnwserId = exam.getSimpleAnwserId();
            if (simpleAnwserId == null) {
                simpleAnwserId = examination.getSimpleAnwserId();
                exam.setSimpleAnwserId(simpleAnwserId);
            } else {
                StringBuffer newSimpleAnwserId = new StringBuffer(simpleAnwserId);
                newSimpleAnwserId.append("," + examination.getSimpleAnwserId());
                exam.setSimpleAnwserId(newSimpleAnwserId.toString());
            }
        }

        if (examination.getProgramId() != null) {
            String programId = exam.getProgramId();
            if (programId == null) {
                programId = examination.getProgramId();
                exam.setProgramId(programId);
            } else {
                StringBuffer newProgramIdId = new StringBuffer(programId);
                newProgramIdId.append("," + examination.getProgramId());
                exam.setProgramId(newProgramIdId.toString());
            }
        }

        try {
            int i = questionsService.updateExam(exam);
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

