package com.team3.controller.mall;

import java.util.HashMap;
import java.util.Map;

import com.team3.controller.SuperClass;
import com.team3.controller.product.ProductListController;
import com.team3.model.dao.MallDao;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class MallCalculateController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		MallDao dao = new MallDao() ; 
		
		boolean rightnow = Boolean.parseBoolean(request.getParameter("rightnow")) ;
		
		if(rightnow) { // 즉시 구매
			System.out.println("`바로구매`하시렵니까?");
			
			int qty = Integer.parseInt(request.getParameter("qty"));
			int stock = Integer.parseInt(request.getParameter("stock"));
			
			if(stock < qty) {
				String message = "재고 수량이 부족하여 판매가 불가능합니다.";
				super.setAlertMessage(message);
				
				new ProductListController().doGet(request, response);
				
			} else {
				int pnum = Integer.parseInt(request.getParameter("pnum"));
				
				Map<Integer, Integer> soldItem = new HashMap<Integer, Integer>();
				soldItem.put(pnum, qty); // 즉시 구매할 상품의 `상품 번호`와 `구매 수량`
				
				dao.calculate(super.loginfo, soldItem);
			}
			
			
		} else { // 내 카트 목록에서 구매
			// 다오를 이용하여 결제합니다.
			dao.calculate(super.loginfo, super.mycart.GetAllCartList());
			
			// 결제가 마무리 되면 session 영역의 카트 정보를 지웁니다.
			super.session.removeAttribute("mycart"); 
			
			new ProductListController().doGet(request, response);
		}		
		
	}
}
