package com.gmu.crm.workbench.web.controller;

import com.gmu.crm.settings.domain.User;
import com.gmu.crm.utils.DateTimeUtil;
import com.gmu.crm.utils.PrintJson;
import com.gmu.crm.utils.UUIDUtil;
import com.gmu.crm.vo.Pagination;
import com.gmu.crm.workbench.domain.Activity;
import com.gmu.crm.workbench.domain.Clue;
import com.gmu.crm.workbench.domain.Tran;
import com.gmu.crm.workbench.service.ActiveService;
import com.gmu.crm.workbench.service.ClueService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ClueController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();
        if ("/workbench/clue/save.do".equals(path)) {
            save(request,response);
        } else if ("/workbench/clue/unbund.do".equals(path)) {
            unbund(request,response);
        } else if ("/workbench/clue/saveLinkedActivity.do".equals(path)) {
            saveLinkedActivity(request,response);
        } else if ("/workbench/clue/convert.do".equals(path)) {
            convertPost(request,response);
        }
    }

    private void convertPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String clueId = request.getParameter("clueId");
        String money = request.getParameter("money");
        String name = request.getParameter("name");
        String expectedDate = request.getParameter("expectedDate");
        String stage = request.getParameter("stage");
        String activityId = request.getParameter("activityId");
        String createBy = ((User)request.getSession().getAttribute("user")).getName();
        String id = UUIDUtil.getUUID();
        String createTime = DateTimeUtil.getSysTime();
        Tran t = new Tran();
        t.setActivityId(activityId);
        t.setCreateBy(createBy);
        t.setCreateTime(createTime);
        t.setExpectedDate(expectedDate);
        t.setId(id);
        t.setMoney(money);
        t.setName(name);
        t.setStage(stage);
        ClueService cs = new ClueService();
        boolean flag = cs.convert(clueId,t,createBy);
        if (flag) response.sendRedirect(request.getContextPath()+"/workbench/clue/index.jsp");
    }

    private void saveLinkedActivity(HttpServletRequest request, HttpServletResponse response) {
        String clueId = request.getParameter("clueId");
        String[] activityIds = request.getParameterValues("activityId");
        ClueService cs = new ClueService();
        boolean flag = cs.saveLinkedActivity(clueId,activityIds);
        PrintJson.PrintJsonFlag(response,flag);
    }

    private void unbund(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        ClueService cs = new ClueService();
        boolean flag = cs.unbund(id);
        PrintJson.PrintJsonFlag(response,flag);
    }

    private void save(HttpServletRequest request, HttpServletResponse response) {
        String id = UUIDUtil.getUUID();
        String fullname = request.getParameter("fullname");
        String appellation = request.getParameter("appellation");
        String owner = request.getParameter("owner");
        String company = request.getParameter("company");
        String job = request.getParameter("job");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String website = request.getParameter("website");
        String mphone = request.getParameter("mphone");
        String state = request.getParameter("state");
        String source = request.getParameter("source");
        String createBy = request.getParameter("createBy");
        String createTime = DateTimeUtil.getSysTime();
        String description = request.getParameter("description");
        String contactSummary = request.getParameter("contactSummary");
        String nextContactTime = request.getParameter("nextContactTime");
        String address = request.getParameter("address");
        Clue clue = new Clue();
        clue.setId(id);
        clue.setFullname(fullname);
        clue.setAppellation(appellation);
        clue.setOwner(owner);
        clue.setCompany(company);
        clue.setJob(job);
        clue.setEmail(email);
        clue.setPhone(phone);
        clue.setWebsite(website);
        clue.setMphone(mphone);
        clue.setState(state);
        clue.setSource(source);
        clue.setCreateBy(createBy);
        clue.setCreateTime(createTime);
        clue.setDescription(description);
        clue.setContactSummary(contactSummary);
        clue.setNextContactTime(nextContactTime);
        clue.setAddress(address);
        ClueService cs = new ClueService();
        boolean flag = cs.save(clue);
        PrintJson.PrintJsonFlag(response,flag);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();
        if ("/workbench/clue/getUserList.do".equals(path)) {
            getUserList(request,response);
        } else if ("/workbench/clue/select.do".equals(path)) {
            pageList(request,response);
        } else if ("/workbench/clue/detail.do".equals(path)) {
            detail(request,response);
        } else if ("/workbench/clue/showActivityList.do".equals(path)) {
            showActivityList(request,response);
        } else if ("/workbench/clue/selectAllUnLinkedActivity.do".equals(path)) {
            selectAllUnLinkedActivity(request,response);
        } else if ("/workbench/clue/searchName.do".equals(path)) {
            searchName(request,response);
        } else if ("/workbench/clue/selectActivity.do".equals(path)) {
            selectActivity(request,response);
        } else if ("/workbench/clue/selectActivityByName.do".equals(path)) {
            selectActivityByName(request,response);
        } else if ("/workbench/clue/convert.do".equals(path)) {
            convertGet(request,response);
        }
    }

    private void convertGet(HttpServletRequest request, HttpServletResponse response) {
    }

    private void selectActivityByName(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        ActiveService ac = new ActiveService();
        List<Activity> activities = ac.selectActivityByName(name);
        PrintJson.PrintJsonObj(response,activities);
    }

    private void selectActivity(HttpServletRequest request, HttpServletResponse response) {
        ActiveService ac = new ActiveService();
        List<Activity> activities = ac.selectActivity();
        PrintJson.PrintJsonObj(response,activities);
    }

    private void searchName(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String clueId = request.getParameter("clueId");
        ActiveService as = new ActiveService();
        Map<String,String> map = new HashMap<>();
        map.put("name",name);
        map.put("clueId",clueId);
        List<Activity> activities = as.searchName(map);
        PrintJson.PrintJsonObj(response,activities);
    }

    private void selectAllUnLinkedActivity(HttpServletRequest request, HttpServletResponse response) {
        String clueId = request.getParameter("clueId");
        ActiveService as = new ActiveService();
        List<Activity> activities = as.selectAllUnLinkedActivity(clueId);
        PrintJson.PrintJsonObj(response,activities);
    }

    private void showActivityList(HttpServletRequest request, HttpServletResponse response) {
        String clueId = request.getParameter("clueId");
        ClueService cs = new ClueService();
        List<Activity> activities = cs.showActivityList(clueId);
        PrintJson.PrintJsonObj(response,activities);
    }

    private void detail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        ClueService cs = new ClueService();
        Clue clue = cs.getClueById(id);
        request.setAttribute("clue",clue);
        request.getRequestDispatcher("/workbench/clue/detail.jsp").forward(request,response);
    }

    private void pageList(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String company = request.getParameter("company");
        String phone = request.getParameter("phone");
        String source = request.getParameter("source");
        String owner = request.getParameter("owner");
        String mphone = request.getParameter("mphone");
        String state = request.getParameter("state");
        Integer pageNo = Integer.valueOf(request.getParameter("pageNo"));
        Integer pageSize = Integer.valueOf(request.getParameter("pageSize"));
        int skipCount = (pageNo - 1)*pageSize;
        Map<String,Object> map = new HashMap<>();
        map.put("name",name);
        map.put("company",company);
        map.put("phone",phone);
        map.put("source",source);
        map.put("owner",owner);
        map.put("mphone",mphone);
        map.put("state",state);
        map.put("skipCount",skipCount);
        map.put("pageSize",pageSize);
        ClueService cs = new ClueService();
        Pagination<Clue> pagination = cs.pageList(map);
        PrintJson.PrintJsonObj(response,pagination);
    }

    private void getUserList(HttpServletRequest request, HttpServletResponse response) {
        ClueService cs = new ClueService();
        List<User> users = cs.getUserList();
        PrintJson.PrintJsonObj(response,users);
    }
}
