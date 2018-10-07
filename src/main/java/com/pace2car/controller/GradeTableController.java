package com.pace2car.controller;

import com.pace2car.entity.OltsScore;
import com.pace2car.service.IGradeTableService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/gradeTable")
public class GradeTableController {

    @Autowired
    private IGradeTableService gradeTableService;

    @RequestMapping("/list")
    public String select(ModelMap modelMap, OltsScore oltsScore) {
        List<OltsScore> grade = gradeTableService.findStudentGrade(oltsScore);
        modelMap.addAttribute("grade",grade);
        return "gradeReview";
    }
}
