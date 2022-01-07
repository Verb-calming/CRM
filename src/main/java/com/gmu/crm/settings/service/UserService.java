package com.gmu.crm.settings.service;

import com.gmu.crm.exception.LoginException;
import com.gmu.crm.settings.dao.UserDao;
import com.gmu.crm.settings.domain.User;
import com.gmu.crm.utils.DateTimeUtil;
import com.gmu.crm.utils.MybatisUtil;


public class UserService {
    private static UserDao dao = MybatisUtil.getSqlSession().getMapper(UserDao.class);

    public static User login(String loginAct, String loginPwd,String ip) throws LoginException {
        User user = dao.login(loginAct,loginPwd);
        if (user == null) {
            throw new LoginException("账号密码错误");
        } else {
            String dateStr = DateTimeUtil.getSysTime();
            if (dateStr.compareTo(user.getExpireTime()) < 0) {
                throw new LoginException("账号已失效");
            }
            if ("0".equals(user.getLockState())) {
                throw new LoginException("账号已经锁定");
            }
            if (!user.getAllowIps().contains(ip)) {
                throw new LoginException("禁止访问ip");
            }
        }
        return user;
    }
}
