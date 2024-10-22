package com.team3.model.mall;

import java.util.HashMap;
import java.util.Map;

// 이 클래스는 테스트용으로 CartItem 목록을 저장하고 있는 한시적 클래스입니다.
// 차후 데이터 베이스를 이용하여 처리할 예정입니다.
public class CartMap {
	// 우리 매장에서 판매 가능한 품목 리스트
	private Map<Integer, CartItem> itemList = null ; 
	
	public CartMap() {
		this.itemList = new HashMap<Integer, CartItem>();
		
		// CartItem(String id, int pnum, String pname, int qty, int price, String image01, int point) {
		
		// 목록에 채워 넣기
		itemList.put(1, new CartItem(null, 1, "우유", 10, 1000, "aaa.png", 5)) ;
		itemList.put(2, new CartItem(null, 2, "요거트", 20, 2000, "bbb.png", 15)) ;
		itemList.put(3, new CartItem(null, 3, "라면", 30, 3000, "ccc.png", 25)) ;
		itemList.put(4, new CartItem(null, 4, "채소", 40, 4000, "ddd.png", 35)) ;
		itemList.put(5, new CartItem(null, 5, "고기", 50, 5000, "eee.png", 45)) ;
	}
	
	public Map<Integer, CartItem> GetItemList(){
		return this.itemList ; // 전체 목록 반환
	}
}
