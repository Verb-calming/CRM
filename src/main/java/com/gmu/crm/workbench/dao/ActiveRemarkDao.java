package com.gmu.crm.workbench.dao;

import com.gmu.crm.workbench.domain.ActivityRemark;

import java.util.List;

public interface ActiveRemarkDao {
    int getCountByAid(String[] ids);

    int delete(String[] ids);

    List<ActivityRemark> getRemarkInfo(String activityId);

    int deleteRemark(String id);

    int saveRemark(ActivityRemark ar);

    int updateRemark(ActivityRemark ar);
}
