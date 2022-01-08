package com.gmu.crm.utils;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class PrintJson {
    private PrintJson(){}

    /**
     * 将boolean值解析为json串
     * @param response HttpServletResponse对象
     * @param flag 需要解析的boolean值
     */
    public static void PrintJsonFlag(HttpServletResponse response,boolean flag) {
        Map<String,Boolean> map = new HashMap<>();
        map.put("succeed",flag);
        ObjectMapper om = new ObjectMapper();
        try {
            String json = om.writeValueAsString(map);
            response.getWriter().print(json);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void PrintJsonObj(HttpServletResponse response,Object obj) {
        ObjectMapper om = new ObjectMapper();
        try {
            String json = om.writeValueAsString(obj);
            response.getWriter().print(json);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
