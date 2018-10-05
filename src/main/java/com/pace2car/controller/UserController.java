package com.pace2car.controller;


import com.github.pagehelper.Page;
import com.pace2car.entity.OltsUsers;
import com.pace2car.service.IUserService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    static Logger logger = Logger.getLogger(UserController.class);

    @Resource
    IUserService userService;

    @RequestMapping("/login")
    public String login(OltsUsers user, HttpSession session){
        System.out.println(user);
        OltsUsers usersInfo = userService.selectByLogin(user);
        if (usersInfo!=null) {
            session.setAttribute("logUser", usersInfo);
        } else {
            return "redirect:login.jsp";
        }

        return "redirect:/views/index.jsp";
    }


    @RequestMapping("/list")
    public String select(OltsUsers users, Integer pageNum, ModelMap modelMap, HttpSession session){
        Page<OltsUsers> page = null;
        //查询
        if (pageNum == null) {
            pageNum = 1;
        }

        page = (Page<OltsUsers>)userService.selectByPage(users, pageNum, 5);

        modelMap.addAttribute("page", page);

        return "userList";
    }
}
