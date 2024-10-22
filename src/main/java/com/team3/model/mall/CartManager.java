package com.team3.model.mall;

import java.util.HashMap;
import java.util.Map;

// 매장 내 나의 카트를 관리하기 위한 유틸리티 클래스입니다.
public class CartManager {
	// carts : 나의 카트에 담겨져 있는 상품들의 번호와 구매 수량 정보
	// 카트의 품목은 <상품번호, 구매수량>의 형식으로 저장되어 있습니다.
	private Map<Integer, Integer> carts = null ;
	
	public CartManager() {
		this.carts = new HashMap<Integer, Integer>() ;
	}
	
	public int GetCartItemSize() {
		// 카트에 담겨져 있는 품목의 갯수를 반환합니다.
		return this.carts.size();
	}
	
	public void AddCart(int pnum, int qty) {
		// 카트에 상품을 추가합니다.
		if (this.carts.containsKey(pnum)) {
			int newQty = this.carts.get(pnum) + qty ;
			this.carts.put(pnum, newQty);
		} else {
			this.carts.put(pnum, qty);
		}		
	}
	
	public void EditCart(int pnum, int qty) {
		// 카트 내의 수량을 변경합니다.(덮어 쓰기_overwrite)
		this.carts.put(pnum, qty);
	}
	
	public void DeleteCart(int pnum) {
		// 해당 품목을 Cart에서 제거합니다.
		this.carts.remove(pnum) ;
	}
	
	public void RemoveAllCart() {
		// 카트에 있는 모든 상품들을 제거합니다.(결제시 사용 가능)
		this.carts.clear();
	}
	
	public Map<Integer, Integer> GetAllCartList(){
		// 카트 내의 모든 품목들을 반환합니다.
		return this.carts ;
	}
}