package com.pace2car.mapper;

import com.pace2car.entity.OltsScore;
import com.pace2car.entity.OltsUsers;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GradeTableMapper {
    List<OltsScore> findStudentGrade(@Param("oltsScore") OltsScore oltsScore);
}
