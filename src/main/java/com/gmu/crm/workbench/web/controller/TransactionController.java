package com.gmu.crm.workbench.web.controller;

import com.gmu.crm.settings.dao.UserDao;
import com.gmu.crm.settings.domain.User;
import com.gmu.crm.utils.DateTimeUtil;
import com.gmu.crm.utils.MybatisUtil;
import com.gmu.crm.utils.PrintJson;
import com.gmu.crm.utils.UUIDUtil;
import com.gmu.crm.vo.Pagination;
import com.gmu.crm.workbench.domain.Activity;
import com.gmu.crm.workbench.domain.Contacts;
import com.gmu.crm.workbench.domain.Tran;
import com.gmu.crm.workbench.domain.TranHistory;
import com.gmu.crm.workbench.service.ActiveService;
import com.gmu.crm.workbench.service.ContactsService;
import com.gmu.crm.workbench.service.CustomerService;
import com.gmu.crm.workbench.service.TransactionService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TransactionController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();
        if ("/workbench/transaction/save.do".equals(path)) {
            save(request,response);
        } else if ("/workbench/transaction/changeStage.do".equals(path)) {
            changeStage(request,response);
        }
    }

    private void changeStage(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        String stage = request.getParameter("stage");
        String money = request.getParameter("money");
        String expectedDate = request.getParameter("expectedDate");
        String editBy = ((User)request.getSession().getAttribute("user")).getName();
        String editTime = DateTimeUtil.getSysTime();
        Tran tran = new Tran();
        tran.setId(id);
        tran.setStage(stage);
        tran.setMoney(money);
        tran.setExpectedDate(expectedDate);
        tran.setEditBy(editBy);
        tran.setEditTime(editTime);
        TransactionService ts = new TransactionService();
        boolean flag = ts.changeStage(tran);
        Map<String,String> pMap = (Map<String, String>) this.getServletContext().getAttribute("pMap");
        tran.setPossibility(pMap.get(stage));
        Map<String,Object> map = new HashMap<>();
        map.put("succeed",flag);
        map.put("tran",tran);
        PrintJson.PrintJsonObj(response,map);
    }

    private void save(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = UUIDUtil.getUUID();
        String owner = request.getParameter("owner");
        String money = request.getParameter("money");
        String name = request.getParameter("name");
        String expectedDate = request.getParameter("expectedDate");
        String customerName = request.getParameter("customerName");
        String stage = request.getParameter("stage");
        String type = request.getParameter("type");
        String source = request.getParameter("source");
        String activityId = request.getParameter("activityId");
        String contactsId = request.getParameter("contactsId");
        String createBy = ((User)request.getSession().getAttribute("user")).getName();
        String createTime = DateTimeUtil.getSysTime();
        String description = request.getParameter("description");
        String contactSummary = request.getParameter("contactSummary");
        String nextContactTime = request.getParameter("nextContactTime");
        Tran t = new Tran();
        t.setId(id);
        t.setOwner(owner);
        t.setMoney(money);
        t.setName(name);
        t.setExpectedDate(expectedDate);
        t.setStage(stage);
        t.setType(type);
        t.setSource(source);
        t.setActivityId(activityId);
        t.setContactsId(contactsId);
        t.setCreateBy(createBy);
        t.setCreateTime(createTime);
        t.setDescription(description);
        t.setContactSummary(contactSummary);
        t.setNextContactTime(nextContactTime);
        TransactionService ts = new TransactionService();
        boolean flag = ts.save(t,customerName);
        if (flag) {
            response.sendRedirect(request.getContextPath()+"/workbench/transaction/index.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();
        if ("/workbench/transaction/create.do".equals(path)) {
            create(request,response);
        } else if ("/workbench/transaction/getCustomerName.do".equals(path)) {
            getCustomerName(request,response);
        } else if ("/workbench/transaction/selectActivity.do".equals(path)) {
            selectActivity(request,response);
        } else if ("/workbench/transaction/selectActivityByName.do".equals(path)) {
            selectActivityByName(request,response);
        } else if ("/workbench/transaction/selectContacts.do".equals(path)) {
            selectContacts(request,response);
        } else if ("/workbench/transaction/selectContactsByName.do".equals(path)) {
            selectContactsByName(request,response);
        } else if ("/workbench/transaction/select.do".equals(path)) {
            pageList(request,response);
        } else if ("/workbench/transaction/detail.do".equals(path)) {
            detail(request,response);
        } else if ("/workbench/transaction/getTranHistoryList.do".equals(path)) {
            getTranHistoryList(request,response);
        } else if ("/workbench/transaction/getECharts.do".equals(path)) {
            getECharts(request,response);
        }
    }

    private void getECharts(HttpServletRequest request, HttpServletResponse response) {
        TransactionService ts = new TransactionService();
        Map<String,Object> map = ts.getECharts();
        PrintJson.PrintJsonObj(response,map);
    }

    private void getTranHistoryList(HttpServletRequest request, HttpServletResponse response) {
        String tranId = request.getParameter("tranId");
        TransactionService ts = new TransactionService();
        List<TranHistory> list = ts.getTranHistoryListById(tranId);
        Map<String,String> pMap = (Map<String, String>) this.getServletContext().getAttribute("pMap");
        for (TranHistory th:list) {
            String stage = th.getStage();
            String possibility = pMap.get(stage);
            th.setPossibility(possibility);
        }
        PrintJson.PrintJsonObj(response,list);
    }

    private void detail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        TransactionService ts = new TransactionService();
        Tran tran = ts.getTranById(id);
        Map<String,String> pMap = (Map<String, String>) this.getServletContext().getAttribute("pMap");
        String possibility = pMap.get(tran.getStage());
        tran.setPossibility(possibility);
        request.setAttribute("tran",tran);
        request.getRequestDispatcher("/workbench/transaction/detail.jsp").forward(request,response);
    }

    private void pageList(HttpServletRequest request, HttpServletResponse response) {
        String owner = request.getParameter("owner");
        String name = request.getParameter("name");
        String customerName = request.getParameter("customerName");
        String stage = request.getParameter("stage");
        String type = request.getParameter("type");
        String source = request.getParameter("source");
        String contactsName = request.getParameter("contactsName");
        Integer pageNo = Integer.valueOf(request.getParameter("pageNo"));
        Integer pageSize = Integer.valueOf(request.getParameter("pageSize"));
        int skipCount = (pageNo-1)*pageSize;
        Map<String,Object> map = new HashMap<>();
        map.put("owner",owner);
        map.put("name",name);
        map.put("customerName",customerName);
        map.put("stage",stage);
        map.put("type",type);
        map.put("source",source);
        map.put("contactsName",contactsName);
        map.put("pageSize",pageSize);
        map.put("skipCount",skipCount);
        TransactionService ts = new TransactionService();
        Pagination<Tran> pagination = ts.pageList(map);
        PrintJson.PrintJsonObj(response,pagination);
    }

    private void selectContactsByName(HttpServletRequest request, HttpServletResponse response) {
        String fullname = request.getParameter("fullname");
        ContactsService cs = new ContactsService();
        List<Contacts> contacts = cs.selectContactsByName(fullname);
        PrintJson.PrintJsonObj(response,contacts);
    }

    private void selectContacts(HttpServletRequest request, HttpServletResponse response) {
        ContactsService cs = new ContactsService();
        List<Contacts> contacts = cs.selectContacts();
        PrintJson.PrintJsonObj(response,contacts);
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

    private void getCustomerName(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        CustomerService cs = new CustomerService();
        List<String> sList = cs.getCustomerName(name);
        PrintJson.PrintJsonObj(response, sList);
    }

    private void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDao dao = MybatisUtil.getSqlSession().getMapper(UserDao.class);
        List<User> users = dao.selectAllUsers();
        request.setAttribute("users",users);
        request.getRequestDispatcher("/workbench/transaction/save.jsp").forward(request,response);
    }
}
