package com.pace2car.controller;


import com.github.pagehelper.Page;
import com.pace2car.entity.OltsUsers;
import com.pace2car.service.IUserService;
import org.apache.http.HttpResponse;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    static Logger logger = Logger.getLogger(UserController.class);

    @Autowired
    IUserService userService;

    @RequestMapping("/login")
    public String login(OltsUsers user, HttpSession session){
        OltsUsers usersInfo = userService.selectByLogin(user);
        logger.warn(usersInfo);
        logger.warn(usersInfo.getUserType());
        if (usersInfo.getUserType() != null && usersInfo.getUserType() == 1) {
            session.setAttribute("logUser", usersInfo);
            return "redirect:/views/index.jsp";
        } else if (usersInfo.getUserType() == null || usersInfo.getUserType() != 1) {
            session.setAttribute("logUser", usersInfo);
            return "redirect:/examManage/examinationPaper";
        }
        return "redirect:/login.jsp";
    }


    @RequestMapping("/list")
    public String select(OltsUsers users, Integer pageNum, ModelMap modelMap){
        Page<OltsUsers> page = null;
        //查询
        if (pageNum == null) {
            pageNum = 1;
        }
        page = (Page<OltsUsers>)userService.selectByPage(users, pageNum, 5);
        modelMap.addAttribute("page", page);
        return "userList";
    }

    @RequestMapping("/logOut")
    public String logOut(HttpSession session){
        session.removeAttribute("logUser");
        return "redirect:/login.jsp";
    }

    @RequestMapping("/toUpdate/{id}")
    public String toUpdate(@PathVariable Integer id, ModelMap modelMap) {
        OltsUsers u = userService.selectById(id);
        modelMap.addAttribute("user", u);
        return "userUpdate";
    }


    @RequestMapping(value="/update", method = RequestMethod.POST)
    public void update(OltsUsers users, RedirectAttributes redirectAttr, HttpSession session, HttpServletResponse response){
        try {
            if (userService.update(users) > 0) {
                response.getWriter().write("{\"actionFlag\": true}");
            } else {
                response.getWriter().write("{\"actionFlag\": false}");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        OltsUsers logUser = (OltsUsers) session.getAttribute("logUser");
        redirectAttr.addAttribute("userid", logUser.getId());
    }
}
