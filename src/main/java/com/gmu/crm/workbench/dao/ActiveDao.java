package com.gmu.crm.workbench.dao;

import com.gmu.crm.workbench.domain.Activity;

import java.util.List;
import java.util.Map;

public interface ActiveDao {
    int addActive(Activity activity);

    int getTotalByCondition(Map<String, Object> map);

    List<Activity> getActivityListByCondition(Map<String,Object> map);

    int delete(String[] ids);

    Activity getActivityById(String id);

    int updateActive(Activity activity);

    Activity getActivityDetailById(String id);

    List<Activity> showActivityList(String clueId);

    List<Activity> selectAllUnLinkedActivity(String clueId);

    List<Activity> searchName(Map<String, String> map);

    List<Activity> selectActivity();

    List<Activity> selectActivityByName(String name);
}
