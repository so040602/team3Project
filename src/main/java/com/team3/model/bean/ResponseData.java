package com.team3.model.bean;

import java.util.List;

public class ResponseData {
	private List<Book> datalist;
    private Paging pagelist;

    public ResponseData(List<Book> datalist, Paging pagelist) {
        this.datalist = datalist;
        this.pagelist = pagelist;
    }

    public List<Book> getDatalist() {
        return datalist;
    }

    public Paging getPagelist() {
        return pagelist;
    }

}
