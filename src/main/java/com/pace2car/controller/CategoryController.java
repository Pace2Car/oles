package com.pace2car.controller;

import com.github.pagehelper.Page;
import com.pace2car.entity.Courses;
import com.pace2car.entity.TechCategory;
import com.pace2car.service.ICoursesService;
import com.pace2car.service.ITechCategoryService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

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

    @Autowired
    private ITechCategoryService techCategoryService;

    @RequestMapping("/searchCourse")
    public String searchCourse(Courses courses, ModelMap modelMap, HttpSession session) {
        List<Courses> page = null;
        if (courses != null && courses.getId() != null) {
            page = coursesService.selectCourses(courses);
            Courses oldCourse = page.get(0);
            modelMap.addAttribute("oldCourse", oldCourse);
            return "updateCourse";
        }
        page = coursesService.selectCourses(courses);
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

    @RequestMapping("/searchTechCategory")
    public String searchTechCategory(TechCategory techCategory, Integer pageNum, ModelMap modelMap, HttpSession session) {
        List<TechCategory> page = null;
        if (pageNum == null) {
            pageNum = 1;
        }
        if (techCategory != null && techCategory.getId() != null) {
            page = techCategoryService.selectTechCategorys(techCategory);
            TechCategory oldTechCategory = page.get(0);
            modelMap.addAttribute("oldTechCategory", oldTechCategory);
            return "updateTechCategory";
        }
        if (techCategory == null || techCategory.getTechCtgr() == null) {
            techCategory = (TechCategory) session.getAttribute("techCategory");
        }
        page = techCategoryService.selectTechCategorys(techCategory);
        modelMap.addAttribute("page", page);
        session.setAttribute("techCategory", techCategory);

        return "techCategoryList";
    }

    @RequestMapping("/updateTechCategory")
    public void updateTechCategory(TechCategory techCategory, HttpServletResponse response) {
        try {
            if (techCategoryService.updateTechCategory(techCategory) > 0) {
                response.getWriter().write("{\"actionFlag\": true}");
            } else {
                response.getWriter().write("{\"actionFlag\": false}");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/insertTechCategory")
    public void insertTechCategory(TechCategory techCategory, HttpServletResponse response) {
        try {
            if (techCategoryService.insertTechCategory(techCategory) > 0) {
                response.getWriter().write("{\"actionFlag\": true}");
            } else {
                response.getWriter().write("{\"actionFlag\": false}");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/deleteTechCategory")
    public void deleteTechCategory(TechCategory techCategory, HttpServletResponse response) {
        try {
            if (techCategoryService.deleteTechCategory(techCategory) > 0) {
                response.getWriter().write("{\"actionFlag\": true}");
            } else {
                response.getWriter().write("{\"actionFlag\": false}");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value = {"/load_courses"}, method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public List<Courses> loadCouses() {
        return coursesService.selectCourses(null);
    }

}
