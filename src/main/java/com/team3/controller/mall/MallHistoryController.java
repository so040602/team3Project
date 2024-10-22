package com.team3.controller.mall;

import java.util.List;

import com.team3.controller.SuperClass;
import com.team3.controller.product.ProductListController;
import com.team3.model.bean.Order;
import com.team3.model.dao.MallDao;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class MallHistoryController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		if(super.loginfo==null) {
			super.youNeedLogin();
			return ;
		}
		
		MallDao dao = new MallDao() ;
		
		List<Order> orderList = dao.getHistory(super.loginfo.getMemid()) ;
		
		if(orderList.size() == 0) {
			String message = "이전 결제 내역이 존재하지 않습니다.";
			super.setAlertMessage(message); 
			new ProductListController().doGet(request, response); 
			
		} else {
			System.out.println("결제 건수 : " + orderList.size());
			
			request.setAttribute("orderList", orderList); 
			super.gotoPage("mall/maHistory.jsp"); 
		}
	}
}








