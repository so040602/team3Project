package com.team3.controller.mall;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.team3.controller.SuperClass;
import com.team3.controller.product.ProductListController;
import com.team3.model.dao.ProductDao;
import com.team3.model.mall.CartItem;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class MallListController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
//		System.out.println("여기는 MallListController 클래스");
		
		if(super.loginfo == null) {
			super.youNeedLogin();
			return ;
		}		
		
		int cartItemSize = super.mycart.GetCartItemSize() ;
		
		System.out.println("카트 품목 갯수 : " + cartItemSize ); 
		
		if(cartItemSize == 0) {
			String message = "카트에 품목이 없어서 상품 목록 페이지로 이동하겠습니다." ;
			super.setAlertMessage(message); 
			new ProductListController().doGet(request, response); 
			
		}else {
			// cartItemList 객체는 나의 카트 내에 있는 품목 리스트 정보를 가지고 있는 객체입니다.
			/*
			 	cartItemList 예시
			 	상품 번호   구매 수량
			 	1         10
			 	2         15 
			    3         5
			*/
			Map<Integer, Integer> cartItemList = super.mycart.GetAllCartList();
			
			// cartWishList는 고객이 카트에 담은 품목들의 세부 정보를 저장하고 있는 List 컬렉션입니다.
			// 이 항목들이 jsp 파일 내에서 보여집니다.
			List<CartItem> cartWishList = new ArrayList<CartItem>() ;
			
			ProductDao dao = new ProductDao() ;
			
			for(Integer pnum : cartItemList.keySet()) {
				Integer qty = cartItemList.get(pnum) ;
				CartItem item = dao.getCartItem(pnum, qty);
				
				cartWishList.add(item) ;
			}
			
			
			// jsp 파일에서 참조할 속성(attribute)
			super.session.setAttribute("cartWishList", cartWishList);
			
			//super.gotoPage("mall/maList.jsp");
			response.sendRedirect("mall/maList.jsp"); // 리다이렉션 방식		 
		}
	}
}