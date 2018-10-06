package com.pace2car.controller;


import com.github.pagehelper.Page;
import com.pace2car.entity.OltsUsers;
import com.pace2car.service.IUserService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.InputStream;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    static Logger logger = Logger.getLogger(UserController.class);

    @Resource
    IUserService userService;

    @RequestMapping("/login")
    public String login(OltsUsers user, HttpSession session) {
        System.out.println(user);
        OltsUsers usersInfo = userService.selectByLogin(user);
        if (usersInfo != null) {
            session.setAttribute("logUser", usersInfo);
        } else {
            return "redirect:/login.jsp";
        }

        return "redirect:/views/index.jsp";
    }


    @RequestMapping("/list")
    public String select(OltsUsers users, Integer pageNum, ModelMap modelMap, HttpSession session) {
        Page<OltsUsers> page = null;
        //查询
        if (pageNum == null) {
            pageNum = 1;
        }

        page = (Page<OltsUsers>) userService.selectByPage(users, pageNum, 5);

        modelMap.addAttribute("page", page);

        return "userList";
    }

    @RequestMapping("/toUpdate/{id}")
    public String toUpdate(@PathVariable Integer id, ModelMap modelMap) {
        OltsUsers user = userService.selectById(id);
        modelMap.addAttribute("user", user);
        return "userUpdate";
    }

    @RequestMapping("/update")
    public String update(OltsUsers user, RedirectAttributes redirectAttr, HttpSession session) {
        int i = this.userService.update(user);

//        OltsUsers logUser = (OltsUsers) session.getAttribute("logUser");
//        redirectAttr.addAttribute("userid", logUser.getUserId());

        return (i == 1 ? "redirect:/views/userList.jsp" : "redirect:/views/userUpdate.jsp");
    }


    @RequestMapping("/import")
    public String impotr(HttpServletRequest request, Model model) throws Exception {
        int adminId = 1;
        //获取上传的文件
        MultipartHttpServletRequest multipart = (MultipartHttpServletRequest) request;
        MultipartFile file = multipart.getFile("upfile");
        String birthday = request.getParameter("birthday");
        InputStream in = file.getInputStream();
        //数据导入
        userService.importExcelInfo(in,file,birthday,adminId);
        in.close();
        return "redirect:/salary/index.html";
    }


}

