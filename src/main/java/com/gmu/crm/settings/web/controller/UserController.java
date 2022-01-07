package com.gmu.crm.settings.web.controller;

import com.gmu.crm.exception.LoginException;
import com.gmu.crm.settings.dao.UserDao;
import com.gmu.crm.settings.domain.User;
import com.gmu.crm.settings.service.UserService;
import com.gmu.crm.utils.MD5Util;
import com.gmu.crm.utils.MybatisUtil;
import com.mysql.cj.Session;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UserController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();
        if ("/setting/user/login.do".equals(path)) {
            login(request,response);
        }
    }

    private void login(HttpServletRequest request, HttpServletResponse response) {
        String loginAct = request.getParameter("loginAct");
        String loginPwd = request.getParameter("loginPwd");
        String id = "";
        loginPwd = MD5Util.getMD5(loginPwd);
        UserService userService = new UserService();
        User user = null;
        try {
            user = userService.login(loginAct,loginPwd,id);
        } catch (LoginException e) {
            e.printStackTrace();
        }
        request.getSession().setAttribute("user",user);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
