package com.pace2car.controller;

import com.github.pagehelper.Page;
import com.pace2car.entity.Courses;
import com.pace2car.service.ICoursesService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * @author Pace2Car
 * @date 2018/10/4 11:09
 */
@Controller
@RequestMapping("/category")
public class CategoryController {

    private static Logger logger = Logger.getLogger(CategoryController.class);

    @Resource
    private ICoursesService coursesService;

    @RequestMapping("/search")
    public String search(Courses courses, Integer pageNum, ModelMap modelMap, HttpSession session) {
        Page<Courses> page = null;
        if (pageNum == null) {
            pageNum = 1;
        }
        page = (Page<Courses>) coursesService.selectByName(courses, pageNum, 5);
        modelMap.addAttribute("page", page);
        session.setAttribute("courses", courses);

        return "coursesList";
    }

}
