package com.gmu.crm.settings.service;

import com.gmu.crm.exception.LoginException;
import com.gmu.crm.settings.dao.UserDao;
import com.gmu.crm.settings.domain.User;
import com.gmu.crm.utils.MybatisUtil;



public class UserService {
    private static UserDao dao = MybatisUtil.getSqlSession().getMapper(UserDao.class);

    public User login(String loginAct, String loginPwd,String id) throws LoginException {
        User user = dao.login(loginAct,loginPwd);
        if (user == null) {
            throw new LoginException("账号密码错误");
        }
        return user;
    }
}
