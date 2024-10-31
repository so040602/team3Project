package com.team3.controller.book;

import java.util.ArrayList;
import java.util.List;

import com.team3.controller.SuperClass;
import com.team3.model.bean.OutCart;
import com.team3.model.dao.BookDao;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BookMarkController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doGet(request, response);
		
		if(super.loginfo==null) {
			super.youNeedLogin();
			return ;
		}
		
		int memidx = super.loginfo.getMemidx();
		List<OutCart> outCartList = new ArrayList<OutCart>();
		
		BookDao dao = new BookDao();
		
		outCartList = dao.getOutCartList(memidx);
		OutCart bean2 = new OutCart();
		
		for(OutCart bean : outCartList) {
			bean2 = bean;
			System.out.println("bean : " + bean);
		}
		
		request.setAttribute("datalist", outCartList);
		super.gotoPage("book/bookMark.jsp");
	}

}
