package com.team3.model.mall;

import java.util.Map;
import java.util.Scanner;

// CartManager 클래스를 위한 한시적 테스트용 클래스입니다.
public class CartTest {
	public static void main(String[] args) {
		CartManager manager = new CartManager(); // 카트 관리자 객체
		CartMap cartMap = new CartMap() ;
		
		System.out.println("매장내 어떤 품목들이 존재하나요?");
		Map<Integer, CartItem> itemList =  cartMap.GetItemList();
		
		for(Integer key : itemList.keySet()) {
			CartItem item = itemList.get(key) ;
			System.out.println(item);
		}
		System.out.println("----------------------------------------------"); 
		
		Scanner scan = new Scanner(System.in) ;
		int pnum = 0, qty = 0 ;
		
		while(true) {
			System.out.println("\n1.카트 목록, 2.추가, 3.삭제, 4.수정, 5.품목 갯수 확인, 6.비우기, 0.종료"); 
			int menu = scan.nextInt() ;
			
			switch (menu) {
			case 1:
				System.out.println("구매 수량 정보");
				Map<Integer, Integer> cartList = manager.GetAllCartList();
				System.out.println(cartList);
				break;
				
			case 2:
				System.out.print("카트에 담을 상품 번호 입력 : ");
				pnum = scan.nextInt();
				
				System.out.print("구매 수량 입력 : ");
				qty = scan.nextInt();
				
				manager.AddCart(pnum, qty);
				break;
				
			case 3:
				System.out.print("삭제할 상품 번호 입력 :");
				pnum = scan.nextInt() ;				
				
				manager.DeleteCart(pnum);					
				break;
				
			case 4:
				System.out.println("수정시 이전 개수를 덮어 쓰기 합니다.");
				System.out.print("수정할 상품 번호 입력 :");
				pnum = scan.nextInt() ;		
				
				System.out.print("구매 수량 입력 : ");
				qty = scan.nextInt();				
				
				manager.EditCart(pnum, qty);				
				break;
				
			case 5: // 품목 갯수 확인
				int size = manager.GetCartItemSize(); 
				System.out.println("구매할 품목 갯수 : " + size);
				
				break;
				
			case 6: // 6.비우기 
				System.out.println("모든 품목을 카트에서 비웁니다.");
				manager.RemoveAllCart();
				break;
				
			case 0:
				System.out.println("프로그램을 종료합니다.");
				System.exit(0); // 정상적으로 종료가 되었음을 운영 체제에게 알려줍니다.				
			}
		}
	}
}








