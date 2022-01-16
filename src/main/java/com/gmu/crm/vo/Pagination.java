package com.gmu.crm.vo;

import java.util.List;

public class Pagination<T> {
    private Integer total;
    private List<T> activity;

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    public List<T> getActivity() {
        return activity;
    }

    public void setActivity(List<T> activity) {
        this.activity = activity;
    }
}
