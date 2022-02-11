package com.gmu.crm.workbench.service;

import com.gmu.crm.utils.MybatisUtil;
import com.gmu.crm.workbench.dao.ContactsDao;
import com.gmu.crm.workbench.domain.Contacts;

import java.util.List;

public class ContactsService {
    private static ContactsDao contactsDao = MybatisUtil.getSqlSession().getMapper(ContactsDao.class);

    public List<Contacts> selectContacts() {
        return contactsDao.selectContacts();
    }

    public List<Contacts> selectContactsByName(String fullname) {
        return contactsDao.selectContactsByName(fullname);
    }
}
