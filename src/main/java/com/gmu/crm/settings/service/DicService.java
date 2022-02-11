package com.gmu.crm.settings.service;

import com.gmu.crm.settings.dao.DicTypeDao;
import com.gmu.crm.settings.dao.DicValueDao;
import com.gmu.crm.settings.domain.DicType;
import com.gmu.crm.settings.domain.DicValue;
import com.gmu.crm.utils.MybatisUtil;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DicService {
    private static DicTypeDao dicTypeDao = MybatisUtil.getSqlSession().getMapper(DicTypeDao.class);
    private static DicValueDao dicValueDao = MybatisUtil.getSqlSession().getMapper(DicValueDao.class);

    public Map<String, List<DicValue>> dicInit() {
        Map<String,List<DicValue>> map = new HashMap<>();
        List<DicType> dicTypeList = dicTypeDao.getDicType();
        for (DicType dicType:dicTypeList) {
            String typeCode = dicType.getCode();
            List<DicValue> dicValues = dicValueDao.getDicValue(typeCode);
            map.put(typeCode,dicValues);
        }
        return map;
    }
}
