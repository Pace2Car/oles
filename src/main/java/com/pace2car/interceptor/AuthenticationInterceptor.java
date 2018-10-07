package com.pace2car.interceptor;

import com.pace2car.entity.OltsUsers;
import org.apache.log4j.Logger;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Pace2Car
 * @date 2018/9/30 10:58
 */
public class AuthenticationInterceptor extends HandlerInterceptorAdapter {

    private static Logger logger = Logger.getLogger(AuthenticationInterceptor.class);

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 获取用户的登录信息
        OltsUsers logUser = (OltsUsers) request.getSession().getAttribute("logUser");
        logger.debug("登录的用户信息: " + logUser);
        // 未登录
//        if (logUser == null) {
//            logger.warn("未授权访问请重新登录！" );
//            response.sendRedirect(request.getContextPath() + "/login_form.jsp");
//            return false;
//        }
        return super.preHandle(request, response, handler);
    }
}
