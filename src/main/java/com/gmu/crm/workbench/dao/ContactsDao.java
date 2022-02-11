package com.gmu.crm.workbench.dao;

import com.gmu.crm.workbench.domain.Contacts;

import java.util.List;

public interface ContactsDao {
    int save(Contacts con);

    List<Contacts> selectContacts();

    List<Contacts> selectContactsByName(String fullname);
}
