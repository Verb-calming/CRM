package com.gmu.crm.settings.dao;

import com.gmu.crm.settings.domain.User;
import org.apache.ibatis.annotations.Param;

public interface UserDao {
    User login(@Param("loginAct") String loginAct,@Param("loginPwd") String loginPwd);
}
