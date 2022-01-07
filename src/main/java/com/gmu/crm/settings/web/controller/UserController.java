package com.gmu.crm.settings.web.controller;

import com.gmu.crm.exception.LoginException;
import com.gmu.crm.settings.domain.User;
import com.gmu.crm.settings.service.UserService;
import com.gmu.crm.utils.MD5Util;
import com.gmu.crm.utils.PrintJson;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

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
        loginPwd = MD5Util.getMD5(loginPwd);
        // 接收浏览器的ip地址
        String ip = request.getRemoteAddr();
        try {
            User user = UserService.login(loginAct,loginPwd,ip);
            request.getSession().setAttribute("user",user);
            PrintJson.PrintJsonFlag(response,true);
        } catch (LoginException e) {
            e.printStackTrace();
            String msg = e.getMessage();
            Map<String,Object> map = new HashMap<>();
            map.put("success",false);
            map.put("msg",msg);
            PrintJson.PrintJsonObj(response,map);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
