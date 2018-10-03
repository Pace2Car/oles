package com.pace2car.mapper;

import com.pace2car.entity.Courses;
import java.math.BigDecimal;

public interface CoursesMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(Courses record);

    int insertSelective(Courses record);

    Courses selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(Courses record);

    int updateByPrimaryKey(Courses record);
}