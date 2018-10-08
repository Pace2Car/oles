package com.pace2car.service;

import com.pace2car.entity.Courses;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * @author Pace2Car
 * @date 2018/10/4 16:53
 */
@ContextConfiguration("classpath:applicationContext.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class CoursesServiceTest {

    @Autowired
    private ICoursesService coursesService;

    @Test
    public void testSelectCourses() {
        List<Courses> coursesList = coursesService.selectCourses(new Courses(null, "J"));
        for (Courses courses : coursesList) {
            System.out.println(courses);
        }
    }
}
