package com.pace2car.service;

import com.pace2car.entity.OltsUsers;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.util.List;

public interface IUserService {

    public OltsUsers selectByLogin(OltsUsers user);

    List<OltsUsers> selectByPage(OltsUsers users, int pageNum, int pageSize);

    OltsUsers selectById(Integer id);

    int update(OltsUsers user);

    String ajaxUploadExcel(HttpServletRequest request,HttpServletResponse response);

    Integer deleteMany(int[] chk_value);

}



