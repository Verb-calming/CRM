package com.gmu.crm.workbench.service;

import com.gmu.crm.utils.MybatisUtil;
import com.gmu.crm.workbench.dao.CustomerDao;

import java.util.List;

public class CustomerService {
    private static CustomerDao customerDao = MybatisUtil.getSqlSession().getMapper(CustomerDao.class);

    public List<String> getCustomerName(String name) {
        return customerDao.getCustomerName(name);
    }
}
