package com.pace2car.mapper;

import com.pace2car.entity.OltsUsers;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper {

    public OltsUsers selectByLogin(OltsUsers user);

    List<OltsUsers> selectByPage(@Param("users") OltsUsers users,
                                 @Param("pageNum") int pageNum,
                                 @Param("pageSize") int pageSize);

    OltsUsers selectById(Integer id);

    int update(OltsUsers user);

    void insertInfoBatch(List<OltsUsers> salaryList);

}
