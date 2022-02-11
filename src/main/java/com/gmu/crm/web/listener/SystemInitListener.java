package com.gmu.crm.web.listener;

import com.gmu.crm.settings.domain.DicValue;
import com.gmu.crm.settings.service.DicService;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.*;

public class SystemInitListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        // 添加数据字典到全局作用域对象中
        ServletContext application = sce.getServletContext();
        DicService dicService = new DicService();
        Map<String, List<DicValue>> map = dicService.dicInit();
        Set<String> set = map.keySet();
        for (String key:set
             ) {
            application.setAttribute(key,map.get(key));
        }

        // 将各个阶段对应的可能性添加到全局作用域对象中
        ResourceBundle bundle = ResourceBundle.getBundle("Stage2Possibility");
        Enumeration<String> e = bundle.getKeys();
        Map<String,String> pMap = new HashMap<>();
        while (e.hasMoreElements()) {
            String key = e.nextElement();
            String value = bundle.getString(key);
            pMap.put(key,value);
        }
        application.setAttribute("pMap",pMap);
    }
}
