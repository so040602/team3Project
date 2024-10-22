package com.team3.controller.mall;

import com.team3.controller.SuperClass;
import com.team3.controller.product.ProductListController;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class MallUpdateController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		if(super.mycart.GetCartItemSize()==0) {
			String message = "카트 목록이 존재하지 않아서, 상품 페이지로 이동합니다." ;
			super.setAlertMessage(message);
			new ProductListController().doGet(request, response); 
			
		}else {
			int pnum = Integer.parseInt(request.getParameter("pnum")) ;
			int qty = Integer.parseInt(request.getParameter("qty")) ;
			
			super.mycart.EditCart(pnum, qty); 
			super.session.setAttribute("mycart", mycart);
			new MallListController().doGet(request, response); 
		}
		
	}
}
