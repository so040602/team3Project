package com.team3.controller.mall;


import com.team3.controller.SuperClass;
import com.team3.controller.product.ProductListController;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class MallInsertController extends SuperClass {
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		
		if(super.loginfo == null) {
			super.youNeedLogin();
			return ;
		}
		
		int stock = Integer.parseInt(request.getParameter("stock")) ;
		int qty = Integer.parseInt(request.getParameter("qty")) ;
		
		if(stock < qty) {
			String message = "재고 수량이 부족합니다.";
			super.setAlertMessage(message);
			new ProductListController().doGet(request, response); 
			
		}else {
			int pnum = Integer.parseInt(request.getParameter("pnum")) ;
			super.mycart.AddCart(pnum, qty); 
			super.session.setAttribute("mycart", mycart);
			
			// new MallListController().doGet(request, response); 
		}	

	}
}
