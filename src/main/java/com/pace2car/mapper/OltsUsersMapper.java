package com.pace2car.mapper;

import com.pace2car.entity.OltsUsers;
import java.math.BigDecimal;

public interface OltsUsersMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(OltsUsers record);

    int insertSelective(OltsUsers record);

    OltsUsers selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(OltsUsers record);

    int updateByPrimaryKey(OltsUsers record);
}