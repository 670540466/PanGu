package com.mooc.meetingfilm.film.filter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Field;

@Component
public class LogFilter implements Filter {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("------init-----");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        System.out.println("------doFilter-----");
        HttpServletRequest req = (HttpServletRequest)servletRequest;
        HttpServletResponse resp = (HttpServletResponse)servletResponse;

        String ip = req.getRemoteAddr();
        String uri = req.getRequestURI();
        String method = req.getMethod();
        System.out.println("ip:"+ip+"uri:"+uri+"all_info:"+req.toString());
        logger.info("ip:"+ip+"uri:"+uri+"all_info:"+req.toString());
        // 利用反射获取所有属性
        Class<? extends HttpServletRequest> aClass = req.getClass();
        Field[] declaredFields = aClass.getDeclaredFields();
        for (Field declaredField : declaredFields) {
            System.out.println(declaredField.getName()+"::::");
        }
        filterChain.doFilter(servletRequest, servletResponse);
    }

    @Override
    public void destroy() {
        System.out.println("------destroy-----");
    }
}
