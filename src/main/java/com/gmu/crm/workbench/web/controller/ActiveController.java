package com.gmu.crm.workbench.web.controller;

import com.gmu.crm.settings.dao.UserDao;
import com.gmu.crm.settings.domain.User;
import com.gmu.crm.utils.DateTimeUtil;
import com.gmu.crm.utils.MybatisUtil;
import com.gmu.crm.utils.PrintJson;
import com.gmu.crm.utils.UUIDUtil;
import com.gmu.crm.vo.Pagination;
import com.gmu.crm.workbench.dao.ActiveDao;
import com.gmu.crm.workbench.dao.ActiveRemarkDao;
import com.gmu.crm.workbench.domain.Activity;
import com.gmu.crm.workbench.domain.ActivityRemark;
import com.gmu.crm.workbench.service.ActiveService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ActiveController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();
        if ("/workbench/active/create.do".equals(path)) {
            createActive(request,response);
        }else if ("/workbench/active/select.do".equals(path)) {
            pageList(request,response);
        }else if ("/workbench/active/selectInfo.do".equals(path)) {
            selectInfo(request,response);
        }else if ("/workbench/active/detail.do".equals(path)) {
            detail(request,response);
        }else if ("/workbench/active/getRemarkInfo.do".equals(path)) {
            getRemarkInfo(request,response);
        }
    }

    private void getRemarkInfo(HttpServletRequest request, HttpServletResponse response) {
        String activityId = request.getParameter("activityId");
        ActiveRemarkDao dao = MybatisUtil.getSqlSession().getMapper(ActiveRemarkDao.class);
        List<ActivityRemark> actRemark = dao.getRemarkInfo(activityId);
        PrintJson.PrintJsonObj(response,actRemark);
    }

    private void detail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        ActiveDao dao = MybatisUtil.getSqlSession().getMapper(ActiveDao.class);
        Activity activity = dao.getActivityDetailById(id);
        request.setAttribute("activity",activity);
        request.getRequestDispatcher("/workbench/activity/detail.jsp").forward(request,response);
    }

    private void selectInfo(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        ActiveService as = new ActiveService();
        Map<String,Object> map = as.selectInfo(id);
        PrintJson.PrintJsonObj(response,map);
    }

    private void pageList(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String owner = request.getParameter("owner");
        String startDate = request.getParameter("startDate");
        String endDate  = request.getParameter("endDate");
        int pageNo = Integer.valueOf(request.getParameter("pageNo"));
        int pageSize = Integer.valueOf(request.getParameter("pageSize"));
        int skipCount = (pageNo-1)*pageSize;
        Map<String,Object> map = new HashMap<>();
        ActiveService as = new ActiveService();
        map.put("name",name);
        map.put("owner",owner);
        map.put("startDate",startDate);
        map.put("endDate",endDate);
        map.put("pageSize",pageSize);
        map.put("skipCount",skipCount);
        Pagination<Activity> pagination = as.pageList(map);
        PrintJson.PrintJsonObj(response,pagination);
    }

    private void createActive(HttpServletRequest request, HttpServletResponse response) {
        UserDao dao = MybatisUtil.getSqlSession().getMapper(UserDao.class);
        List<User> users = dao.selectAllUsers();
        PrintJson.PrintJsonObj(response,users);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();
        if ("/workbench/active/save.do".equals(path)) {
            saveActive(request,response);
        } else if ("/workbench/active/delete.do".equals(path)) {
            deleteActive(request,response);
        } else if ("/workbench/active/update.do".equals(path)) {
            update(request,response);
        } else if ("/workbench/active/deleteRemark.do".equals(path)) {
            deleteRemark(request,response);
        } else if ("/workbench/active/saveRemark.do".equals(path)) {
            saveRemark(request,response);
        } else if ("/workbench/active/updateRemark.do".equals(path)) {
            updateRemark(request,response);
        }
    }

    private void updateRemark(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        String noteContent = request.getParameter("noteContent");
        String editTime = DateTimeUtil.getSysTime();
        String editBy = ((User)request.getSession().getAttribute("user")).getName();
        String editFlag = "1";
        ActivityRemark ar = new ActivityRemark();
        ar.setId(id);
        ar.setNoteContent(noteContent);
        ar.setEditTime(editTime);
        ar.setEditBy(editBy);
        ar.setEditFlag(editFlag);
        ActiveService as = new ActiveService();
        boolean flag = as.updateRemark(ar);
        Map<String,Object> map = new HashMap<>();
        map.put("succeed",flag);
        map.put("ar",ar);
        PrintJson.PrintJsonObj(response,map);
    }

    private void saveRemark(HttpServletRequest request, HttpServletResponse response) {
        String noteContent = request.getParameter("noteContent");
        String activityId = request.getParameter("activityId");
        String id = UUIDUtil.getUUID();
        String createTime = DateTimeUtil.getSysTime();
        String createBy = ((User)request.getSession().getAttribute("user")).getName();
        String editFlag = "0";
        ActivityRemark ar = new ActivityRemark();
        ar.setActivityId(activityId);
        ar.setCreateBy(createBy);
        ar.setCreateTime(createTime);
        ar.setEditFlag(editFlag);
        ar.setId(id);
        ar.setNoteContent(noteContent);
        ActiveService as = new ActiveService();
        boolean flag = as.saveRemark(ar);
        Map<String,Object> map = new HashMap<>();
        map.put("succeed",flag);
        map.put("ar",ar);
        PrintJson.PrintJsonObj(response,map);
    }

    private void deleteRemark(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        ActiveService as = new ActiveService();
        boolean flag = as.deleteRemark(id);
        PrintJson.PrintJsonFlag(response,flag);
    }

    private void update(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        String owner = request.getParameter("owner");
        String name = request.getParameter("name");
        String startDate = request.getParameter("startDate");
        String endDate  = request.getParameter("endDate");
        String cost = request.getParameter("cost");
        String description = request.getParameter("description");
        String editTime = DateTimeUtil.getSysTime();
        String editBy = ((User)request.getSession().getAttribute("user")).getName();
        Activity activity = new Activity();
        activity.setId(id);
        activity.setOwner(owner);
        activity.setName(name);
        activity.setStartDate(startDate);
        activity.setEndDate(endDate);
        activity.setCost(cost);
        activity.setDescription(description);
        activity.setEditTime(editTime);
        activity.setEditBy(editBy);
        ActiveService as = new ActiveService();
        boolean flag = as.updateActive(activity);
        PrintJson.PrintJsonFlag(response,flag);
    }

    private void deleteActive(HttpServletRequest request, HttpServletResponse response) {
        String[] ids = request.getParameterValues("id");
        ActiveService as = new ActiveService();
        boolean flag = as.deleteActive(ids);
        PrintJson.PrintJsonFlag(response,flag);
    }

    private void saveActive(HttpServletRequest request, HttpServletResponse response) {
        String id = UUIDUtil.getUUID();
        String owner = request.getParameter("owner");
        String name = request.getParameter("name");
        String startDate = request.getParameter("startDate");
        String endDate  = request.getParameter("endDate");
        String cost = request.getParameter("cost");
        String description = request.getParameter("description");
        String createTime = DateTimeUtil.getSysTime();
        String createBy = ((User)request.getSession().getAttribute("user")).getName();
        Activity activity = new Activity();
        activity.setId(id);
        activity.setOwner(owner);
        activity.setName(name);
        activity.setStartDate(startDate);
        activity.setEndDate(endDate);
        activity.setCost(cost);
        activity.setDescription(description);
        activity.setCreateTime(createTime);
        activity.setCreateBy(createBy);
        ActiveService as = new ActiveService();
        boolean flag = as.addActive(activity);
        PrintJson.PrintJsonFlag(response,flag);
    }
}
