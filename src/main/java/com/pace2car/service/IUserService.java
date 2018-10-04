package com.pace2car.service;

import com.pace2car.entity.OltsUsers;

public interface IUserService {

    public OltsUsers selectByLogin(OltsUsers user);

}
