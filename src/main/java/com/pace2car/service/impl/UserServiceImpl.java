package com.pace2car.service.impl;

import com.github.pagehelper.PageHelper;
import com.pace2car.entity.OltsUsers;
import com.pace2car.mapper.UserMapper;
import com.pace2car.service.IUserService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service("userService")
public class UserServiceImpl implements IUserService{

    static Logger logger = Logger.getLogger(UserServiceImpl.class);

    @Resource
    private UserMapper userMapper;

    @Override
    public OltsUsers selectByLogin(OltsUsers user) {
        return this.userMapper.selectByLogin(user);
    }

    @Override
    public List<OltsUsers> selectByPage(OltsUsers users, int pageNum, int pageSize) {
        //推荐这2种使用方式。pagehelp插件会自动加上分页SQL的外面两层的嵌套
        PageHelper.startPage(pageNum, pageSize);
        //PageHelper.offsetPage(pageNum, pageNum); //offsetPage()方法也可以

        return userMapper.selectByPage(users, pageNum, pageSize);
    }
}
