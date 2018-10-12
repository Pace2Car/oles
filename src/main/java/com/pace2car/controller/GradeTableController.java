package com.pace2car.controller;

import com.pace2car.entity.OltsScore;
import com.pace2car.service.IFspAnswerService;
import com.pace2car.service.IGradeTableService;
import com.pace2car.service.IOltsScoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/gradeTable")
public class GradeTableController {

    @Autowired
    private IGradeTableService gradeTableService;

    @Autowired
    private IOltsScoreService oltsScoreService;

    @Autowired
    private IFspAnswerService fspAnswerService;

    @RequestMapping("/list")
    public String select(ModelMap modelMap, OltsScore oltsScore) {
        List<OltsScore> grade = gradeTableService.findStudentGrade(oltsScore);
        modelMap.addAttribute("grade",grade);
        return "gradeReview";
    }

    @RequestMapping("/updateFspScore")
    public void updateFspScore(ModelMap modelMap,OltsScore oltsScore, HttpServletResponse response) {
        try {
            if (oltsScoreService.updateScore(oltsScore) > 0) {
                fspAnswerService.updateStatus(oltsScore);
                response.getWriter().write("{\"actionFlag\": true}");
            } else {
                response.getWriter().write("{\"actionFlag\": false}");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
