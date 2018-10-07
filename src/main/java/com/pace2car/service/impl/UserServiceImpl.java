package com.pace2car.service.impl;

import com.github.pagehelper.PageHelper;
import com.pace2car.commons.ExcelUtil;
import com.pace2car.entity.OltsUsers;
import com.pace2car.mapper.UserMapper;
import com.pace2car.service.IUserService;
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
import java.util.ArrayList;
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

    @Override
    public void importExcelInfo(InputStream in, MultipartFile file, String birthday, int adminId) throws Exception{
        List<List<Object>> listob = ExcelUtil.getBankListByExcel(in,file.getOriginalFilename());
        List<OltsUsers> salaryList = new ArrayList<OltsUsers>();
        //遍历listob数据，把数据放到List中
        for (int i = 0; i < listob.size(); i++) {
            List<Object> ob = listob.get(i);
            OltsUsers usersmanage = new OltsUsers();
            //设置编号
//            usersmanage.setSerial(SerialUtil.salarySerial());
            //通过遍历实现把每一列封装成一个model中，再把所有的model用List集合装载
            usersmanage.setId(adminId);
            usersmanage.setStuNo(String.valueOf(ob.get(1)));
            usersmanage.setIdCardNo(String.valueOf(ob.get(2)));
            usersmanage.setUserName(String.valueOf(ob.get(3)));
            usersmanage.setPassword(String.valueOf(ob.get(4)));
            usersmanage.setMobile(String.valueOf(ob.get(5)));
            usersmanage.setHomeTel(String.valueOf(ob.get(6)));
            usersmanage.setHomeAddr(String.valueOf(ob.get(7)));
            usersmanage.setSchAddr(String.valueOf(ob.get(8)));
            usersmanage.setQq(String.valueOf(ob.get(9)));
            usersmanage.setEmail(String.valueOf(ob.get(10)));
            //object类型转Double类型
            usersmanage.setUserType(Short.parseShort(ob.get(11).toString()));
            usersmanage.setGender(String.valueOf(ob.get(12)));
            usersmanage.setBirthday(Date.valueOf(String.valueOf(ob.get(13))));
//            usersmanage.setBirthday(birthday);
            usersmanage.setNationPlace(String.valueOf(ob.get(14)));
            usersmanage.setMarjor(String.valueOf(ob.get(15)));
            usersmanage.setEduBackground(String.valueOf(ob.get(16)));
            usersmanage.setGraduateSchool(String.valueOf(ob.get(17)));
            salaryList.add(usersmanage);
        }
        //批量插入
        userMapper.insertInfoBatch(salaryList);
    }

}

