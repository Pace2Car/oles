package com.pace2car.service.impl;

import com.pace2car.entity.OltsUsers;
import com.pace2car.mapper.UserMapper;
import com.pace2car.service.IUserService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;


@Service("userService")
public class UserServiceImpl implements IUserService{

    static Logger logger = Logger.getLogger(UserServiceImpl.class);

    @Resource
    private UserMapper userMapper;

    @Override
    public OltsUsers selectByLogin(OltsUsers user) {
        return this.userMapper.selectByLogin(user);
    }
}
