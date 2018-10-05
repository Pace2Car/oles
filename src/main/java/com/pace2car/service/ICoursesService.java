package com.pace2car.service;

import com.pace2car.entity.Courses;

import java.util.List;

/**
 * @author Pace2Car
 * @date 2018/10/4 11:37
 */
public interface ICoursesService {

    /**
     * @param courses     查询条件
     * @param pageNum     页码
     * @param pageSize    条数
     * @return
     */
    List<Courses> selectCourses(Courses courses, int pageNum, int pageSize);

    int insertCourse(Courses courses);

    int updateCourse(Courses courses);

    int deleteCourse(Courses courses);

}
