package com.gmu.crm.workbench.dao;

import com.gmu.crm.workbench.domain.TranHistory;

import java.util.List;

public interface TranHistoryDao {
    int save(TranHistory th);

    List<TranHistory> getTranHistoryListById(String tranId);
}
