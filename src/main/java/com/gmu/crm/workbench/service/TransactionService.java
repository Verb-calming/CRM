package com.gmu.crm.workbench.service;

import com.gmu.crm.utils.DateTimeUtil;
import com.gmu.crm.utils.MybatisUtil;
import com.gmu.crm.utils.UUIDUtil;
import com.gmu.crm.vo.Pagination;
import com.gmu.crm.workbench.dao.ContactsDao;
import com.gmu.crm.workbench.dao.CustomerDao;
import com.gmu.crm.workbench.dao.TranDao;
import com.gmu.crm.workbench.dao.TranHistoryDao;
import com.gmu.crm.workbench.domain.Customer;
import com.gmu.crm.workbench.domain.Tran;
import com.gmu.crm.workbench.domain.TranHistory;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TransactionService {
    private static CustomerDao customerDao = MybatisUtil.getSqlSession(true).getMapper(CustomerDao.class);
    private static TranDao tranDao = MybatisUtil.getSqlSession(true).getMapper(TranDao.class);
    private static TranHistoryDao tranHistoryDao = MybatisUtil.getSqlSession(true).getMapper(TranHistoryDao.class);

    public boolean save(Tran t, String customerName) {
        boolean flag = true;

        Customer customer = customerDao.getCustomerByName(customerName);
        if (customer==null){
            customer = new Customer();
            customer.setId(UUIDUtil.getUUID());
            customer.setName(customerName);
            customer.setCreateBy(t.getCreateBy());
            customer.setCreateTime(DateTimeUtil.getSysTime());
            customer.setContactSummary(t.getContactSummary());
            customer.setNextContactTime(t.getNextContactTime());
            customer.setOwner(t.getOwner());
            int count = customerDao.save(customer);
            if (count != 1) {
                flag = false;
            }
        }

        t.setCustomerId(customer.getId());
        int count1 = tranDao.save(t);
        if (count1 != 1) {
            flag = false;
        }

        TranHistory th = new TranHistory();
        th.setTranId(t.getId());
        th.setId(UUIDUtil.getUUID());
        th.setStage(t.getStage());
        th.setMoney(t.getMoney());
        th.setExpectedDate(t.getExpectedDate());
        th.setCreateTime(DateTimeUtil.getSysTime());
        th.setCreateBy(t.getCreateBy());
        int count2 = tranHistoryDao.save(th);
        if(count2!=1){
            flag = false;
        }

        return flag;
    }

    public Pagination<Tran> pageList(Map<String, Object> map) {
        int total = tranDao.getTotalByCondition(map);
        List<Tran> list = tranDao.getTranListByCondition(map);
        Pagination<Tran> pagination = new Pagination<>();
        pagination.setTotal(total);
        pagination.setActivity(list);
        return pagination;
    }

    public Tran getTranById(String id) {
        return tranDao.getTranById(id);
    }

    public List<TranHistory> getTranHistoryListById(String tranId) {
        return tranHistoryDao.getTranHistoryListById(tranId);
    }

    public boolean changeStage(Tran tran) {
        boolean flag = true;
        int count = tranDao.changeStage(tran);
        if (count != 1) {
            flag = false;
        }
        // 交易阶段改变后，生成一条交易历史
        TranHistory th = new TranHistory();
        th.setId(UUIDUtil.getUUID());
        th.setCreateBy(tran.getEditBy());
        th.setCreateTime(tran.getEditTime());
        th.setExpectedDate(tran.getExpectedDate());
        th.setTranId(tran.getId());
        th.setMoney(tran.getMoney());
        th.setStage(tran.getStage());
        int count1 = tranHistoryDao.save(th);
        if (count1 != 1) {
            flag = false;
        }
        return flag;
    }

    public Map<String, Object> getECharts() {
        int total = tranDao.getTotal();
        List<Map<String,Object>> dataList = tranDao.getECharts();
        Map<String,Object> map = new HashMap<>();
        map.put("total",total);
        map.put("dataList",dataList);
        return map;
    }
}
