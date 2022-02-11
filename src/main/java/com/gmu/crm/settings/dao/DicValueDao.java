package com.gmu.crm.settings.dao;

import com.gmu.crm.settings.domain.DicValue;

import java.util.List;

public interface DicValueDao {
    List<DicValue> getDicValue(String typeCode);
}
