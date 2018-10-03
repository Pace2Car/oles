package com.pace2car.mapper;

import com.pace2car.entity.Examination;
import org.springframework.stereotype.Repository;

public interface ExaminationMapper {
    int deleteByPrimaryKey(String examNo);

    int insert(Examination record);

    int insertSelective(Examination record);

    Examination selectByPrimaryKey(String examNo);

    int updateByPrimaryKeySelective(Examination record);

    int updateByPrimaryKey(Examination record);
}