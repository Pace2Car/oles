package com.pace2car.service;


import com.pace2car.entity.OltsUsers;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;

@ContextConfiguration("classpath:applicationContext.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class UserServiceTest {

    @Resource
    IUserService userService;
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Date d = new Date();


    @Test
    public void selectById() throws Exception {
        int i = this.userService.update(new OltsUsers(22,"123456789098765000","A1","B1","1",sdf.parse("2018-08-26")));
        System.out.println(i);
    }
}
