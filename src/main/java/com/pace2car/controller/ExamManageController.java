package com.pace2car.controller;


import com.pace2car.entity.*;
import com.pace2car.service.IExaminationService;
import com.pace2car.service.IFspAnswerService;
import com.pace2car.service.IQuestionsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/examManage")
public class ExamManageController {

    @Autowired(required = false)
    private IFspAnswerService subjectiveAnswerService;

    @Autowired(required = false)
    private IExaminationService examinationPaperService;

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
        Examination examination = examinationPaperService.selectCurrentExamination();

        List<SmdQuestions> sq = new ArrayList<>();

        List<FspQuestions> fq = new ArrayList<>();

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

        int x = 0 ;
        for (String s : sglsId) {
            Integer i = Integer.valueOf(s);
            sq.add(questionsService.selectBySmdQuesId(new SmdQuestions(i)));
            if (x>0){
                sq.get(x).setQuestionType(0);
            }
            x+=1;
        }

        int y=x;
        for (String m : mtpsId) {
            Integer i = Integer.valueOf(m);
            sq.add(questionsService.selectBySmdQuesId(new SmdQuestions(i)));
            if (y>x){
                sq.get(y).setQuestionType(-1);
            }
            y+=1;
        }

        int m=y;
        for (String t : tfId) {
            Integer i = Integer.valueOf(t);
            sq.add(questionsService.selectBySmdQuesId(new SmdQuestions(i)));
            if (m>y){
                sq.get(m).setQuestionType(-2);
            }
            m+=1;
        }

        int n=0;
        for (String sa : saId) {
            Integer i = Integer.valueOf(sa);
            fq.add(questionsService.selectByFspQuesId(new FspQuestions(i)));
            if (n>0){
                fq.get(n).setQuestionType(-3);
            }
            n+=1;
        }

        int l=n;
        for (String p : pgId) {
            Integer i = Integer.valueOf(p);
            fq.add(questionsService.selectByFspQuesId(new FspQuestions(i)));
            if (l>n){
                fq.get(l).setQuestionType(-4);
            }
            l+=1;
        }

        for (SmdQuestions question : sq) {
            options.setQuestionId(question.getId());
            SmdOptions details = questionsService.selectBySmdOpt(options.getQuestionId());
            optList.put(question.getId(), details);
        }

        modelMap.addAttribute("op", optList);
        modelMap.addAttribute("sq", sq);
        modelMap.addAttribute("fq",fq);
        modelMap.addAttribute("examination", examination);
        return "examinationPaper";
    }

}
