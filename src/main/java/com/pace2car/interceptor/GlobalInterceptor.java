package com.pace2car.interceptor;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @auther Pace2Car
 * @date 2018/9/30 10:58
 */
public class GlobalInterceptor implements HandlerInterceptor {

    static Logger logger = Logger.getLogger(GlobalInterceptor.class);

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        logger.debug("preHandle(): 该方法在行为（控制器的处理方法）执行前执行，可以实现对数据的预处理，比如：编码、安全控制等。");
        logger.debug("preHandle(request, response, handler): " + handler.getClass().getName());
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        logger.debug("postHandle(request, response, handler, modelAndView): " +
                "该方法在行为（业务控制器的处理方法）执行后，生成视图前执行。所以在这里，我们可以（可选操作）有机会修改视图层数据。");
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        logger.debug("afterCompletion(request, response, handler, ex): 最后执行，通常用于资源释放，处理异常。" +
                "我们可以根据ex是否为空，来进行相关的异常处理。因为我们在平时处理异常时，" +
                "都是从底层向上抛出异常，最后到了spring框架从而到了这个方法中。");
    }
}
