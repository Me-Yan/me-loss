package com.me.outer.interceptor;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 用户登录拦截器
 */
public class UserInterceptor extends HandlerInterceptorAdapter {

    private static Logger logger = LoggerFactory.getLogger(UserInterceptor.class);

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {

        Object object = request.getSession().getAttribute("user");

        if (object==null) {
            response.sendRedirect(request.getContextPath() + "/front/application/listAllClaim");
            return false;
        }

        return true;
    }

}
