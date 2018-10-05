package com.pace2car.service;

import com.pace2car.entity.OltsUsers;

import java.util.List;

public interface IUserService {

    public OltsUsers selectByLogin(OltsUsers user);

    List<OltsUsers> selectByPage(OltsUsers users, int pageNum, int pageSize);
}
