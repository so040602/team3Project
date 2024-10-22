package com.team3.controller.product;


import com.team3.controller.SuperClass;
import com.team3.model.bean.Product;
import com.team3.model.dao.ProductDao;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ProductDetailController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);

		int pnum = Integer.parseInt(request.getParameter("pnum"));
		
		ProductDao dao = new ProductDao() ;
		Product bean = dao.getDataByPk(pnum) ;
		
		if(bean == null) {
			super.setAlertMessage("찾으시는 상품 목록이 존재하지 않습니다.");
			super.gotoPage("product/prdList.jsp");
			
		}else {
			request.setAttribute("bean", bean) ;
			super.gotoPage("product/prdDetail.jsp");
		}
	}
}
