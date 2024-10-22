package com.team3.controller.mall;

import java.util.List;

import com.team3.controller.SuperClass;
import com.team3.model.bean.Order;
import com.team3.model.dao.MallDao;
import com.team3.model.mall.CartItem;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// 나의 매출 중에서 1건에 대한 상세 정보를 조회합니다.
public class MallDetailController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {	
		super.doGet(request, response);
		
		if(super.loginfo==null) {
			super.youNeedLogin();
			return ;
		}
		
		MallDao dao = new MallDao() ;
		
		int oid = 1; // Integer.parseInt(request.getParameter("oid")) ;
		
		Order order = dao.getDetailHistory(oid);
		List<CartItem> lists = dao.showDetail(oid) ;
		
		request.setAttribute("order", order); // 주문 정보
		request.setAttribute("lists", lists); // 쇼핑 정보
		
		super.gotoPage("mall/maDetail.jsp"); 
	}
}








