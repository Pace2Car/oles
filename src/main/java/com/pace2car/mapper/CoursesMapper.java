package com.pace2car.mapper;

import com.pace2car.entity.Courses;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author Pace2Car
 * @date 2018/10/4 11:35
 */
@Repository
public interface CoursesMapper {

    /**
     * @param courses
     * @param pageNum
     * @param pageSize
     * @return
     */
    List<Courses> selectCourses(@Param("courses") Courses courses,
                               @Param("pageNum") int pageNum,
                               @Param("pageSize") int pageSize);

    /**
     * 加载课程下拉列表
     * @param courses
     * @return
     */
    List<Courses> selectCourses(Courses courses);

    int insertCourse(Courses courses);

    int updateCourse(Courses courses);

    int deleteCourse(Courses courses);

}
