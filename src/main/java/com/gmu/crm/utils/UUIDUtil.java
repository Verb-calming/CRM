package com.gmu.crm.utils;

import java.util.UUID;

public class UUIDUtil {
    private UUIDUtil(){}

    /**
     *
     * @return
     */
    public static String getUUID() {
        return UUID.randomUUID().toString().replaceAll("-","");
    }
}
