package com.pace2car.controller;


import com.pace2car.entity.FspAnswer;
import com.pace2car.service.ISubjectiveAnswerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/examManage")
public class ExamManageController {

    @Autowired(required = false)
    private ISubjectiveAnswerService subjectiveAnswerService;

    @RequestMapping("/subjectiveList")
    public String select(ModelMap modelMap, FspAnswer fspAnswer) {
        List<FspAnswer> answer = subjectiveAnswerService.findSubAnswer(fspAnswer);
        String examNo = answer.get(0).getExamNo();
        modelMap.addAttribute("examNo",examNo);
        modelMap.addAttribute("answer",answer);
        return "subjectiveRead";
    }

}
