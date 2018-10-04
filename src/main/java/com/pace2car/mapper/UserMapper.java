package com.pace2car.mapper;

import com.pace2car.entity.OltsUsers;
import org.springframework.stereotype.Repository;

@Repository
public interface UserMapper {

    public OltsUsers selectByLogin(OltsUsers user);
}
