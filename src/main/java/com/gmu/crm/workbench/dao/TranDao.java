package com.gmu.crm.workbench.dao;

import com.gmu.crm.vo.Pagination;
import com.gmu.crm.workbench.domain.Tran;

import java.util.List;
import java.util.Map;

public interface TranDao {
    int save(Tran t);

    Pagination<Tran> select(Map<String, Object> map);

    int getTotalByCondition(Map<String, Object> map);

    List<Tran> getTranListByCondition(Map<String, Object> map);

    Tran getTranById(String id);

    int changeStage(Tran tran);

    int getTotal();

    List<Map<String, Object>> getECharts();
}
