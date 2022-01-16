package com.gmu.crm.workbench.service;

import com.gmu.crm.settings.dao.UserDao;
import com.gmu.crm.settings.domain.User;
import com.gmu.crm.utils.MybatisUtil;
import com.gmu.crm.vo.Pagination;
import com.gmu.crm.workbench.dao.ActiveDao;
import com.gmu.crm.workbench.dao.ActiveRemarkDao;
import com.gmu.crm.workbench.domain.Activity;
import com.gmu.crm.workbench.domain.ActivityRemark;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ActiveService {
    private static ActiveDao activeDao = MybatisUtil.getSqlSession().getMapper(ActiveDao.class);
    private static ActiveRemarkDao activeRemarkDao = MybatisUtil.getSqlSession().getMapper(ActiveRemarkDao.class);
    private static UserDao userDao = MybatisUtil.getSqlSession().getMapper(UserDao.class);
    private static SqlSession sqlSession = MybatisUtil.getSqlSession();

    public boolean addActive(Activity activity) {
        boolean flag = false;
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        ActiveDao dao = sqlSession.getMapper(ActiveDao.class);
        int result = dao.addActive(activity);
        if (result == 1) {
            flag = true;
            sqlSession.commit();
        }
        return flag;
    }
    public Pagination<Activity> pageList(Map<String,Object> map) {
        int total = activeDao.getTotalByCondition(map);
        List<Activity> list = activeDao.getActivityListByCondition(map);
        Pagination<Activity> pagination = new Pagination<>();
        pagination.setTotal(total);
        pagination.setActivity(list);
        return pagination;
    }
    public boolean deleteActive(String[] ids) {
        boolean flag = true;
        SqlSession sqlSession1 = MybatisUtil.getSqlSession();
        SqlSession sqlSession2 = MybatisUtil.getSqlSession();
        ActiveDao dao1 = sqlSession1.getMapper(ActiveDao.class);
        ActiveRemarkDao dao2 = sqlSession2.getMapper(ActiveRemarkDao.class);
        int count1 = dao2.getCountByAid(ids);
        int count2 = dao2.delete(ids);
        if (count1 != count2) flag = false;
        int count3 = dao1.delete(ids);
        if (count3 != ids.length) flag = false;
        if (flag) {
            sqlSession1.commit();
            sqlSession2.commit();
        }
        return flag;
    }

    public Map<String, Object> selectInfo(String id) {
        List<User> userList = userDao.selectAllUsers();
        Activity activity = activeDao.getActivityById(id);
        Map<String,Object> map = new HashMap<>();
        map.put("userList",userList);
        map.put("activity",activity);
        return map;
    }

    public boolean updateActive(Activity activity) {
        boolean flag = false;
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        ActiveDao dao = sqlSession.getMapper(ActiveDao.class);
        int result = dao.updateActive(activity);
        if (result == 1) {
            flag = true;
            sqlSession.commit();
        }
        return flag;
    }

    public boolean deleteRemark(String id) {
        boolean flag = false;
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        ActiveRemarkDao dao = sqlSession.getMapper(ActiveRemarkDao.class);
        int result = dao.deleteRemark(id);
        if (result == 1) {
            flag = true;
            sqlSession.commit();
        }
        return flag;
    }

    public boolean saveRemark(ActivityRemark ar) {
        boolean flag = false;
        ActiveRemarkDao dao = sqlSession.getMapper(ActiveRemarkDao.class);
        int result = dao.saveRemark(ar);
        if (result == 1){
            flag = true;
            sqlSession.commit();
        }
        return flag;
    }

    public boolean updateRemark(ActivityRemark ar) {
        boolean flag = false;
        ActiveRemarkDao dao = sqlSession.getMapper(ActiveRemarkDao.class);
        int result = dao.updateRemark(ar);
        if (result == 1) {
            flag = true;
            sqlSession.commit();
        }
        return flag;
    }
}