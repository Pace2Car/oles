package com.pace2car.service.impl;

import com.github.pagehelper.PageHelper;
import com.pace2car.commons.ExcelUtil;
import com.pace2car.entity.OltsUsers;
import com.pace2car.mapper.UserMapper;
import com.pace2car.service.IUserService;
import org.apache.http.client.utils.DateUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.util.List;


@Service("userService")
public class UserServiceImpl implements IUserService {

    static Logger logger = Logger.getLogger(UserServiceImpl.class);

    @Resource
    private UserMapper userMapper;

    @Override
    public OltsUsers selectByLogin(OltsUsers user) {
        return this.userMapper.selectByLogin(user);
    }

    @Override
    public List<OltsUsers> selectByPage(OltsUsers users, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);

        return userMapper.selectByPage(users, pageNum, pageSize);
    }

    @Override
    public OltsUsers selectById(Integer id) {
        return userMapper.selectById(id);
    }

    @Override
    public int update(OltsUsers user) {
        return userMapper.update(user);
    }


    public String ajaxUploadExcel(HttpServletRequest request, HttpServletResponse response) {
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;

        MultipartFile file = multipartRequest.getFile("upfile");
        if (file.isEmpty()) {
            try {
                throw new Exception("文件不存在！");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        InputStream in = null;
        try {
            in = file.getInputStream();
        } catch (IOException e) {
            e.printStackTrace();
        }

        List<List<Object>> listob = null;
        try {
            listob = new ExcelUtil().getBankListByExcel(in, file.getOriginalFilename());
        } catch (Exception e) {
            e.printStackTrace();
        }

        //该处可调用service相应方法进行数据保存到数据库中，现只对数据输出
        for (int i = 0; i < listob.size(); i++) {
            List<Object> lo = listob.get(i);
            OltsUsers vo = new OltsUsers();
            System.out.println(String.valueOf(lo.get(1)));
            vo.setUserName(String.valueOf(lo.get(1)));
            vo.setIdCardNo(String.valueOf(lo.get(2)));
            vo.setEduBackground(String.valueOf(lo.get(3)));
            vo.setMarjor(String.valueOf(lo.get(4)));

            vo.setMobile(String.valueOf(lo.get(5)));

            vo.setQq(String.valueOf(lo.get(6)));
            vo.setPassword(String.valueOf(lo.get(7)));
            System.out.println(vo);
            userMapper.insert(vo);

        }
        return "文件导入成功！";
    }

    @Override
    public Integer deleteMany(int[] chk_value) {
            // TODO 自动生成的方法存根
            return userMapper.deleteMany(chk_value);
    }
}



