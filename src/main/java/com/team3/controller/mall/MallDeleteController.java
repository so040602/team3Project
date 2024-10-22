package com.team3.controller.mall;

import com.team3.controller.SuperClass;
import com.team3.controller.product.ProductListController;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class MallDeleteController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		if(super.mycart.GetCartItemSize()==0) {
			String message = "카트 목록이 존재하지 않아서, 상품 페이지로 이동합니다." ;
			super.setAlertMessage(message);
			new ProductListController().doGet(request, response); 
			
		}else {
			// pnum : 카트 목록에서 제거하고자 하는 상품의 번호
			int pnum = Integer.parseInt(request.getParameter("pnum")) ;	
			super.mycart.DeleteCart(pnum);  
			super.session.setAttribute("mycart", mycart);
			//new MallListController().doGet(request, response);
		}		
	}
}
