package com.gmu.crm.workbench.dao;

import com.gmu.crm.workbench.domain.ClueRemark;

import java.util.List;

public interface ClueRemarkDao {
    List<ClueRemark> getListByClueId(String clueId);

    int delete(ClueRemark clueRemark);
}
