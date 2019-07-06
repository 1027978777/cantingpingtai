package com.filter;

import com.entity.Business;
import com.entity.Staff;
import com.entity.User;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginFilter implements Filter {

    public void init(FilterConfig filterConfig) throws ServletException {

    }

    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        // TODO Auto-generated method stub
        HttpServletRequest req = (HttpServletRequest)servletRequest;
        HttpServletResponse resp =(HttpServletResponse) servletResponse;
        HttpSession session = req.getSession();
        // 获得用户请求的URI
        String path = req.getRequestURI();
        // 从session取得已经登录验证的凭证 我这里的demo用的是password来作为登录凭证
        Business user = (Business) session.getAttribute("user");
        Staff staff = (Staff) session.getAttribute("staff");
        // login.jsp页面无需过滤(根据自己项目的要求来)
        String[] urls = {"/login","/json",".js",".css",".ico",".jpg",".png","toreg","reg","/admin/login"};
        boolean flag = true;
        for (String str : urls) {
            if (path.indexOf(str) != -1) {
                flag =false;
                break;
            }
        }

        if (flag){
            if(path.indexOf("login") > -1 || path.indexOf("app") > -1 || path.indexOf("web") > -1) {
                filterChain.doFilter(req, resp);
                return;
            } else {//如果不是login.jsp进行过滤
                if (user == null && staff == null ) {
                    // 跳转到登陆页面
                    resp.sendRedirect("/admin/login");
                } else {
                    // 已经登陆,继续此次请求
                    filterChain.doFilter(req, resp);
                }
            }
        }else {
            filterChain.doFilter(req, resp);
        }

        //也可以path.contains("login.jsp")  反正怎么精确怎么来就不多说了

    }


    public void destroy() {

    }
}
