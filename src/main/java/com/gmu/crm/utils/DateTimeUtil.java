package com.gmu.crm.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateTimeUtil {
    private DateTimeUtil(){}

    /**
     * 获取系统时间
     * @return 系统时间格式为 yyyy-MM-dd HH:mm:ss 的时间
     */
    public static String getSysTime() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date();
        String dateStr = sdf.format(date);
        return dateStr;
    }
}
