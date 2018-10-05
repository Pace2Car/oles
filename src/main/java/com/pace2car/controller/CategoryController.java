package com.pace2car.controller;

import com.github.pagehelper.Page;
import com.pace2car.entity.Courses;
import com.pace2car.service.ICoursesService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @author Pace2Car
 * @date 2018/10/4 11:09
 */
@Controller
@RequestMapping("/category")
public class CategoryController {

    private static Logger logger = Logger.getLogger(CategoryController.class);

    @Autowired
    private ICoursesService coursesService;

    @RequestMapping("/search")
    public String search(Courses courses, Integer pageNum, ModelMap modelMap, HttpSession session) {
        Page<Courses> page = null;
        if (pageNum == null) {
            pageNum = 1;
        }
        if (courses != null && courses.getId() != null) {
            page = (Page<Courses>) coursesService.selectCourses(courses, 0, 0);
            Courses oldCourse = page.get(0);
            modelMap.addAttribute("oldCourse", oldCourse);
            return "updateCourse";
        }
        if (courses == null || courses.getCourseName() == null) {
            courses = (Courses) session.getAttribute("courses");
        }
        page = (Page<Courses>) coursesService.selectCourses(courses, pageNum, 5);
        modelMap.addAttribute("page", page);
        session.setAttribute("courses", courses);

        return "coursesList";
    }

    @RequestMapping("/updateCourse")
    public void updateCourse(Courses courses, HttpServletResponse response) {
        try {
            if (coursesService.updateCourse(courses) > 0) {
                response.getWriter().write("{\"actionFlag\": true}");
            } else {
                response.getWriter().write("{\"actionFlag\": false}");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/insertCourse")
    public void insertCourse(Courses courses, HttpServletResponse response) {
        try {
            if (coursesService.insertCourse(courses) > 0) {
                response.getWriter().write("{\"actionFlag\": true}");
            } else {
                response.getWriter().write("{\"actionFlag\": false}");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/deleteCourse")
    public void deleteCourse(Courses courses, HttpServletResponse response) {
        try {
            if (coursesService.deleteCourse(courses) > 0) {
                response.getWriter().write("{\"actionFlag\": true}");
            } else {
                response.getWriter().write("{\"actionFlag\": false}");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
