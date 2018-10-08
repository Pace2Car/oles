package com.pace2car.controller;


import com.pace2car.entity.Examination;
import com.pace2car.entity.FspAnswer;
import com.pace2car.entity.SmdOptions;
import com.pace2car.entity.SmdQuestions;
import com.pace2car.service.IExaminationPaperService;
import com.pace2car.service.IQuestionsService;
import com.pace2car.service.ISubjectiveAnswerService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/examManage")
public class ExamManageController {

    @Autowired(required = false)
    private ISubjectiveAnswerService subjectiveAnswerService;

    @Autowired(required = false)
    private IExaminationPaperService examinationPaperService;

    @Autowired(required = false)
    private IQuestionsService questionsService;

    @RequestMapping("/subjectiveList")
    public String selectSubjective(ModelMap modelMap, FspAnswer fspAnswer) {
        List<FspAnswer> answer = subjectiveAnswerService.findSubAnswer(fspAnswer);
        String examNo = answer.get(0).getExamNo();
        modelMap.addAttribute("examNo",examNo);
        modelMap.addAttribute("answer",answer);
        return "subjectiveRead";
    }

    @RequestMapping("/examinationPaper")
    public String selectPaper(ModelMap modelMap, SmdOptions options) {
        Map<Integer, SmdOptions> optList = new HashMap<>();
        Examination examination = examinationPaperService.selectPaper();
        String examNo = examination.getExamNo();

        List<SmdQuestions> sq = new ArrayList<>();

        String singleIds = examination.getSingleId();
        String[] sglsId = singleIds.split(",");

        String multipleIds = examination.getMultipleId();
        String[] mtpsId = multipleIds.split(",");


        for (String s : sglsId) {
            Integer i = Integer.valueOf(s);
            sq.add(questionsService.selectBySmdQuesId(new SmdQuestions(i)));
        }

        for (String m : mtpsId) {
            Integer i = Integer.valueOf(m);
            sq.add(questionsService.selectBySmdQuesId(new SmdQuestions(i)));
        }

        for (SmdQuestions question : sq) {
            options.setQuestionId(question.getId());
            SmdOptions details = questionsService.selectBySmdOpt(options.getQuestionId());
            optList.put(question.getId(), details);
        }
        modelMap.addAttribute("sm", optList);
        modelMap.addAttribute("sq", sq);
        modelMap.addAttribute("exam", examNo);
        return "examinationPaper";
    }

}
