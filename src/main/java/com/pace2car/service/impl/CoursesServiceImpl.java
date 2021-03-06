package com.pace2car.service.impl;

import com.github.pagehelper.PageHelper;
import com.pace2car.entity.Courses;
import com.pace2car.mapper.CoursesMapper;
import com.pace2car.service.ICoursesService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author Pace2Car
 * @date 2018/10/4 11:37
 */
@Service("coursesService")
public class CoursesServiceImpl implements ICoursesService {

    @Resource
    private CoursesMapper coursesMapper;

    @Override
    public List<Courses> selectCourses(Courses courses) {
        return coursesMapper.selectCourses(courses);
    }

    @Override
    public int insertCourse(Courses courses) {
        return coursesMapper.insertCourse(courses);
    }

    @Override
    public int updateCourse(Courses courses) {
        return coursesMapper.updateCourse(courses);
    }

    @Override
    public int deleteCourse(Courses courses) {
        return coursesMapper.deleteCourse(courses);
    }

}
